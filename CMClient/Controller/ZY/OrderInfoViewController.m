//
//  OrderInfoViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "OrderInfoViewController.h"
#import "OrderInfoService.h"
#import <MBProgressHUD.h>
#import "Tools.h"
#import "OrderDetailItemTableViewCell.h"
#import "CheckAutographViewController.h"
#import "CheckPathViewController.h"
#import <Masonry.h>

@interface OrderInfoViewController ()<UITableViewDelegate, UITableViewDataSource, OrderInfoServiceDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

// TMS订单号
@property (weak, nonatomic) IBOutlet UILabel *TMS_ORD_NO;

// 订单流水号
@property (weak, nonatomic) IBOutlet UILabel *ORD_NO;

// TMS订单号
@property (weak, nonatomic) IBOutlet UILabel *ORD_NO_CLIENT;

// 收货人订单号
@property (weak, nonatomic) IBOutlet UILabel *ORD_NO_CONSIGNEE;

// 客户订单类型
@property (weak, nonatomic) IBOutlet UILabel *ORD_TYPE_CLIENT;

// 客户备注
@property (weak, nonatomic) IBOutlet UILabel *ORD_REMARK_CLIENT;

// 收货人备注
@property (weak, nonatomic) IBOutlet UILabel *ORD_REMARK_CONSIGNEE;

// 要求车辆类型
@property (weak, nonatomic) IBOutlet UILabel *ORD_VEHICLE_TYPE;

// 要求车辆尺寸
@property (weak, nonatomic) IBOutlet UILabel *ORD_VEHICLE_SIZE;

// 要求发货时间
@property (weak, nonatomic) IBOutlet UILabel *ORD_REQUEST_ISSUE;

// 要求交付时间
@property (weak, nonatomic) IBOutlet UILabel *ORD_REQUEST_DELIVERY;

// 预计交付时间
@property (weak, nonatomic) IBOutlet UILabel *ORD_PROJECTED_DELIVERY;

// 起运点名称
@property (weak, nonatomic) IBOutlet UILabel *ORD_FROM_NAME;

// 起运点名称距下
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ORD_FROM_NAME_bottom;

// 起运点名称 提示
@property (weak, nonatomic) IBOutlet UILabel *ORD_FROM_NAME_PromptLabel;

// 起运点联系人
@property (weak, nonatomic) IBOutlet UILabel *ORD_FROM_CNAME;

// 起运点联系电话
@property (weak, nonatomic) IBOutlet UILabel *ORD_FROM_CTEL;

// 起运点地址提示(辅助地址换行)
@property (weak, nonatomic) IBOutlet UILabel *ORD_FROM_ADDRESS_PromtpLabel;

// 起运点地址
@property (weak, nonatomic) IBOutlet UILabel *ORD_FROM_ADDRESS;

// 到达点名称
@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_NAME;

// 到达点名称距下
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ORD_TO_NAME_bottom;

// 到达点名称 提示
//@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_NAME_PromptLabel;

// 到达点联系人
@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_CNAME;

// 到达点联系电话
@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_CTEL;

// 到达点地址提示(辅助地址换行)
@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_ADDRESS_PromtpLabel;

// 到达点地址
@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_ADDRESS;

// 发货总数量
@property (weak, nonatomic) IBOutlet UILabel *ORD_ISSUE_QTY;

// 发货总重量
@property (weak, nonatomic) IBOutlet UILabel *ORD_ISSUE_WEIGHT;

// 发货总体积
@property (weak, nonatomic) IBOutlet UILabel *ORD_ISSUE_VOLUME;

// 审核备注
@property (weak, nonatomic) IBOutlet UILabel *OMS_REMARK_AUDIT;

// 到货备注
@property (weak, nonatomic) IBOutlet UILabel *OTS_REMARK_DELIVERY;

// 回单备注
@property (weak, nonatomic) IBOutlet UILabel *OTS_REMARK_RETURN;

// 通知交付时间
@property (weak, nonatomic) IBOutlet UILabel *OTS_DELIVERY_NOTICE;

// 交付确认时间
@property (weak, nonatomic) IBOutlet UILabel *OTS_DELIVERY_ACTUAL;

// 回单确认时间
@property (weak, nonatomic) IBOutlet UILabel *OTS_RETURN_DATE;




