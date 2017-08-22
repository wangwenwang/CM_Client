//
//  TruckListViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/2/17.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "TruckListViewController.h"
#import "TruckDetailViewController.h"
#import "TruckListService.h"
#import <MBProgressHUD.h>
#import "Tools.h"
#import "AddTruckViewController.h"
#import "TruckListModel.h"
#import "TruckListTableViewCell.h"
#import "DeleteTruckService.h"
#import "UITableView+NoDataPrompt.h"
#import "SupplyInfoViewController.h"

@interface TruckListViewController () <UITableViewDelegate, UITableViewDataSource, TruckListServiceDelegate, SWTableViewCellDelegate, DeleteTruckServiceDelegate> {
    
    AppDelegate *_app;
}

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) TruckListModel *truckListModel;

@property (strong, nonatomic) TruckListService *service;

@property (strong, nonatomic) DeleteTruckService *serviceDel;

/// 是否选择车辆
@property (assign, nonatomic) BOOL isChoose;

@end

@implementation TruckListViewController


#define kCellName @"TruckListTableViewCell"


#pragma mark - 生命周期

- (instancetype)init {
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _service = [[TruckListService alloc] init];
        _service.delegate = self;
        _serviceDel = [[DeleteTruckService alloc] init];
        _serviceDel.delegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.navigationController.viewControllers.count > 0) {
        
        if([self.navigationController.viewControllers[1] isKindOfClass:[SupplyInfoViewController class]]) {
            
            _isChoose = YES;
        }
    }
    
    // 公司车队只能查看
    if([_FLEET_PROPERTY isEqualToString:kINDIVIDUAL]) {
        
        if(!_isChoose) [Tools addNavRightItemTypeAdd:self andAction:@selector(addTruck)];
    }
    
    [self.view addSubview:self.tableView];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self addNotification];
    
    [self requestNetWorkData];
    
    [_tableView noTruck:@"暂无车辆"];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    
    [self removeNotification];
}


#pragma mark - 功能函数
- (void)registerCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
}


- (void)requestNetWorkData {
    
    [_service GetVehicleList:_fleetIdx andUserId:_app.user.iDX];
}


- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestNetWorkData) name:kTruckListVC_RequestNetWorkData_Notification object:nil];
}


- (void)removeNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kTruckListVC_RequestNetWorkData_Notification object:nil];
}


- (NSArray *)rightButtons {
    
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:[UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f] title:@"Delete"];
    
    return rightUtilityButtons;
}


#pragma mark - 控件GET方法
- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] init];
        
        _tableView.separatorStyle = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64)];
        
        [self registerCell];
    }
    
    return _tableView;
}


#pragma mark - 事件
- (void)addTruck {
    
    AddTruckViewController *vc = [[AddTruckViewController alloc] init];
    vc.fleetIdx = _fleetIdx;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 75;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _truckListModel.truck.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellid = kCellName;
    
    TruckListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid forIndexPath:indexPath];
    
    TruckModel *m = _truckListModel.truck[indexPath.row];
    
    cell.plateNumberLabel.text = m.pLATENUMBER;
    cell.truckTypeLabel.text = m.vEHICLEMODEL;
    cell.truckSizeLabel.text = m.vEHICLESIZE;
    
    cell.rightUtilityButtons = [self rightButtons];
    cell.delegate = self;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TruckListTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    TruckModel *m = _truckListModel.truck[indexPath.row];
    
    if(_isChoose) {
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        NSDictionary *fleetM = @{@"truckM" : m};
        [[NSNotificationCenter defaultCenter] postNotificationName:kSupplyInfoVC_refreshTruck_Notification object:nil userInfo:fleetM];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
//        TruckDetailViewController *vc = [[TruckDetailViewController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark - SWTableViewCellDelegate

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
    
    TruckModel *m = _truckListModel.truck[cellIndexPath.row];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_serviceDel DeleteVehicle:_app.user.iDX andFLEET_ID:_fleetIdx andVEHICLE_IDX:m.iDX andCellIndexPathRow:cellIndexPath];
}


#pragma mark - TruckListServiceDelegate
- (void)successOfGetTruckList:(TruckListModel *)trucks {
    
    _truckListModel = trucks;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView removeNoDataPrompt];
    [_tableView reloadData];
}


- (void)successGetTruckListNoData {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}


- (void)failureOfGetTruckList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}



#pragma mark - DeleteTruckServiceDelegate

- (void)successOfDeleteTruck:(NSIndexPath *)indexPath {
    
    [_truckListModel.truck removeObjectAtIndex:indexPath.row];
    [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:@"删除成功"];
}


- (void)failureOfDeleteTruck:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
