//
//  ZYinfoViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/3/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "ZYInfoViewController.h"
#import "OrderListModel.h"
#import "ZYInfoService.h"
#import <MBProgressHUD.h>
#import "Tools.h"
#import "OrderInfoViewController.h"
#import "OrderTableViewCell.h"

@interface ZYInfoViewController ()<UITableViewDelegate, UITableViewDataSource, ZYInfoServiceDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

// 装运流水号
@property (weak, nonatomic) IBOutlet UILabel *SHIPMENT_NO;

// TMS装运编号
@property (weak, nonatomic) IBOutlet UILabel *TMS_SHIPMENT_NO;

// 装运时间
@property (weak, nonatomic) IBOutlet UILabel *DATE_LOAD;

// 出库时间
@property (weak, nonatomic) IBOutlet UILabel *DATE_ISSUE;

// 发布公司
@property (weak, nonatomic) IBOutlet UILabel *ORG_NAME;

// 车队名
@property (weak, nonatomic) IBOutlet UILabel *FLEET_NAME;

// 司机姓名
@property (weak, nonatomic) IBOutlet UILabel *DRIVER_NAME;

// 装运状态
@property (weak, nonatomic) IBOutlet UILabel *SHIPMENT_STATE;

// 车辆类型
@property (weak, nonatomic) IBOutlet UILabel *VEHICLE_TYPE;

// 车辆尺寸
@property (weak, nonatomic) IBOutlet UILabel *VEHICLE_SIZE;

// 起始城市
@property (weak, nonatomic) IBOutlet UILabel *FROM_CITY;

// 终点城市
@property (weak, nonatomic) IBOutlet UILabel *TO_CITY;

// 司机联系电话
@property (weak, nonatomic) IBOutlet UILabel *DRIVER_TEL;

// 车牌号
@property (weak, nonatomic) IBOutlet UILabel *PLATE_NUMBER;

// 总体积
@property (weak, nonatomic) IBOutlet UILabel *TOTAL_VOLUME;

// 总重量
@property (weak, nonatomic) IBOutlet UILabel *TOTAL_WEIGHT;

// contenView 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewtHeight;

// 装运信息 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shipmentViewHeight;

// 装运信息提示View 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shipmentPromptViewHeight;

// 订单信息提示View 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *orderPromptViewHeight;

// 装运里的订单
@property (nonatomic, strong) ShipmentInfoModel *zyInfo;

@property (nonatomic, strong) ZYInfoService *service;

@end


#define kCellName @"OrderTableViewCell"
#define kCellHeight 125


@implementation ZYInfoViewController

#pragma mark - 生命周期

