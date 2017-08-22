//
//  SupplyListViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "SupplyListViewController.h"
#import "UINavigationController+Title.h"
#import "SupplyListService.h"
#import "Tools.h"
#import <MBProgressHUD.h>
#import "SupplyListTableViewCell.h"
#import "SupplyListModel.h"
#import <MJRefresh.h>
#import "SupplyInfoViewController.h"
#import "UITableView+NoDataPrompt.h"
#import <Masonry.h>
#import "CreateSupplyViewController.h"
#import "JSDropDownMenu.h"
#import "CreateSupplyService.h"

@interface SupplyListViewController ()<UITableViewDelegate, UITableViewDataSource, SupplyListServiceDelegate, JSDropDownMenuDataSource,JSDropDownMenuDelegate, CreateSupplyServiceDelegate> {
    
    NSMutableArray *_data1;
    NSMutableArray *_data2;
    NSMutableArray *_data3;
    
    NSInteger _currentData1Index;
    NSInteger _currentData2Index;
    NSInteger _currentData3Index;
    
    NSInteger _currentData1SelectedIndex;
    JSDropDownMenu *_filterView;
}

@property (nonatomic, strong) UITableView *tableView;

// 装运里的订单
@property (nonatomic, strong) NSMutableArray *supplys;

@property (nonatomic, strong) SupplyListService *service;

// 加载第几页
@property (assign, nonatomic) NSUInteger page;

// 请求车辆类型、尺寸
@property (strong, nonatomic) CreateSupplyService *service_createSuppsy;

//
@property (strong, nonatomic) AppDelegate *app;

// 车辆类型、尺寸
@property (strong, nonatomic) GetItemListModel *itemListM;

// 下拉开始
//@property (strong, nonatomic)

@end

@implementation SupplyListViewController

#define kTitle @"历史发布"
#define kCellName @"SupplyListTableViewCell"
#define kSUPPLY_STATE @"OPEN"
#define kPageCount 20
#define kCellHeight 166

#pragma mark - 生命周期
- (instancetype)init {
    if(self = [super init]) {
        
        self.tabBarItem.title = @"货源";
        _service = [[SupplyListService alloc] init];
        _service.delegate = self;
        self.tabBarItem.image = [UIImage imageNamed:@"ic_supply"];
        _service_createSuppsy = [[CreateSupplyService alloc] init];
        _service_createSuppsy.delegate = self;
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        _itemListM = [[GetItemListModel alloc] init];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self addNotification];
    
    [self initDownMenu];
    
    [self.view addSubview:self.tableView];
    
    [_tableView.mj_header beginRefreshing];
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.tabBarController.navigationItem.rightBarButtonItem = nil;
    [Tools addTabBarRightItemTypeAdd:self andAction:@selector(createSupply)];
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self.navigationController titleText:kTitle andColor:CMWhiteColor];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    
    [self removeNotification];
}


#pragma mark - 功能函数

- (void)createSupply {
    
    if(_itemListM.supplyType.count == 1 && _itemListM.vehicleType.count == 1 && _itemListM.vehicleSize.count == 1) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [Tools showAlert:self.view andTitle:@"数据正在加载，稍等片刻..."];
        return;
    }
    
    CreateSupplyViewController *vc = [[CreateSupplyViewController alloc] init];
    vc.itemListM = _itemListM;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)registCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
}


- (void)requestNetworkData {
    
    NSString *vehicleType = @"";
    
    NSString *vehicleSize = @"";
    
    NSDictionary *dict = @{@"ORG_IDX" : @"",
                           @"SUPPLY_VEHICLE_TYPE" : vehicleType,
                           @"SUPPLY_VEHICLE_SIZE" : vehicleSize,
                           @"ROUTES_CITY" : @""
                           };
    
    NSArray *array = @[dict];
    NSDictionary *dict1 = @{@"result" : array};
    NSString *result = [Tools JsonStringWithDictonary:dict1];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    // 当前时间
    NSString *nowTime = [Tools getCurrentDate];
    
    [_service GetSupplyList:result andSTART_DATE:@"2014-03-01 17:58:37" andEND_DATE:nowTime andSUPPLY_STATE:@"" andPAGE:_page andPAGE_COUNT:kPageCount andUSER_IDX:_app.user.iDX andSUPPLY_WOKERFLOW:@"" andDRIVER_IDX:@""];
}


- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestNetworkData:) name:kSupplyListVC_refreshNetworkData_Notification object:nil];
}


- (void)removeNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kSupplyListVC_refreshNetworkData_Notification object:nil];
}

- (void)requestNetworkData:(NSNotification *)aNotify {
    
    NSString *msg = aNotify.userInfo[@"msg"];
    [Tools showAlert:self.view andTitle:msg andTime:3];
    _page = 1;
    [self requestNetworkData];
}


- (void)initDownMenu {
    
    // 指定默认选中
    _currentData1Index = 0;
    _currentData1SelectedIndex = 0;
    
    _data1 = [_itemListM.supplyType mutableCopy];
    _data2 = [_itemListM.vehicleSize mutableCopy];
    _data3 = [_itemListM.vehicleType mutableCopy];
    
    _filterView = [[JSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:45];
    _filterView.indicatorColor = [UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1.0];
    _filterView.separatorColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0];
    _filterView.textColor = [UIColor colorWithRed:83.f/255.0f green:83.f/255.0f blue:83.f/255.0f alpha:1.0f];
    _filterView.dataSource = self;
    _filterView.delegate = self;
}


#pragma mark - 控件GET方法

- (UITableView *)tableView {
    
    if(!_tableView) {
        
        _tableView = [[UITableView alloc] init];
        
        _tableView.separatorStyle = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView setFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 49 - 64)];
        
        [self registCell];
        
        /// 下拉刷新
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDataDown)];
        header.lastUpdatedTimeLabel.hidden = YES;
        _tableView.mj_header = header;
        
        // 上拉分页加载
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDataUp)];
        _tableView.mj_footer.hidden = YES;
        
//        // headView
//        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 55)];
//        
//        // 筛选View
//        [headView addSubview:_filterView];
//        
//        // 空白View
//        UIView *blankView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_filterView.frame), ScreenWidth, 15)];
//        blankView.backgroundColor = [UIColor groupTableViewBackgroundColor];
//        [headView addSubview:blankView];
        
        // headView 赋给tableView
//        _tableView.tableHeaderView = _filterView;
    }
    
    return _tableView;
}


- (void)loadMoreDataUp {
    
    if([Tools isConnectionAvailable]) {
        
        _page ++;
        [self requestNetworkData];
    } else {
        [Tools showAlert:self.view andTitle:@"网络连接不可用"];
    }
}


- (void)loadMoreDataDown {
    
    if([Tools isConnectionAvailable]) {
        
        _page = 1;
        [self requestNetworkData];
        
        [_service_createSuppsy GetItemLis:_app.user.iDX];
    } else {
        
        [Tools showAlert:self.view andTitle:@"网络连接不可用"];
    }
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SupplyListModel *m = _supplys[indexPath.row];
    return m.cellHeight;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _supplys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellid = kCellName;
    
    SupplyListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid forIndexPath:indexPath];
    
    SupplyListModel *m = _supplys[indexPath.row];
    
    cell.supplyListM = m;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SupplyListModel *m = _supplys[indexPath.row];
    
    SupplyInfoViewController *vc = [[SupplyInfoViewController alloc] init];
    
    vc.supplyListM = m;
    
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - CreateSupplyServiceDelegate

- (void)successOfGetItemList:(GetItemListModel *)itemListM {
    
    _itemListM = itemListM;
    [self initDownMenu];
}


- (void)failureOfGetItemList:(NSString *)msg {
    
    [Tools showAlert:self.view andTitle:msg];
}


#pragma mark - SupplyListServiceDelegate

