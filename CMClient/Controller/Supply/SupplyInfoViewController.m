//
//  SupplyInfoViewController.m
//  CMDriver
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "SupplyInfoViewController.h"
#import "SupplyInfoService.h"
#import "RoutesTableViewCell.h"
#import <MBProgressHUD.h>
#import "Tools.h"
#import "FleetListViewController.h"
#import "DriverListViewController.h"
#import "TruckListViewController.h"
#import "FleetModel.h"
#import "DriverModel.h"
#import "TruckModel.h"
#import "IB_UIButton.h"
#import "SupplyAuditService.h"
#import "TruckDetailViewController.h"
#import "DriverDetailViewController.h"
#import "LM_alert.h"

@interface SupplyInfoViewController ()<SupplyInfoServiceDelegate, SupplyAuditServiceDelegate>


// 货源单号
@property (weak, nonatomic) IBOutlet UILabel *SUPPLY_NO;

// 创建时间
@property (weak, nonatomic) IBOutlet UILabel *ADD_DATE;

// 到仓时间
@property (weak, nonatomic) IBOutlet UILabel *REQUEST_WAREHOUSE;

// 交付时间
@property (weak, nonatomic) IBOutlet UILabel *REQUEST_ISSUE;

// 发布公司
@property (weak, nonatomic) IBOutlet UILabel *ORG_NAME;

// 配送经验要求(司机要求)
@property (weak, nonatomic) IBOutlet UILabel *DRIVER_REQUEST;

// 司机搬运程度
@property (weak, nonatomic) IBOutlet UILabel *HANDLING_DEGREE;

// 备注（任务补充说明）
@property (weak, nonatomic) IBOutlet UILabel *TASK_DESCRIPTION;

// 线路城市
@property (weak, nonatomic) IBOutlet UILabel *ROUTES_CITY;

// 货物类型
@property (weak, nonatomic) IBOutlet UILabel *SUPPLY_TYPE;

// 是否返仓
@property (weak, nonatomic) IBOutlet UILabel *IS_RETURN_STORE;

// 是否需要回单
@property (weak, nonatomic) IBOutlet UILabel *IS_RETURN;

// 是否需要自带搬运
@property (weak, nonatomic) IBOutlet UILabel *IS_HANDLING;

// 是否有人帮忙装货
@property (weak, nonatomic) IBOutlet UILabel *HAVE_LOAD;

// 是否有人帮忙卸货
@property (weak, nonatomic) IBOutlet UILabel *HAVE_UNLOAD;

// 要求车辆尺寸
@property (weak, nonatomic) IBOutlet UILabel *SUPPLY_VEHICLE_SIZE;

// 要求车辆类型
@property (weak, nonatomic) IBOutlet UILabel *SUPPLY_VEHICLE_TYPE;

// 整车体积
@property (weak, nonatomic) IBOutlet UILabel *TOTAL_VOLUME;

// 整车重量
@property (weak, nonatomic) IBOutlet UILabel *TOTAL_WEIGHT;

// 总件数
@property (weak, nonatomic) IBOutlet UILabel *TOTAL_QTY;

// 运费金额
@property (weak, nonatomic) IBOutlet UILabel *TOTAL_AMOUNT;

// 货源状态
@property (weak, nonatomic) IBOutlet UILabel *SUPPLY_STATE;

// 货源流程
@property (weak, nonatomic) IBOutlet UILabel *SUPPLY_WOKERFLOW;

// App
@property (strong, nonatomic) AppDelegate *app;

// 货源详情服务
@property (strong, nonatomic) SupplyInfoService *service;

// 货源详情数据
@property (strong, nonatomic) SupplyInfoModel *supplyInfoM;

// 线路信息
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// ScrollContentView 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

// 货源详情提示View 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *supplyInfoPromptViewHeight;

// 货源详情View 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *supplyInfoViewHeight;

// 线路信息View 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *routesPromptViewHeight;

// 线路城市 bottom (备注 top)
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ROUTES_CITY_Bottom;

