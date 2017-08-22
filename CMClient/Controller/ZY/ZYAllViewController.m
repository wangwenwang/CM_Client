//
//  ZYAllViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/3/7.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "ZYAllViewController.h"
#import "UITableView+NoDataPrompt.h"
#import "ZYListService.h"
#import <MJRefresh.h>
#import "Tools.h"
#import "ZYListTableViewCell.h"
#import "ShipmentListModel.h"
#import "ZYinfoViewController.h"
#import <MBProgressHUD.h>

@interface ZYAllViewController ()<UITableViewDelegate, UITableViewDataSource, ZYListServiceDelegate> {
    
    AppDelegate *_app;
}

@property (nonatomic, strong) UITableView *tableView;

// TableView数据
@property (strong, nonatomic) NSMutableArray *zys;

// 未交付订单业务类
@property (strong, nonatomic) ZYListService *service;

// 加载第几页
@property (assign, nonatomic) NSInteger page;

@end


//请求状态
#define REQUSTSTATUS @""
#define kPageCount 20
#define kCellHeight 103

@implementation ZYAllViewController


- (instancetype)init {
    if(self = [super init]) {
        
        _zys = [[NSMutableArray alloc] init];
        _service = [[ZYListService alloc] init];
        _service.delegate = self;
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.tableView];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        usleep(500000);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_tableView.mj_header beginRefreshing];
        });
    });
    
    [_tableView noOrder:[Tools zyStatusConversionPrompt:REQUSTSTATUS]];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 控件GET方法

- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] init];
        
        _tableView.separatorStyle = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 49 - 64 - CheckOrderViewControllerMenuHeight)];
        
        //    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self registCell];
        
        /// 下拉刷新
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDataDown)];
        header.lastUpdatedTimeLabel.hidden = YES;
        _tableView.mj_header = header;
        
        /// 上拉分页加载
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDataUp)];
        _tableView.mj_footer.hidden = YES;
    }
    
    return _tableView;
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _zys.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kCellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"ZYListTableViewCell";
    
    ZYListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    ShipmentListModel *m = _zys[indexPath.row];
    
    cell.shipmentListM = m;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ShipmentListModel *m = _zys[indexPath.row];
    ZYInfoViewController *vc = [[ZYInfoViewController alloc] init];
    vc.shipmentInfoIdx = m.iDX;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - 功能函数

- (void)registCell {
    [_tableView registerNib:[UINib nibWithNibName:@"ZYListTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZYListTableViewCell"];
}


- (void)loadMoreDataUp {
    if([Tools isConnectionAvailable]) {
        
        _page ++;
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [_service GetShipmentList:_app.user.iDX andSHIPMENT_STATE:REQUSTSTATUS andSTART_DATE:@"2014-03-01 17:58:37" andEND_DATE:@"2018-03-01 17:58:37" andPAGE:_page andPAGE_COUNT:kPageCount];
    }else {
        [Tools showAlert:self.view andTitle:@"网络连接不可用"];
    }
}


- (void)loadMoreDataDown {
    if([Tools isConnectionAvailable]) {
        
        _page = 1;
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [_service GetShipmentList:_app.user.iDX andSHIPMENT_STATE:REQUSTSTATUS andSTART_DATE:@"2014-03-01 17:58:37" andEND_DATE:@"2018-03-01 17:58:37" andPAGE:_page andPAGE_COUNT:kPageCount];
    }else {
        
        [Tools showAlert:self.view andTitle:@"网络连接不可用"];
    }
}


#pragma mark - ZYListServierDelegate

- (void)successOfZYList:(NSArray *)zys {
    
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    [_tableView removeNoDataPrompt];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    //页数处理
    if(_page == 1) {
        
        _zys = [zys mutableCopy];
    } else {
        
        for(int i = 0; i < zys.count; i++) {
            
            ShipmentListModel *m = zys[i];
            [_zys addObject:m];
        }
    }
    
    //是否隐藏上拉
    if(_zys.count >= kPageCount) {
        
        _tableView.mj_footer.hidden = NO;
    }else {
        
        _tableView.mj_footer.hidden = YES;
    }
    
    [_tableView reloadData];
}


- (void)successOfZYListNoData {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    
    if(_page == 1) {
        
        [_zys removeAllObjects];
        [_tableView noOrder:[Tools zyStatusConversionPrompt:REQUSTSTATUS]];
    } else {
        
        // 已加载完毕
        [_tableView.mj_footer endRefreshingWithNoMoreData];
        [_tableView removeNoDataPrompt];
        [_tableView.mj_footer setCount_NoMoreData:_zys.count];
    }
    
    [_tableView reloadData];
}


- (void)failureOfZYList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    [Tools showAlert:self.view andTitle:msg];
    
    [_zys removeAllObjects];
    [_tableView reloadData];
    [_tableView noOrder:[Tools zyStatusConversionPrompt:REQUSTSTATUS]];
}

@end