- (void)successOfSupplyList:(NSArray *)supplys {
    
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    // 页数处理
    if(_page == 1) {
        
        _supplys = [supplys mutableCopy];
    } else {
        
        for(int i = 0; i < supplys.count; i++) {
            
            SupplyListModel *m = supplys[i];
            [_supplys addObject:m];
        }
    }
    
    // 线路城市处理换行
    CGFloat usedWidth = 48 + 20;    // 已使用宽度
    for (int i = 0; i < _supplys.count; i++) {
        
        SupplyListModel *m = _supplys[i];
        
        CGFloat textHeight = [Tools getHeightOfString:[Tools routesCityConvert:m.rOUTESCITY] fontSize:14.0 andWidth:ScreenWidth - usedWidth];
        CGFloat oneLineHeight = [Tools getHeightOfString:@"一行高度" fontSize:14.0 andWidth:ScreenWidth - usedWidth]; // 这个55要自己手动量Cell里的距离
        if(textHeight > oneLineHeight) {
            
            m.cellHeight = kCellHeight + textHeight - oneLineHeight - 3; // 为了配合SupplyListTableViewCell里的3
        } else {
            m.cellHeight = kCellHeight;
        }
    }
    
    //是否隐藏上拉
    if(_supplys.count >= kPageCount) {
        
        _tableView.mj_footer.hidden = NO;
    }else {
        
        _tableView.mj_footer.hidden = YES;
    }
    
    [_tableView removeNoDataPrompt];
    
    [_tableView reloadData];
}


- (void)successOfSupplyListNoData {
    
    [_tableView.mj_header endRefreshing];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    if(_page == 1) { // 没有数据
        
        [_supplys removeAllObjects];
        _tableView.mj_footer.hidden = YES;
        [_tableView noSupply:@"暂时还没有货源，晚点再来看看"];
    } else {  // 已加载完毕
        
        [_tableView.mj_footer endRefreshingWithNoMoreData];
        [_tableView removeNoDataPrompt];
        [_tableView.mj_footer setCount_NoMoreData:_supplys.count];
    }
    
    [_tableView reloadData];
}


- (void)failureOfSupplyList:(NSString *)msg {
    
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
    [_supplys removeAllObjects];
    [_tableView reloadData];
    [_tableView noSupply:msg];
}


#pragma mark - JSDropDownMenuDelegate

- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu {
    
    return 3;
}

// 是否两栏TableView
-(BOOL)haveRightTableViewInColumn:(NSInteger)column{
    
    return NO;
}


// 下拉View 宽度
-(CGFloat)widthRatioOfLeftColumn:(NSInteger)column{
    
    return 1;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column{
    
    if (column==0) {
        
        return _currentData1Index;
    }
    if (column==1) {
        
        return _currentData2Index;
    }
    if (column==2) {
        
        return _currentData3Index;
    }
    return 0;
}

- (NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow{
    
    if (column==0) {
        
        return _data1.count;
    } else if (column==1){
        
        return _data2.count;
    } else if (column==2){
        
        return _data3.count;
    }
    return 0;
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column{
    
    switch (column) {
        case 0: return _data1[_currentData1Index];
            break;
        case 1: return _data2[_currentData2Index];
            break;
        case 2: return _data3[_currentData3Index];
            break;
        default:
            return nil;
            break;
    }
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForRowAtIndexPath:(JSIndexPath *)indexPath {
    
    if(indexPath.column == 0) {
        
        return _data1[indexPath.row];
    } else if(indexPath.column == 1) {
        
        return _data2[indexPath.row];
    } else if(indexPath.column == 2) {
        
        return _data3[indexPath.row];
    } else {
        
        return @"LM";
    }
}

- (void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath {
    
    if (indexPath.column == 0) {
        
        _currentData1Index = indexPath.row;
        
    } else if(indexPath.column == 1){
        
        _currentData2Index = indexPath.row;
        
    } else if(indexPath.column == 2){
        
        _currentData3Index = indexPath.row;
    }
    
    [self requestNetworkData];
}

@end