- (instancetype)init {
    if(self = [super init]) {
        
        _service = [[ZYInfoService alloc] init];
        _service.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"装运详情";
    
    [self initUI];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self registCell];
    
    _tableView.separatorStyle = NO;
    
    [self requestNetworkData];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 功能函数

- (void)initUI {
    
    _SHIPMENT_NO.text = @"";
    _TMS_SHIPMENT_NO.text = @"";
    _DATE_LOAD.text = @"";
    _DATE_ISSUE.text = @"";
    _ORG_NAME.text = @"";
    _FLEET_NAME.text = @"";
    _DRIVER_NAME.text = @"";
    _SHIPMENT_STATE.text = @"";
    _VEHICLE_TYPE.text = @"";
    _VEHICLE_SIZE.text = @"";
    _FROM_CITY.text = @"";
    _TO_CITY.text = @"";
    _DRIVER_TEL.text = @"";
    _PLATE_NUMBER.text = @"";
    _TOTAL_VOLUME.text = @"";
    _TOTAL_WEIGHT.text = @"";
}


- (void)registCell {
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
}


- (void)requestNetworkData {
    
    [_service GetShipmentInfo:_shipmentInfoIdx];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _zyInfo.orderModel.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OrderModel *orderM = _zyInfo.orderModel[indexPath.row];
    
    return orderM.cellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = kCellName;
    
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    OrderModel *order = _zyInfo.orderModel[indexPath.row];
    
    cell.order = order;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    OrderListModel *m = _zyInfo.orderModel[indexPath.row];
    
    OrderInfoViewController *vc = [[OrderInfoViewController alloc] init];
    vc.orderIdx = m.iDX;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - ZYInfoServiceDelegate

- (void)successOfZYInfo:(ShipmentInfoModel *)zyInfo {
    
    _zyInfo = zyInfo;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    
    _SHIPMENT_NO.text = zyInfo.shipmentModel.sHIPMENTNO;
    _TMS_SHIPMENT_NO.text = zyInfo.shipmentModel.tMSSHIPMENTNO;
    _DATE_LOAD.text = zyInfo.shipmentModel.dATELOAD;
    _DATE_ISSUE.text = zyInfo.shipmentModel.dATEISSUE;
    _ORG_NAME.text = zyInfo.shipmentModel.oRGNAME;
    _FLEET_NAME.text = zyInfo.shipmentModel.fLEETNAME;
    _DRIVER_NAME.text = zyInfo.shipmentModel.dRIVERNAME;
    _SHIPMENT_STATE.text = [Tools getSHIPMENT_STATE:zyInfo.shipmentModel.sHIPMENTSTATE];
    _VEHICLE_TYPE.text = zyInfo.shipmentModel.vEHICLETYPE;
    _VEHICLE_SIZE.text = zyInfo.shipmentModel.vEHICLESIZE;
    _FROM_CITY.text = zyInfo.shipmentModel.fROMCITY;
    _TO_CITY.text = zyInfo.shipmentModel.tOCITY;
    _DRIVER_TEL.text = zyInfo.shipmentModel.dRIVERTEL;
    _PLATE_NUMBER.text = zyInfo.shipmentModel.pLATENUMBER;
    _TOTAL_VOLUME.text = [NSString stringWithFormat:@"%.2f方", [zyInfo.shipmentModel.tOTALVOLUME floatValue]];
    _TOTAL_WEIGHT.text = [NSString stringWithFormat:@"%.2f吨", [zyInfo.shipmentModel.tOTALWEIGHT floatValue]];
    
    OrderTableViewCell *cell = [[OrderTableViewCell alloc] init];
    CGFloat textFontPoint = cell.ORG_FROM_NAME_FontPointSize;
    CGFloat oneLine = 0;
    CGFloat textHeight = 0;
    CGFloat tableViewHeight = 0;
    
    // Cell 地址换行
    for(int i = 0; i < _zyInfo.orderModel.count; i++) {
        
        OrderModel *orderM = _zyInfo.orderModel[i];
        
        oneLine = [Tools getHeightOfString:@"fds" fontSize:textFontPoint andWidth:(ScreenWidth - 8 - 62 - 16)];
        textHeight = [Tools getHeightOfString:orderM.oRDFROMNAME fontSize:textFontPoint andWidth:(ScreenWidth - 8 - 62 - 16)];
        
        CGFloat overHeight = 0;
        if(textHeight > oneLine) {
            
            overHeight = textHeight - oneLine;
        }
        orderM.cellHeight = kCellHeight + overHeight;
    }
    
    // Cell 地址换行
    for(int i = 0; i < _zyInfo.orderModel.count; i++) {
        
        OrderModel *orderM = _zyInfo.orderModel[i];
        
        oneLine = [Tools getHeightOfString:@"fds" fontSize:textFontPoint andWidth:(ScreenWidth - 8 - 62 - 16)];
        textHeight = [Tools getHeightOfString:orderM.oRDTONAME fontSize:textFontPoint andWidth:(ScreenWidth - 8 - 62 - 16)];
        
        CGFloat overHeight = 0;
        if(textHeight > oneLine) {
            
            overHeight = textHeight - oneLine;
        }
        orderM.cellHeight += overHeight;
        
        tableViewHeight += orderM.cellHeight;
    }
    
    _scrollContentViewtHeight.constant = _shipmentPromptViewHeight.constant + _shipmentViewHeight.constant + _orderPromptViewHeight.constant + tableViewHeight;
    
    [_tableView reloadData];
}

- (void)successOfZYInfoNoData {
 
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:@"没有订单信息"];
}


- (void)failureOfZYInfo:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
