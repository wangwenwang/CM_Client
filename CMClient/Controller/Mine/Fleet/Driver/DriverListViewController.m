//
//  DriverListViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/2/23.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "DriverListViewController.h"
#import "DriverDetailViewController.h"
#import "Tools.h"
#import "AddDriverViewController.h"
#import "DriverListService.h"
#import <MBProgressHUD.h>
#import "UITableView+NoDataPrompt.h"
#import "DriverListTableViewCell.h"
#import "DeleteDriverService.h"
#import "SupplyInfoViewController.h"
#import "InfoDriverService.h"

@interface DriverListViewController ()<UITableViewDelegate, UITableViewDataSource, DriverListServiceDelegate, SWTableViewCellDelegate, DeleteDriverServiceDelegate, InfoDriverServiceDelegate> {
    
    AppDelegate *_app;
}

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) DriverListService *service;

@property (strong, nonatomic) DeleteDriverService *serviceDel;

@property (strong, nonatomic) InfoDriverService *serviceInfo;

@property (strong, nonatomic) DriverListModel *driverListM;

/// 是否选择司机
@property (assign, nonatomic) BOOL isChoose;

@end


#define kCellName @"DriverListTableViewCell"
#define kNoDriverPrompt @"此车队还没有司机"

/// 授权文字
#define kInfoText_admin @"受权为管理员"
#define kInfoText_driver @"受权为司机"


@implementation DriverListViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        _service = [[DriverListService alloc] init];
        _service.delegate = self;
        _serviceDel = [[DeleteDriverService alloc] init];
        _serviceDel.delegate = self;
        _serviceInfo = [[InfoDriverService alloc] init];
        _serviceInfo.delegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if(self.navigationController.viewControllers.count > 0) {
        
        if([self.navigationController.viewControllers[1] isKindOfClass:[SupplyInfoViewController class]]) {
            
            _isChoose = YES;
        }
    } else {
        
        _isChoose = NO;
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 注册通知
    [self addNotification];
    
    // 请求数据
    [self requestNetWorkData];
    
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    
    [self removeNotification];
}


#pragma mark - 功能方法

- (void)registerCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
}


/**
 请求网络数据
 */
- (void)requestNetWorkData {
    
    [_service GetDriverList:_app.user.iDX andFleetIdx:_fleetIdx];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}


- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestNetWorkData) name:kDriverListVC_RequestNetWorkData_Notification object:nil];
}


- (void)removeNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kDriverListVC_RequestNetWorkData_Notification object:nil];
}


- (NSArray *)rightButtons:(NSString *)AdminOrDriverText {
    
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    
    if([AdminOrDriverText isEqualToString:kInfoText_admin]) {
        [rightUtilityButtons sw_addUtilityButtonWithColor:
         [UIColor colorWithRed:1.0f green:0.84f blue:0.0f alpha:1.0]
                                                    title:AdminOrDriverText];
    }
    
    if([AdminOrDriverText isEqualToString:kInfoText_driver]) {
        [rightUtilityButtons sw_addUtilityButtonWithColor:
         [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                    title:AdminOrDriverText];
    }
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"删除"];
    return rightUtilityButtons;
}


#pragma mark - 事件

