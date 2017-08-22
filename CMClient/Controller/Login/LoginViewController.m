//
//  LoginViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/1/14.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginService.h"
#import "Tools.h"
#import <MBProgressHUD.h>

/// 4个page
#import "PushNewsViewController.h"
#import "SupplyListViewController.h"
#import "WMPageController.h"
#import "MineViewController.h"

/// 三个装运状态
#import "ZYNoPayViewController.h"
#import "ZYAllViewController.h"
#import "ZYPayedViewController.h"

/// 跳回去
#import "MainViewController.h"

//
#define kPageControllerMenuHeight 44


@interface MBExample : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) SEL selector;

@end


@interface LoginViewController () <LoginServiceDelegate, BMKLocationServiceDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameT;
@property (weak, nonatomic) IBOutlet UITextField *passWordT;

/// 登录
- (IBAction)loginOnclick:(UIButton *)sender;

/// 全局变量
@property (strong, nonatomic) AppDelegate *app;

/// 网络操作层
@property (strong, nonatomic) LoginService *service;

/// 忘记密码
@property (weak, nonatomic) IBOutlet UIButton *forgetPasswordBtn;

/// scrollContentView 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

@end

@implementation LoginViewController

#pragma mark - 生命周期

- (instancetype)init {
    
    if (self = [super init]) {
        
        _service = [[LoginService alloc] init];
        _service.delegate = self;
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self setUserNameAndPassword];
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    _scrollContentViewHeight.constant = CGRectGetMaxY(_forgetPasswordBtn.frame);
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 私有方法

// 填充上一次登录成功的帐号密码
- (void)setUserNameAndPassword {
    
    UserModel *userM = [Tools getUserModelInUserDefaults];
    if(userM.uSERCODE) _userNameT.text = userM.uSERCODE;
    if(userM.pASSWORD) _passWordT.text = userM.pASSWORD;
}


- (WMPageController *)p_defaultController {
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    NSMutableArray *titles = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        Class vcClass;
        NSString *title;
        switch (i) {
            case 0:
                vcClass = [ZYNoPayViewController class];
                title = @"未完成";
                break;
            case 1:
                vcClass = [ZYPayedViewController class];
                title = @"已完成";
                break;
            default:
                vcClass = [ZYAllViewController class];
                title = @"全部";
                break;
        }
        [viewControllers addObject:vcClass];
        [titles addObject:title];
    }
    WMPageController *pageVC = [[WMPageController alloc] initWithViewControllerClasses:viewControllers andTheirTitles:titles];
    pageVC.menuItemWidth = 85;
    pageVC.menuHeight = kPageControllerMenuHeight;
    pageVC.titleColorSelected = CMColor;
    pageVC.postNotification = YES;
    pageVC.bounces = YES;
    // 下划线
    pageVC.menuViewStyle = WMMenuViewStyleLine;
    pageVC.titleSizeSelected = 15;
    pageVC.selectIndex = 0;
    return pageVC;
}


#pragma mark - 事件

- (IBAction)loginOnclick:(UIButton *)sender {
    
    [self.view endEditing:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = @"登录中...";
    [hud showAnimated:YES];
    
    LoginService *service = [[LoginService alloc] init];
    service.delegate = self;
    [service login:_userNameT.text andPassWord:_passWordT.text andVerifiCode:@""];
}


- (IBAction)backOnclick:(UIButton *)sender {
    
    MainViewController *loginVc = [[MainViewController alloc] init];
    
    [Tools setRootViewControllerWithCrossDissolve:_app.window andViewController:loginVc];
}


- (IBAction)forgetPasswordOnclick:(UIButton *)sender {
    
    [Tools showAlert:self.view andTitle:@"正在建设中..."];
}


#pragma mark - LoginServiceDelegate

- (void)successOfLogin {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        _app.CID = @"0a94c7c51108b35935ddf1c06c277e77";
        
        while ([_app.CID isEqualToString:@""]){
            
            unsigned int dealyTime = 2;
            LMLog(@"cid为空，延迟%d秒调用上传token函数", dealyTime);
            sleep(dealyTime);
        }
        
        [_service uploadToken:_app.user.iDX andCID:_app.CID andToken:_app.DEVICE_TOKEN];
    });
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    //子控制器
    PushNewsViewController *pushVC = [[PushNewsViewController alloc] initWithStartLocation:NO];
    SupplyListViewController *supplyVC = [[SupplyListViewController alloc] init];
    MineViewController *mineVC = [[MineViewController alloc] init];
    WMPageController *pageVC = [self p_defaultController];
    
    // tabbar导航
    UITabBarController *tbc = [[UITabBarController alloc] init];
    tbc.tabBar.tintColor = CMColor;
    
    tbc.viewControllers = @[pushVC, supplyVC, pageVC, mineVC];
    
    //nav导航
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tbc];
    
    [Tools setRootViewControllerWithCrossDissolve:_app.window andViewController:nav];
}


- (void)failureOfLogin:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}


- (void)dealloc {
    
    LMLog(@"dealloc");
}

@end