// 已选择的车队信息
@property (strong, nonatomic) FleetModel *chooseFleetM;

// 已选择的司机信息
@property (strong, nonatomic) DriverModel *chooseDriverM;

// 已选择的车辆信息
@property (strong, nonatomic) TruckModel *chooseTruckM;

// 统计换行长度
@property (weak, nonatomic) IBOutlet UILabel *ROUTES_CITY_PromptLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ROUTES_CITY_trailing;

// 按钮容器
@property (weak, nonatomic) IBOutlet UIView *UIButtonContainerView;

// 按钮
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *UIButtonViewHeight;

// 打回
- (IBAction)refuseOnclick:(IB_UIButton *)sender;

// 同意
- (IBAction)agreeOnclick:(IB_UIButton *)sender;

@property (strong, nonatomic) SupplyAuditService *service_Audit;

// 车队名称
@property (weak, nonatomic) IBOutlet UILabel *FLEET_NAME;

// 竞标信息提示
@property (weak, nonatomic) IBOutlet UIView *bidInfoPromptView;

// 竞标信息
@property (weak, nonatomic) IBOutlet UIView *bidInfoView;

// 竞标信息提示高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bidInfoPromptViewHeight;

// 竞标信息高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bidInfoViewHeight;

// 打回
@property (weak, nonatomic) IBOutlet IB_UIButton *refuseBtn;

// 同意
@property (weak, nonatomic) IBOutlet IB_UIButton *agreeBtn;

@end


#define kCellName @"RoutesTableViewCell"
#define kCellHeight 70


// 时间类型
typedef enum _ButtonType {
    
    Button_TYPE_Received  = 0,         // 已接收
    Button_TYPE_Completed,             // 已完成
    Button_TYPE_LeaveWarehouse,        // 已出库
} DateType;


@implementation SupplyInfoViewController


#pragma mark - 生命周期

