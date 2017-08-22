//
//  AddDriverViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/2/23.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "AddDriverViewController.h"
#import "AddDriverService.h"
#import "Tools.h"
#import <RadioButton.h>
#import "LoginTextFieId.h"
#import "UserModel.h"
#import <MBProgressHUD.h>

@interface AddDriverViewController ()<UITextFieldDelegate, AddDriverServiceDelegate> {
    
    AppDelegate *_app;
}


#define kvo_enabled @"enabled"

/// 用户输入被添加的好友id 或手机号码
@property (weak, nonatomic) IBOutlet LoginTextFieId *idOrPhoneNumF;

/// 添加按钮
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

/// contentView高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeight;

@property (strong, nonatomic) AddDriverService *service;

/// 司机详情视图
@property (weak, nonatomic) IBOutlet UIView *driverInfoView;

/// 司机姓名
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

/// 搜索结果
@property (strong, nonatomic) UserModel *userModel;

@property (assign, nonatomic) BOOL requestNetWorkComplete;

@end

@implementation AddDriverViewController

#pragma mark - 生命周期
- (instancetype)init {
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _service = [[AddDriverService alloc] init];
        _service.delegate = self;
        _requestNetWorkComplete = NO;
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"添加司机";
    LMLog(@"viewDidLoad");
    
    [_idOrPhoneNumF setTextColor:[UIColor blackColor]];
    
    _searchBtn.backgroundColor = [UIColor clearColor];
    [_searchBtn setBackgroundImage:[self unEnableImage] forState:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    LMLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    LMLog(@"viewDidAppear");
    
    [_idOrPhoneNumF becomeFirstResponder];
//    _contentViewHeight.constant = CGRectGetMaxY(_searchBtn.frame) + 10;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    LMLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    LMLog(@"viewDidDisappear");
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    LMLog(@"awakeFromNib");
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    LMLog(@"viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    LMLog(@"viewDidLayoutSubviews");
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    
    LMLog(@"dealloc");
}


#pragma mark - 功能方法

- (UIImage *)enableImage {
    UIColor *color = RGB(0, 164, 60);
    return [Tools createImageWithColor:color];
}


- (UIImage *)unEnableImage {
    UIColor *color = RGB(217, 217, 217);
    return [Tools createImageWithColor:color];
}


// 0.5秒内请求成功则不显示HUD
- (void)MBProgressHUDshowHUD {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        usleep(500000);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(!_requestNetWorkComplete) {
                
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            }
        });
    });
}


#pragma mark - 事件

- (IBAction)textFieldDidChange:(LoginTextFieId *)sender {
    if (_idOrPhoneNumF.text.length > 11) {
        _idOrPhoneNumF.text = [_idOrPhoneNumF.text substringToIndex:11];
    }
    
    if(_idOrPhoneNumF.text.length > 0) {
        [_searchBtn setEnabled:YES];
        [_searchBtn setBackgroundImage:[self enableImage] forState:UIControlStateNormal];
    } else {
        [_searchBtn setEnabled:NO];
        [_searchBtn setBackgroundImage:[self unEnableImage] forState:UIControlStateNormal];
    }
}


- (IBAction)searchDriver:(UIButton *)sender {
    
    _requestNetWorkComplete = NO;
    [self.view endEditing:YES];
    [self MBProgressHUDshowHUD];
    [_service GetDriverInfo:_idOrPhoneNumF.textTrim];
}


- (IBAction)commitOnclick:(UIButton *)sender {
    
    _requestNetWorkComplete = NO;
    [self.view endEditing:YES];
    [self MBProgressHUDshowHUD];
    [_service addDriver:_app.user.iDX andFLEET_IDX:_fleetIdx andADD_USER_IDX:_userModel.iDX];
}


#pragma mark - AddDriverServiceDelegate

- (void)successOfGetDriverInfo:(UserModel *)userModel {
    
    _requestNetWorkComplete = YES;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_driverInfoView setHidden:NO];
    _userModel = userModel;
    _nameLabel.text = _userModel.uSERNAME;
}


- (void)failureOfGetDriverInfo {
    
    _requestNetWorkComplete = YES;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_driverInfoView setHidden:YES];
    [Tools showAlert:self.view andTitle:@"司机不存在"];
}


- (void)successOfAddDriver {
    
    _requestNetWorkComplete = YES;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:@"添加成功"];
    [[NSNotificationCenter defaultCenter] postNotificationName:kDriverListVC_RequestNetWorkData_Notification object:nil];
}


- (void)failureOfAddDriver:(NSString *)msg {
    
    _requestNetWorkComplete = YES;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
