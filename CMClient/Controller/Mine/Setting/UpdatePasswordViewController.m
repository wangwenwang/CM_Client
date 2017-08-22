//
//  UpdatePasswordViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/3/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "UpdatePasswordViewController.h"
#import "NSString+MD5.h"
#import "UpdatePasswordService.h"
#import "AddFleetTextField.h"
#import "AddDriverButton.h"
#import "Tools.h"
#import <MBProgressHUD.h>
#import "MainViewController.h"
#import "PushNewsViewController.h"


@interface UpdatePasswordViewController ()<UpdatePasswordServiceDelegate>

/// 旧密码
@property (weak, nonatomic) IBOutlet AddFleetTextField *oldPasswordF;

/// 新密码
@property (weak, nonatomic) IBOutlet AddFleetTextField *newpasswordF;

/// 重复新密码
@property (weak, nonatomic) IBOutlet AddFleetTextField *reNewPasswordF;

/// 确认按钮
@property (weak, nonatomic) IBOutlet AddDriverButton *commitBtn;

/// scrollContentView 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

/// App
@property (strong, nonatomic) AppDelegate *app;

/// 业务类
@property (strong, nonatomic) UpdatePasswordService *service;

@end


@implementation UpdatePasswordViewController

#pragma mark - 生命周期

- (instancetype)init {
    
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _service = [[UpdatePasswordService alloc] init];
        _service.delegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"修改密码";
    
    _oldPasswordF.labelText = @"旧密码：";
    _newpasswordF.labelText = @"新密码：";
    _reNewPasswordF.labelText = @"确认新密码：";
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    _scrollContentViewHeight.constant = CGRectGetMaxY(_commitBtn.frame) + 20;
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 事件

- (IBAction)commitOnclick:(UIButton *)sender {
    
    [self.view endEditing:YES];
    NSString *old = _oldPasswordF.textTrim;
    NSString *new = _newpasswordF.textTrim;
    NSString *reNew = _reNewPasswordF.textTrim;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        usleep(300000);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if([old isEqualToString:_app.user.pASSWORD]) {
                
                if([new isEqualToString:reNew]) {
                    
                    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    [_service UpdatePassword:_app.user.iDX andOldPassWord:[old MD5]  andNewPassWord:[new MD5]];
                } else {
                    
                    [Tools showAlert:self.view andTitle:@"新密码不一致"];
                }
            } else {
                
                [Tools showAlert:self.view andTitle:@"旧密码不正确"];
            }
        });
    });
}


- (IBAction)inPutChange:(UITextField *)sender {
    
    if(![_oldPasswordF.textTrim isEqualToString:@""] && ![_newpasswordF.textTrim isEqualToString:@""] && ![_reNewPasswordF.textTrim isEqualToString:@""]) {
        
        [_commitBtn setEnabled:YES];
    } else {
        
        [_commitBtn setEnabled:NO];
    }
}


#pragma mark - UpdatePasswordServiceDelegate

- (void)successOfUpdatePassword {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:@"修改成功"];
    
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:udPassWord];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        usleep(500000);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // 返回到未登录状态
            MainViewController *vc = [[MainViewController alloc] init];
            
            for(int i = 0; i < self.navigationController.viewControllers.count; i++) {
                UIViewController *tab = self.navigationController.viewControllers[i];
                if([tab isKindOfClass:[UITabBarController class]]) {
                    
                    NSArray *vcs = tab.childViewControllers;
                    for (int j = 0; j < vcs.count; j++) {
                        
                        UIViewController *vc = vcs[j];
                        if([vc isKindOfClass:[PushNewsViewController class]]) {
                            
                            PushNewsViewController *pushVc = (PushNewsViewController *)vc;
                            [pushVc.localTimer invalidate];
                        }
                    }
                }
            }
            
            [Tools setRootViewControllerWithCrossDissolve:_app.window andViewController:vc];
        });
    });
}


- (void)failureOfUpdatePassword:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
