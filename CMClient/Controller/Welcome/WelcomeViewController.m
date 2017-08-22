//
//  WelcomeViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/1/14.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "WelcomeViewController.h"
#import "Tools.h"
#import "MainViewController.h"
#import "LoginService.h"
#import "LoginViewController.h"

// 产品经理要求，不对外开放注册功能
#import "Login2ViewController.h"

@interface WelcomeViewController ()

// 计时器，启动页时间
@property (strong, nonatomic) NSTimer *timer;

@property(strong, nonatomic) AppDelegate *app;

@end

@implementation WelcomeViewController

#pragma mark - 生命周期

- (instancetype)init {
    
    if (self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 倒计时，跳过启动页
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(skipAd) userInfo:nil repeats:YES];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)skipAd {
    
    if(_timer) {
        [_timer invalidate];
    }
    
    
    //    Login2ViewController *loginVc = [[Login2ViewController alloc] init];
    
    //nav导航
    //    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVc];
    
    UserModel *userM = [Tools getUserModelInUserDefaults];
    
    if(userM) {
        
        _app.user = userM;
        
        LoginViewController *vc = [[LoginViewController alloc] init];
        [vc successOfLogin];
    } else {
        
        MainViewController *mainVc = [[MainViewController alloc] init];
        [Tools setRootViewControllerWithCrossDissolve:_app.window andViewController:mainVc];
    }
}

@end