/// 订单明细提示View 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *orderDetailPromptViewHeight;

/// 订单明细View 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *orderDetailViewHeight;

/// 订单明细Item提示View 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *orderDetailItemPromptViewHeight;

/// ScrllContentView 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

@property (strong, nonatomic) OrderInfoModel *orderInfo;

/// 查看订单 或 导航
@property (weak, nonatomic) IBOutlet UIButton *checkPathBtn;

/// 交付按钮 或 查看交付图片
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;

// 到达点名称 提示
@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_NAME_PromptLabel;

// 到达点名称距上（为了起运点地址换行）
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ORD_TO_NAME_top;

// 客户备注距上（为了到达点地址换行）
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ORD_REMARK_CLIENT_top;

// 按钮容器
@property (weak, nonatomic) IBOutlet UIView *bottomView;

// 按钮容器 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewHeight;

@end


// Cell 名字
#define kCellName @"OrderDetailItemTableViewCell"
// Cell 高度
#define kCellHeight 145
// 交付状态
#define kUnPay @"N" //未交付
#define kPayed @"Y" //已交付
#define kUnPay1 @"未交付" //未交付
#define kPayed1 @"已交付" //已交付


@implementation OrderInfoViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"订单详情";
    
    [self initUI];
    
    [self registerCell];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    OrderInfoService *s = [[OrderInfoService alloc] init];
    s.delegate = self;
    [s GetOrderInfo:_orderIdx];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 功能函数

// 初始化UI
- (void)initUI {
    
    _TMS_ORD_NO.text = @"";
    _ORD_NO.text = @"";
    _ORD_NO_CLIENT.text = @"";
    _ORD_NO_CONSIGNEE.text = @"";
    _ORD_TYPE_CLIENT.text = @"";
    _ORD_REMARK_CLIENT.text = @"";
    _ORD_REMARK_CONSIGNEE.text = @"";
    _ORD_VEHICLE_TYPE.text = @"";
    _ORD_VEHICLE_SIZE.text = @"";
    _ORD_REQUEST_ISSUE.text = @"";
    _ORD_REQUEST_DELIVERY.text = @"";
    _ORD_PROJECTED_DELIVERY.text = @"";
    _ORD_FROM_NAME.text = @"";
    _ORD_FROM_CNAME.text = @"";
    _ORD_FROM_CTEL.text = @"";
    _ORD_FROM_ADDRESS.text = @"";
    _ORD_TO_NAME.text = @"";
    _ORD_TO_CNAME.text = @"";
    _ORD_TO_CTEL.text = @"";
    _ORD_TO_ADDRESS.text = @"";
    _ORD_ISSUE_QTY.text = @"";
    _ORD_ISSUE_WEIGHT.text = @"";
    _ORD_ISSUE_VOLUME.text = @"";
    _OMS_REMARK_AUDIT.text = @"";
    _OTS_REMARK_DELIVERY.text = @"";
    _OTS_REMARK_RETURN.text = @"";
    _OTS_DELIVERY_NOTICE.text = @"";
    _OTS_DELIVERY_ACTUAL.text = @"";
    _OTS_RETURN_DATE.text = @"";
}


- (void)registerCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
}


- (void)updateConstraints {
    
    _scrollContentViewHeight.constant = _orderDetailPromptViewHeight.constant + _orderDetailViewHeight.constant + _orderDetailItemPromptViewHeight.constant + kCellHeight *_orderInfo.orderDetailItemModel.count + _bottomViewHeight.constant;
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _orderInfo.orderDetailItemModel.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kCellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = kCellName;
    
    OrderDetailItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    OrderDetailItemModel *m = _orderInfo.orderDetailItemModel[indexPath.row];
    cell.orderDatailItemM = m;
    
    return cell;
}


#pragma mark - 事件

