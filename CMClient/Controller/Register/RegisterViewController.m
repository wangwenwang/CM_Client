//
//  RegisterViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/1/14.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterService.h"
#import "Tools.h"
#import <MBProgressHUD.h>
#import "LoginTextFieId.h"
#import "LoginButton.h"
#import "AreaProvinceViewController.h"
#import <RadioButton.h>

/// 跳回去
#import "MainViewController.h"

@interface RegisterViewController ()<RegisterServiceDelegate> {
    
    AppDelegate *_app;
}

/// 手机号
@property (weak, nonatomic) IBOutlet LoginTextFieId *phoneNumF;

/// 验证码
@property (weak, nonatomic) IBOutlet LoginTextFieId *verificationNumF;

/// 密码
@property (weak, nonatomic) IBOutlet LoginTextFieId *passwordF;

/// 确认密码
@property (weak, nonatomic) IBOutlet LoginTextFieId *rePasswordF;

/// 司机
@property (weak, nonatomic) IBOutlet RadioButton *Radiobtn_Driver;

/// 客户
@property (weak, nonatomic) IBOutlet RadioButton *Radiobtn_Client;

/// 承运商
@property (weak, nonatomic) IBOutlet RadioButton *Radiobtn_Carrier;

/// 真实姓名
@property (weak, nonatomic) IBOutlet LoginTextFieId *nameF;

/// 常住地
@property (weak, nonatomic) IBOutlet LoginTextFieId *addressF;

/// 推荐人
@property (weak, nonatomic) IBOutlet LoginTextFieId *recommendF;

/// 确认按钮
@property (weak, nonatomic) IBOutlet LoginButton *commitBtn;

/// 点击注册
- (IBAction)registerOnclick:(UIButton *)sender;

/// scrollContentView 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

@property (strong, nonatomic) RegisterService *service;

/// 常住地 View
//@property (weak, nonatomic) IBOutlet UIView *addressView;

/// 常住地 单击手势
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *addressTap;

@end


@implementation RegisterViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _service = [[RegisterService alloc] init];
        _service.delegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addNotification];
    
    [_Radiobtn_Driver setImage:[UIImage imageNamed:@"radio_button_unchecked"] forState:UIControlStateNormal];
    [_Radiobtn_Driver setImage:[UIImage imageNamed:@"radio_button_checked"] forState:UIControlStateSelected];
    
    [_Radiobtn_Client setImage:[UIImage imageNamed:@"radio_button_unchecked"] forState:UIControlStateNormal];
    [_Radiobtn_Client setImage:[UIImage imageNamed:@"radio_button_checked"] forState:UIControlStateSelected];
    
    [_Radiobtn_Carrier setImage:[UIImage imageNamed:@"radio_button_unchecked"] forState:UIControlStateNormal];
    [_Radiobtn_Carrier setImage:[UIImage imageNamed:@"radio_button_checked"] forState:UIControlStateSelected];
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    _scrollContentViewHeight.constant = CGRectGetMaxY(_commitBtn.frame) + 20;
    _addressF.userInteractionEnabled = NO;
//    [_addressView addGestureRecognizer:_addressTap];

}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    
    [self removeNotification];
}


#pragma mark - 事件
- (IBAction)registerOnclick:(UIButton *)sender {
    
    // 如果用户没输入电话号码 就点击注册按钮，弹出键盘让用户输入电话号码
    if([_phoneNumF.textTrim isEqualToString:@""]) {
        
        [_phoneNumF becomeFirstResponder];
        return;
    }
    
    // 两次密码要一致，并且不能为空
    if(![_passwordF.textTrim isEqualToString:@""]) {
        
        if(![_rePasswordF.textTrim isEqualToString:@""]) {
            
            if([_passwordF.textTrim isEqualToString:_rePasswordF.textTrim] ) {
                
                [self.view endEditing:YES];
                
                // 用户类型
                NSString *userType = @"";
//                if(_Radiobtn_Driver.selected) {
//                    userType = @"Driver";
//                } else if(_Radiobtn_Client.selected) {
//                    userType = @"Client";
//                } else if(_Radiobtn_Carrier.selected) {
//                    userType = @"Carrier";
//                } else {
//                    [Tools showAlert:self.view andTitle:@"请选择用户类型"];
//                    return;
//                }
                userType = @"Client";
                
                [_service registerX:_phoneNumF.textTrim andPassword:_rePasswordF.textTrim andUserType:userType andVerificationCode:_verificationNumF.text andName:_nameF.text andAddress:_addressF.text andRecommenderNo:_recommendF.text];
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            } else {
                
                [Tools showAlert:self.view andTitle:@"密码不一致"];
            }
        } else {
            
            [Tools showAlert:self.view andTitle:@"请确认密码"];
        }
    } else {
        
        [Tools showAlert:self.view andTitle:@"请输入密码"];
    }
}


- (IBAction)backOnclick:(UIButton *)sender {
    
    MainViewController *loginVc = [[MainViewController alloc] init];
    
    [Tools setRootViewControllerWithCrossDissolve:_app.window andViewController:loginVc];
}


- (IBAction)addressOnclick:(UITapGestureRecognizer *)sender {
    
    AreaProvinceViewController *vc = [[AreaProvinceViewController alloc] init];
    
    //nav导航
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}


- (IBAction)textFieldDidChange:(LoginTextFieId *)sender {
    
    if (_phoneNumF.text.length > 11) {
        _phoneNumF.text = [_phoneNumF.text substringToIndex:11];
    }
}


#pragma mark - 功能方法

- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData:) name:kAreaCity_reloadData_Notification object:nil];
}


- (void)removeNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kAreaCity_reloadData_Notification object:nil];
}

- (void)reloadData:(NSNotification *)aNotifica {
    
    _addressF.text = aNotifica.userInfo[@"city"];
}


#pragma mark - RegisterServiceDelegate

- (void)successOfRegister {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:@"注册成功"];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [self backOnclick:nil];
        });
    });
}


- (void)failureOfRegister:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