- (void)addDriver {
    
    AddDriverViewController *vc = [[AddDriverViewController alloc] init];
    vc.fleetIdx = _fleetIdx;
    [self.navigationController pushViewController:vc animated:YES];
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


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _driverListM.driverModel.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = kCellName;
    
    DriverListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    DriverModel *driverM = _driverListM.driverModel[indexPath.row];
    cell.driverM = driverM;
    
    if([driverM.driverAuthorityModel.eNABLEADD isEqualToString:@"N"] || [driverM.driverAuthorityModel.eNABLEDELETE isEqualToString:@"N"]) {
        
        cell.rightUtilityButtons = [self rightButtons:kInfoText_admin];
    } else if([driverM.driverAuthorityModel.eNABLEADD isEqualToString:@"Y"] && [driverM.driverAuthorityModel.eNABLEDELETE isEqualToString:@"Y"] && [driverM.driverAuthorityModel.eNABLEINFO isEqualToString:@"N"]) {
        
        cell.rightUtilityButtons = [self rightButtons:kInfoText_driver];
    }
    
    cell.delegate = self;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DriverListTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    DriverModel *m = _driverListM.driverModel[indexPath.row];
    
    if(_isChoose) {
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        NSDictionary *fleetM = @{@"driverM" : m};
        [[NSNotificationCenter defaultCenter] postNotificationName:kSupplyInfoVC_refreshDriver_Notification object:nil userInfo:fleetM];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //        DriverDetailViewController *vc = [[DriverDetailViewController alloc] init];
        //        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark - SWTableViewCellDelegate

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell {
    
    return YES;
}


// prevent cell(s) from displaying left/right utility buttons
- (BOOL)swipeableTableViewCell:(SWTableViewCell *)cell canSwipeToState:(SWCellState)state {
    
    NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
    DriverModel *m = _driverListM.driverModel[cellIndexPath.row];
    
    if([m.driverAuthorityModel.eNABLEINFO isEqualToString:@"Y"]  || [m.iDX integerValue] == [_app.user.iDX integerValue]) {
        
        return NO;
    } else {
        
        return YES;
    }
}


- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    NSLog(@"%ld", (long)index);
    
    NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
    DriverModel *m = _driverListM.driverModel[cellIndexPath.row];
    
    
    
    // 受权为管理员
    if(index == 0 && ![m.driverAuthorityModel.eNABLEADD isEqualToString:@"Y"] && ![m.driverAuthorityModel.eNABLEDELETE isEqualToString:@"Y"]) {
        
        [_serviceInfo InfoDriver:_app.user.iDX andFLEET_ID:_fleetIdx andINFO_USER_IDX:m.iDX andINFO_TYPE:@"ADMIN"];
    }
    
    // 受权为司机
    else if(index == 0 && [m.driverAuthorityModel.eNABLEADD isEqualToString:@"Y"] && [m.driverAuthorityModel.eNABLEDELETE isEqualToString:@"Y"]) {
        
        [_serviceInfo InfoDriver:_app.user.iDX andFLEET_ID:_fleetIdx andINFO_USER_IDX:m.iDX andINFO_TYPE:@"DRIVER"];
    }
    
    // 删除
    else if(index == 1) {
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [_serviceDel DeleteDriver:_app.user.iDX andFLEET_ID:_fleetIdx andDRIVER_IDX:m.iDX andCellIndexPathRow:cellIndexPath];
    }
}


#pragma mark - DriverListServiceDelegate

- (void)successOfGetDriverList:(DriverListModel *)driverListM {
    
    // 司机排序，创建者放第一位
    NSMutableArray *arrM = [[NSMutableArray alloc] init];
    _driverListM = driverListM;
    for(int i = 0; i < _driverListM.driverModel.count; i++) {
        
        DriverModel *m = _driverListM.driverModel[i];
        if([m.driverAuthorityModel.eNABLEINFO isEqualToString:@"Y"]) {
            
            [arrM insertObject:m atIndex:0];
        } else {
            
            [arrM addObject:m];
        }
    }
    _driverListM.driverModel = arrM;
    
    
    [_tableView removeNoDataPrompt];
    [_tableView reloadData];
    
    
    // 公司车队只能查看
    if([_FLEET_PROPERTY isEqualToString:kINDIVIDUAL]) {
        
        if([driverListM.driverAuthorityModel.eNABLEADD isEqualToString:@"Y"]) {
            
            [Tools addNavRightItemTypeAdd:self andAction:@selector(addDriver)];
        }
    }
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}


- (void)successOfGetDriverListNoData {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_tableView noDriver:kNoDriverPrompt];
}


- (void)failureOfGetDriverList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
    [_tableView noDriver:kNoDriverPrompt];
}


#pragma mark - DeleteDriverServiceDelegate

- (void)successOfDeleteDriver:(NSIndexPath *)indexPath {
    
    [_driverListM.driverModel removeObjectAtIndex:indexPath.row];
    [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:@"删除成功"];
}


- (void)failureOfDeleteDriver:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}


#pragma mark - InfoDriverServiceDelegate

- (void)successOfInfoDriver {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:@"受权成功"];
    
    [self requestNetWorkData];
}


-(void)failureOfInfoDriver:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