- (void)checkPathOnclick {
    
    CheckPathViewController *vc = [[CheckPathViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc.orderIDX = _orderIdx;
}


- (void)checkAutographOnclick {
    
    CheckAutographViewController *vc = [[CheckAutographViewController alloc] init];
    vc.orderIdx = _orderIdx;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - OrderInfoServiceDelegate

- (void)successOfOrderInfo:(OrderInfoModel *)orderInfo {
    
    _orderInfo = orderInfo;
    [_tableView reloadData];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [self.view layoutIfNeeded];
    
    // 未交付
    if([_orderInfo.orderDetailModel.uPDATE03 isEqualToString:@"N"] || [_orderInfo.orderDetailModel.uPDATE03 isEqualToString:@""]) {
        
        CGFloat height = 43;
        CGFloat x = 8;
        CGFloat y = (_bottomViewHeight.constant - height) / 2;
        CGFloat width = ScreenWidth - x * 2;
        
        UIButton *btn1 = [[UIButton alloc] init];
        [btn1 setFrame:CGRectMake(x, y, width, height)];
        btn1.backgroundColor = [UIColor redColor];
        btn1.layer.cornerRadius = 2;
        [btn1 setTitle:@"查看运输轨迹" forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(checkPathOnclick) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:btn1];
    }
    
    // 已交付
    else if([_orderInfo.orderDetailModel.uPDATE03 isEqualToString:@"Y"]){
        
        CGFloat height = 43;
        CGFloat x = 8;
        CGFloat y = (_bottomViewHeight.constant - height) / 2;
        CGFloat between = 15;
        CGFloat width = (ScreenWidth - x * 2 - between) / 2;
        
        UIButton *btn1 = [[UIButton alloc] init];
        [btn1 setFrame:CGRectMake(x, y, width, height)];
        btn1.backgroundColor = [UIColor redColor];
        btn1.layer.cornerRadius = 2;
        [btn1 setTitle:@"查看路线" forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(checkPathOnclick) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:btn1];
        
        UIButton *btn2 = [[UIButton alloc] init];
        [btn2 setFrame:CGRectMake(x + width + between, y, width, height)];
        btn2.backgroundColor = [UIColor redColor];
        btn2.layer.cornerRadius = 2;
        [btn2 setTitle:@"查看签名/图片" forState:UIControlStateNormal];
        [btn2 addTarget:self action:@selector(checkAutographOnclick) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:btn2];
    }
    
    
    //    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.mas_equalTo(15);
    //        make.right.mas_equalTo(15);
    //        make.top.mas_equalTo(15);
    //        make.bottom.mas_equalTo(15);
    //    }];
    
    //    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.right.mas_equalTo(15);
    //        make.left.equalTo(btn1.mas_left).offset(15);
    //        make.top.mas_equalTo(15);
    //        make.bottom.mas_equalTo(15);
    //    }];
    
    
    _ORD_NO.text = orderInfo.orderDetailModel.oRDNO;
    _TMS_ORD_NO.text = orderInfo.orderDetailModel.tMSORDNO;
    _ORD_NO_CLIENT.text = orderInfo.orderDetailModel.oRDNOCLIENT;
    _ORD_NO_CONSIGNEE.text = orderInfo.orderDetailModel.oRDNOCONSIGNEE;
    _ORD_TYPE_CLIENT.text = orderInfo.orderDetailModel.oRDTYPECLIENT;
    _ORD_REMARK_CLIENT.text = orderInfo.orderDetailModel.oRDREMARKCLIENT;
    _ORD_REMARK_CONSIGNEE.text = orderInfo.orderDetailModel.oRDREMARKCONSIGNEE;
    _ORD_VEHICLE_TYPE.text = orderInfo.orderDetailModel.oRDVEHICLETYPE;
    _ORD_VEHICLE_SIZE.text = orderInfo.orderDetailModel.oRDVEHICLESIZE;
    _ORD_REQUEST_ISSUE.text = orderInfo.orderDetailModel.oRDREQUESTISSUE;
    _ORD_REQUEST_DELIVERY.text = orderInfo.orderDetailModel.oRDREQUESTDELIVERY;
    _ORD_PROJECTED_DELIVERY.text = orderInfo.orderDetailModel.oRDPROJECTEDDELIVERY;
    _ORD_FROM_NAME.text = orderInfo.orderDetailModel.oRDFROMNAME;
    
    // 地址名称换行
    [self.view layoutIfNeeded];
    CGFloat oneLine = [Tools getHeightOfString:@"fds" fontSize:_ORD_FROM_NAME.font.pointSize andWidth:ScreenWidth];
    CGFloat textHeight = [Tools getHeightOfString:_ORD_FROM_NAME.text fontSize:_ORD_FROM_NAME.font.pointSize andWidth:(ScreenWidth - CGRectGetMaxX(_ORD_FROM_NAME_PromptLabel.frame))];
    if(textHeight > oneLine) {
        
        _ORD_FROM_NAME_bottom.constant = 5 + textHeight - oneLine;
    } else {
        
        _ORD_FROM_NAME_bottom.constant = 5;
    }
    _orderDetailViewHeight.constant += (textHeight - oneLine);
    
    _ORD_FROM_CNAME.text = orderInfo.orderDetailModel.oRDFROMCNAME;
    _ORD_FROM_CTEL.text = orderInfo.orderDetailModel.oRDFROMCTEL;
    _ORD_FROM_ADDRESS.text = orderInfo.orderDetailModel.oRDFROMADDRESS;
    
    // 地址换行
    oneLine = [Tools getHeightOfString:@"fds" fontSize:_ORD_FROM_ADDRESS.font.pointSize andWidth:ScreenWidth];
    textHeight = [Tools getHeightOfString:_ORD_FROM_ADDRESS.text fontSize:_ORD_FROM_ADDRESS.font.pointSize andWidth:(ScreenWidth - CGRectGetMaxX(_ORD_FROM_ADDRESS_PromtpLabel.frame))];
    if(textHeight > oneLine) {
        
        _ORD_TO_NAME_top.constant = 12 + textHeight - oneLine;
    } else {
        
        _ORD_TO_NAME_top.constant = 12;
    }
    _orderDetailViewHeight.constant += (textHeight - oneLine);
    
    _ORD_TO_NAME.text = orderInfo.orderDetailModel.oRDTONAME;
    _ORD_TO_CNAME.text = orderInfo.orderDetailModel.oRDTOCNAME;
    _ORD_TO_CTEL.text = orderInfo.orderDetailModel.oRDTOCTEL;
    _ORD_TO_ADDRESS.text = orderInfo.orderDetailModel.oRDTOADDRESS;
    
    // 地址换行
    oneLine = [Tools getHeightOfString:@"fds" fontSize:_ORD_TO_ADDRESS.font.pointSize andWidth:ScreenWidth];
    textHeight = [Tools getHeightOfString:_ORD_TO_ADDRESS.text fontSize:_ORD_TO_ADDRESS.font.pointSize andWidth:(ScreenWidth - CGRectGetMaxX(_ORD_TO_ADDRESS_PromtpLabel.frame))];
    if(textHeight > oneLine) {
        
        _ORD_REMARK_CLIENT_top.constant = 12 + textHeight - oneLine;
    } else {
        
        _ORD_REMARK_CLIENT_top.constant = 12;
    }
    _orderDetailViewHeight.constant += (textHeight - oneLine);
    
    _ORD_ISSUE_QTY.text = [NSString stringWithFormat:@"%.1f箱", [orderInfo.orderDetailModel.oRDISSUEQTY floatValue]];
    _ORD_ISSUE_WEIGHT.text = [NSString stringWithFormat:@"%.2f吨", [orderInfo.orderDetailModel.oRDISSUEWEIGHT floatValue]];
    _ORD_ISSUE_VOLUME.text = [NSString stringWithFormat:@"%.2f方", [orderInfo.orderDetailModel.oRDISSUEVOLUME floatValue]];
    _OMS_REMARK_AUDIT.text = orderInfo.orderDetailModel.oMSREMARKAUDIT;
    _OTS_REMARK_DELIVERY.text = orderInfo.orderDetailModel.oTSREMARKDELIVERY;
    _OTS_REMARK_RETURN.text = orderInfo.orderDetailModel.oTSREMARKRETURN;
    _OTS_DELIVERY_NOTICE.text = orderInfo.orderDetailModel.oTSDELIVERYNOTICE;
    _OTS_DELIVERY_ACTUAL.text = orderInfo.orderDetailModel.oTSDELIVERYACTUAL;
    _OTS_RETURN_DATE.text = orderInfo.orderDetailModel.oTSRETURNDATE;
    
    
    [self updateConstraints];
}


- (void)failureOfOrderInfo:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
    [self updateConstraints];
}

@end