- (instancetype)init {
    if(self = [super init]) {
        
        _service = [[SupplyInfoService alloc] init];
        _service.delegate = self;
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _service_Audit = [[SupplyAuditService alloc] init];
        _service_Audit.delegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"货源详情";
    
    [self initUI];
    
    [self requestNetworkData];
    
    [self registCell];
    
    if(
       
       ([_supplyListM.sUPPLYSTATE isEqualToString:@"OPEN"] && [_supplyListM.sUPPLYWOKERFLOW isEqualToString:@"已接单"])
       
       ||
       
       ([_supplyListM.sUPPLYSTATE isEqualToString:@"OPEN"] && [_supplyListM.sUPPLYWOKERFLOW isEqualToString:@"已确认"])
       
       ||
       
       ([_supplyListM.sUPPLYSTATE isEqualToString:@"OPEN"] && [_supplyListM.sUPPLYWOKERFLOW isEqualToString:@"已发运"])
       
      
       ) {
        
        if([_supplyListM.sUPPLYWOKERFLOW isEqualToString:@"已接单"]) {
            
            [_refuseBtn setTitle:@"退回竞标列表" forState:UIControlStateNormal];
            [_agreeBtn setTitle:@"确认" forState:UIControlStateNormal];
            _refuseBtn.tag = Button_TYPE_Received;
            _agreeBtn.tag = Button_TYPE_Received;
        } else if([_supplyListM.sUPPLYWOKERFLOW isEqualToString:@"已确认"]) {
            
            [_refuseBtn setTitle:@"退回已接单状态" forState:UIControlStateNormal];
            [_agreeBtn setTitle:@"发运出库" forState:UIControlStateNormal];
            _refuseBtn.tag = Button_TYPE_Completed;
            _agreeBtn.tag = Button_TYPE_Completed;
        } else if([_supplyListM.sUPPLYWOKERFLOW isEqualToString:@"已发运"]) {
            
            [_refuseBtn setTitle:@"拒收" forState:UIControlStateNormal];
            [_agreeBtn setTitle:@"完成" forState:UIControlStateNormal];
            _refuseBtn.tag = Button_TYPE_LeaveWarehouse;
            _agreeBtn.tag = Button_TYPE_LeaveWarehouse;
        }
    } else {
        
        [_bidInfoPromptView setHidden:YES];
        [_bidInfoView setHidden:YES];
        _bidInfoPromptViewHeight.constant = 0;
        _bidInfoViewHeight.constant = 0;
        
        _UIButtonViewHeight.constant = 0;
        [_UIButtonContainerView setHidden:YES];
    }
}


- (void)updateViewConstraints {
    
    [super updateViewConstraints];
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    
}


#pragma mark - 事件

// 选择运输车队
- (IBAction)chooseFleetOnclick:(UIButton *)sender {
    
    FleetListViewController *vc = [[FleetListViewController alloc] init];
    vc.title = @"选择车队";
    [self.navigationController pushViewController:vc animated:YES];
}


// 选择运输司机
- (IBAction)chooseDriverOnclick:(UIButton *)sender {
    
    if(_chooseFleetM) {
        
        DriverListViewController *vc = [[DriverListViewController alloc] init];
        
        vc.fleetIdx = _chooseFleetM.iDX;
        vc.title = @"司机";
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        
        [Tools showAlert:self.view andTitle:@"请选择车队"];
    }
}


// 选择运输车辆
- (IBAction)chooseTruckOnclick:(id)sender {
    
    if(_chooseFleetM) {
        
        TruckListViewController *vc = [[TruckListViewController alloc] init];
        vc.fleetIdx = _chooseFleetM.iDX;
        vc.title = @"选择车辆";
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        
        [Tools showAlert:self.view andTitle:@"请选择车队"];
    }
}


// 准备接收货源
- (IBAction)readyCommit:(UIButton *)sender {
    
    // 车队ID
    NSString *fleetID = _chooseFleetM.iDX;
    // 车队名字
    NSString *fleetName = _chooseFleetM.fLEETNAME;
    // 车辆ID
    NSString *vehicleID = _chooseTruckM.iDX;
    // 车牌号
    NSString *plateNumber = _chooseTruckM.pLATENUMBER;
    // 车辆类型
    NSString *vehicleType = _chooseTruckM.vEHICLEMODEL;
    // 车辆尺寸
    NSString *vehicleSize = _chooseTruckM.vEHICLESIZE;
    // 车辆品牌
    NSString *brandModel = @"";
    // 装载id
    NSString *shipmentId = _supplyListM.iDX;
    // 司机ID
    NSString *driverId = _app.user.iDX;
    // 司机名
    NSString *driverName = _app.user.uSERNAME;
    // 司机手机
    NSString *driverTel = _app.user.uSERCODE;
    // 版本号
    NSString *version = @"1.0";
    
    NSString *msg = @"";
    if(fleetID && ![fleetID isEqualToString:@""]) {
        
        if(driverId && ![driverId isEqualToString:@""]) {
            
            if(vehicleID && ![vehicleID isEqualToString:@""]) {
                
                [_service ReceivingSupply:_app.user.iDX andUSER_TEL:_app.user.uSERCODE andFLEET_IDX:fleetID andFLEET_NAME:fleetName andVEHICLE_IDX:vehicleID andPLATE_NUMBER:plateNumber andVEHICLE_TYPE:vehicleType andVEHICLE_SIZE:vehicleSize andBRAND_MODEL:brandModel andIDX:shipmentId andDRIVER_IDX:driverId andDRIVER_NAME:driverName andDRIVER_TEL:driverTel andVERSION_NUMBER:version];
            } else  {
                
                msg = @"请选择运输车辆";
            }
        } else {
            
            msg = @"请选择运输司机";
        }
    } else {
        
        msg = @"请选择车队名称";
    }
    
    [Tools showAlert:self.view andTitle:msg];
}


- (IBAction)refuseOnclick:(IB_UIButton *)sender {
    
    NSString *titleMsg = @"";
    switch (sender.tag) {
            
        case Button_TYPE_Received:
            
            titleMsg = @"确认退回？";
            break;
            
        case Button_TYPE_Completed:
            
            titleMsg = @"确认退回？";
            break;
            
        case Button_TYPE_LeaveWarehouse:
            
            titleMsg = @"确认退回？";
            break;
            
        default:
            break;
    }
    
    [LM_alert showLMAlertViewWithTitle:@"" message:titleMsg cancleButtonTitle:@"取消" okButtonTitle:@"确定" okClickHandle:^{
        
        if(sender.tag == Button_TYPE_LeaveWarehouse) {
            
            [Tools showAlert:self.view andTitle:@"不能拒收哦"];
            return;
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [_service_Audit RuturnAudit:_supplyListM.iDX andstrUserIdx:_app.user.iDX];
    } cancelClickHandle:nil];
}


- (IBAction)agreeOnclick:(IB_UIButton *)sender {
    
    NSString *titleMsg = @"";
    switch (sender.tag) {
            
        case Button_TYPE_Received:
            
            titleMsg = @"确认订单？";
            break;
            
        case Button_TYPE_Completed:
            
            titleMsg = @"确认发运？";
            break;
            
        case Button_TYPE_LeaveWarehouse:
            
            titleMsg = @"确认完成？";
            break;
            
        default:
            break;
    }
    
    [LM_alert showLMAlertViewWithTitle:@"" message:titleMsg cancleButtonTitle:@"取消" okButtonTitle:@"确定" okClickHandle:^{
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [_service_Audit UpdateAudit:_supplyListM.iDX andstrUserIdx:_app.user.iDX];
    } cancelClickHandle:nil];
}


// 司机信息
- (IBAction)driverDetailOnclick:(IB_UIButton *)sender {
    
    DriverDetailViewController *vc = [[DriverDetailViewController alloc] init];
    vc.DRIVER_TEL = _supplyInfoM.supplyModel.dRIVERTEL;
    [self.navigationController pushViewController:vc animated:YES];
}


// 车辆信息
- (IBAction)truckDetailOnclick:(IB_UIButton *)sender {
    
    TruckDetailViewController *vc = [[TruckDetailViewController alloc] init];
    vc.PLATE_NUMBER = _supplyInfoM.supplyModel.pLATENUMBER;
    vc.fleetIdx = _supplyInfoM.supplyModel.fLEETIDX;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 功能函数

- (void)initUI {
    
    _SUPPLY_NO.text = @"";
    _ADD_DATE.text = @"";
    _REQUEST_WAREHOUSE.text = @"";
    _REQUEST_ISSUE.text = @"";
    _ORG_NAME.text = @"";
    _DRIVER_REQUEST.text = @"";
    _HANDLING_DEGREE.text = @"";
    _TASK_DESCRIPTION.text = @"";
    _ROUTES_CITY.text = @"";
    _SUPPLY_TYPE.text = @"";              // 10
    _IS_RETURN_STORE.text = @"";
    _IS_RETURN.text = @"";
    _IS_HANDLING.text = @"";
    _HAVE_LOAD.text = @"";
    _HAVE_UNLOAD.text = @"";
    _SUPPLY_VEHICLE_SIZE.text = @"";
    _SUPPLY_VEHICLE_TYPE.text = @"";
    _TOTAL_VOLUME.text = @"";
    _TOTAL_WEIGHT.text = @"";
    _TOTAL_QTY.text = @"";                // 20
    _TOTAL_AMOUNT.text = @"";
    _SUPPLY_STATE.text = @"";
    _SUPPLY_WOKERFLOW.text = @"";
    _FLEET_NAME.text = @"";
}

- (void)registCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
}


- (void)requestNetworkData {
    
    [_service GetSupplyInfo:_supplyListM.iDX];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _supplyInfoM.routesModel.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RoutesModel *routeM = _supplyInfoM.routesModel[indexPath.row];
    return routeM.cellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = kCellName;
    
    RoutesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    RoutesModel *m = _supplyInfoM.routesModel[indexPath.row];
    
    if(_supplyInfoM.routesModel.count == indexPath.row + 1) {
        
        cell.lastTO = YES;
    }
    
    cell.routesM = m;
    
    return cell;
}


- (NSString *)isNeed:(NSString *)yesOrNo {
    
    if([yesOrNo isEqualToString:@"Y"]) {
        
        return @"是";
    } else if([yesOrNo isEqualToString:@"N"]) {
        
        return @"否";
    } else {
        
        return yesOrNo;
    }
}


#pragma mark - SupplyInfoServiceDelegate

- (void)successOfSupplyInfo:(SupplyInfoModel *)supplyInfoM {
    
    _supplyInfoM = supplyInfoM;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    _SUPPLY_NO.text = _supplyInfoM.supplyModel.sUPPLYNO;
    _ADD_DATE.text = _supplyInfoM.supplyModel.aDDDATE;
    _REQUEST_WAREHOUSE.text = _supplyInfoM.supplyModel.rEQUESTWAREHOUSE;
    _REQUEST_ISSUE.text = _supplyInfoM.supplyModel.rEQUESTISSUE;
    _ORG_NAME.text = [_supplyInfoM.supplyModel.oRGNAME isEqualToString:@""] ? @"个人货源" : _supplyInfoM.supplyModel.oRGNAME;
    _DRIVER_REQUEST.text = _supplyInfoM.supplyModel.dRIVERREQUEST;
    _HANDLING_DEGREE.text = _supplyInfoM.supplyModel.hANDLINGDEGREE;
    _TASK_DESCRIPTION.text = _supplyInfoM.supplyModel.tASKDESCRIPTION;
    _ROUTES_CITY.text = [Tools routesCityConvert:_supplyInfoM.supplyModel.rOUTESCITY];
    _SUPPLY_TYPE.text = _supplyInfoM.supplyModel.sUPPLYTYPE;
    // 10
    _IS_RETURN_STORE.text = [self isNeed:_supplyInfoM.supplyModel.iSRETURNSTORE];
    _IS_RETURN.text = [self isNeed:_supplyInfoM.supplyModel.iSRETURN];
    _IS_HANDLING.text = [self isNeed:_supplyInfoM.supplyModel.iSHANDLING];
    _HAVE_LOAD.text = [self isNeed:_supplyInfoM.supplyModel.hAVELOAD];
    _HAVE_UNLOAD.text = [self isNeed:_supplyInfoM.supplyModel.hAVEUNLOAD];
    _SUPPLY_VEHICLE_SIZE.text = _supplyInfoM.supplyModel.sUPPLYVEHICLESIZE;
    _SUPPLY_VEHICLE_TYPE.text = _supplyInfoM.supplyModel.sUPPLYVEHICLETYPE;
    _TOTAL_VOLUME.text = [NSString stringWithFormat:@"%.2f方", [Tools twoDecimal:_supplyInfoM.supplyModel.tOTALVOLUME]];
    _TOTAL_WEIGHT.text = [NSString stringWithFormat:@"%.2f吨", [Tools twoDecimal:_supplyInfoM.supplyModel.tOTALWEIGHT]];
    _TOTAL_QTY.text = [NSString stringWithFormat:@"%.1f箱", [Tools twoDecimal:_supplyInfoM.supplyModel.tOTALQTY]];
    // 10
    _TOTAL_AMOUNT.text = [NSString stringWithFormat:@"￥%.1f", [Tools twoDecimal:_supplyInfoM.supplyModel.tOTALAMOUNT]];
    _SUPPLY_STATE.text = [Tools getSupplyStatus:_supplyInfoM.supplyModel.sUPPLYSTATE];
    _SUPPLY_WOKERFLOW.text = _supplyInfoM.supplyModel.sUPPLYWOKERFLOW;
    
    /*************  路线城市换行  *************/
    [_ROUTES_CITY_PromptLabel sizeToFit];
    // Label 容器宽度
    CGFloat contentWidth = ScreenWidth - CGRectGetMinX(_ROUTES_CITY_PromptLabel.frame) - CGRectGetWidth(_ROUTES_CITY_PromptLabel.frame) - _ROUTES_CITY_trailing.constant;
    // Label 单行高度
    CGFloat oneLineHeight = [Tools getHeightOfString:@"fds" fontSize:14 andWidth:999.9];
    
    CGFloat overflowHeight = [Tools getHeightOfString:[Tools routesCityConvert:_supplyInfoM.supplyModel.rOUTESCITY] fontSize:14 andWidth:contentWidth] - oneLineHeight;
    if(overflowHeight > 0) {
        
        _ROUTES_CITY_Bottom.constant = _ROUTES_CITY_Bottom.constant + overflowHeight;
        _supplyInfoViewHeight.constant = _supplyInfoViewHeight.constant + overflowHeight;
    }
    /*************  路线城市换行  *************/
    
    
    
    /*************  地址信息换行  *************/
    // tableView 总高度
    CGFloat tableViewHeight = 0;
    for (int i = 0; i < _supplyInfoM.routesModel.count; i++) {
        
        RoutesModel *routeM = _supplyInfoM.routesModel[i];
        
        // Label 容器宽度
        CGFloat contentWidth = ScreenWidth - 8 - 51 - 5;
        // Label 单行高度
        CGFloat oneLineHeight = [Tools getHeightOfString:@"fds" fontSize:14 andWidth:999.9];
        
        NSString *address = [NSString stringWithFormat:@"%@（%@）", routeM.aDDRESSNAME, routeM.aDDRESSINFO];
        
        CGFloat overflowHeight = [Tools getHeightOfString:address fontSize:14 andWidth:contentWidth] - oneLineHeight;
        
        if(overflowHeight > 0) {
            
            routeM.cellHeight = kCellHeight + overflowHeight;
        } else {
            
            routeM.cellHeight = kCellHeight;
        }
        tableViewHeight += routeM.cellHeight;
    }
    /*************  地址信息换行  *************/
    
    
//    if(
//       
//       ([_supplyInfoM.supplyModel.sUPPLYSTATE isEqualToString:@"OPEN"] && [_supplyInfoM.supplyModel.sUPPLYWOKERFLOW isEqualToString:@"已接单"])
//       
//       ||
//       
//       ([_supplyInfoM.supplyModel.sUPPLYSTATE isEqualToString:@"OPEN"] && [_supplyInfoM.supplyModel.sUPPLYWOKERFLOW isEqualToString:@"已确认"])
//       
//       ||
//       
//       ([_supplyInfoM.supplyModel.sUPPLYSTATE isEqualToString:@"OPEN"] && [_supplyInfoM.supplyModel.sUPPLYWOKERFLOW isEqualToString:@"已发运"])
//       
//       ) {
//        
//    } else {
//        
//        _UIButtonViewHeight.constant = 0;
//        [_UIButtonContainerView setHidden:YES];
//    }
    
    _FLEET_NAME.text = supplyInfoM.supplyModel.fLEETNAME;
    
    
    // 提示 + 竞标信息 + 提示 + 基本信息 + 提示 + 路线信息
    _scrollContentViewHeight.constant = _bidInfoPromptViewHeight.constant + _bidInfoViewHeight.constant + _supplyInfoPromptViewHeight.constant + _supplyInfoViewHeight.constant + _routesPromptViewHeight.constant + tableViewHeight + _UIButtonViewHeight.constant;
    
    [_tableView reloadData];
}


- (void)failureOfSupplyInfo:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}


#pragma mark - SupplyAuditServiceDelegate

- (void)successOfUpdateAudit:(NSString *)msg {
    
    [self Pop:msg];
}


- (void)failureOfUpdateAudit:(NSString *)msg {
    
    [self Pop:msg];
}


- (void)successOfRuturnAudit:(NSString *)msg {
    
    [self Pop:msg];
}


- (void)failureOfRuturnAudit:(NSString *)msg {
    
    [self Pop:msg];
}


- (void)Pop:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kSupplyListVC_refreshNetworkData_Notification object:nil];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        usleep(1500000);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.navigationController popViewControllerAnimated:YES];
        });
    });
}

@end
