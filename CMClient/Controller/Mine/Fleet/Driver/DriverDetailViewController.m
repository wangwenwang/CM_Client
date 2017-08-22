//
//  DriverDetailViewController.m
//  CMDriver
//
//  Created by 凯东源 on 17/2/17.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "DriverDetailViewController.h"
#import "AddDriverService.h"
#import <MBProgressHUD.h>
#import "Tools.h"

@interface DriverDetailViewController ()<AddDriverServiceDelegate>

// 名称
@property (weak, nonatomic) IBOutlet UILabel *USERNAME;

// 电话
@property (weak, nonatomic) IBOutlet UILabel *USER_CODE;

// 推荐人
@property (weak, nonatomic) IBOutlet UILabel *RECOMNAME;

// 公司名称
@property (weak, nonatomic) IBOutlet UILabel *COMPANYNAME;

// 用户常住地
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS;

// 获取司机详情
@property (strong, nonatomic) AddDriverService *service;

@end

@implementation DriverDetailViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[AddDriverService alloc] init];
        _service.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"司机详情";
    
    [self initUI];
    
    [_service GetDriverInfo:_DRIVER_TEL];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 功能函数

- (void)initUI {
    
    _USERNAME.text = @"";
    _USER_CODE.text = @"";
    _RECOMNAME.text = @"";
    _COMPANYNAME.text = @"";
    _ADDRESS.text = @"";
}


#pragma mark - InfoDriverServiceDelegate

- (void)successOfGetDriverInfo:(UserModel *)userModel {
    
    _USERNAME.text = userModel.uSERNAME;
    _USER_CODE.text = userModel.uSERCODE;
    _RECOMNAME.text = userModel.rECOMNAME;
    _COMPANYNAME.text = userModel.cOMPANYNAME;
    _ADDRESS.text = userModel.aDDRESS;
}


- (void)failureOfGetDriverInfo:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
