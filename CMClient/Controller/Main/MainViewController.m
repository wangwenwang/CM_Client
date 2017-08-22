//
//  MainViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/2/23.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "Tools.h"


@interface MainViewController () {
    
    AppDelegate *_app;
}

@end


@implementation MainViewController

#pragma mark - 生命周期

- (instancetype)init {
    
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    
    LMLog(@"dealloc");
}


#pragma mark - 事件

- (IBAction)registerOnclick:(UIButton *)sender {
    
    RegisterViewController *registerVc = [[RegisterViewController alloc] init];
    
    [Tools setRootViewControllerWithCrossDissolve:_app.window andViewController:registerVc];
}


- (IBAction)loginOnclick:(UIButton *)sender {
    
    LoginViewController *loginVc = [[LoginViewController alloc] init];
    
    [Tools setRootViewControllerWithCrossDissolve:_app.window andViewController:loginVc];
}

@end
