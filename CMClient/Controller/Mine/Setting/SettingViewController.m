//
//  SettingViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/2/22.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "SettingViewController.h"
#import <Masonry.h>
#import "MainViewController.h"
//#import "Login2ViewController.h"
#import "Tools.h"
#import "PushNewsViewController.h"
#import "PersonalInfoViewController.h"
#import "UpdatePasswordViewController.h"

/// Section之间的高度
#define kSectionHeight 30

/// CELL名称
#define kCellName @"cell_id"

@interface SettingViewController () <UITableViewDelegate, UITableViewDataSource> {
    
    NSArray *_settingPlist;
    AppDelegate *_app;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SettingViewController


- (instancetype)init {
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    
    [self getPlistData];
    
    _tableView.sectionHeaderHeight = 0;
    _tableView.sectionFooterHeight = kSectionHeight;
    _tableView.contentInset = UIEdgeInsetsMake(kSectionHeight - 47, 0, 0, 0);
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _settingPlist.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_settingPlist[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cell_id = kCellName;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    
    NSString *title = _settingPlist[indexPath.section][indexPath.row][@"title"];
    
    if(indexPath.section == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if(indexPath.section == 1) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = CMRedColor;
        label.text = title;
        [label setFont:[UIFont systemFontOfSize:15]];
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(cell.contentView);
        }];
    } else {
        
        cell.textLabel.text = title;
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *title = _settingPlist[indexPath.section][indexPath.row][@"title"];
    
    if([title isEqualToString:@"退出登录"]) {
        
        MainViewController *vc = [[MainViewController alloc] init];
        
//        Login2ViewController *loginVc = [[Login2ViewController alloc] init];
//        //nav导航
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVc];
        
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
    } else if([title isEqualToString:@"个人信息"]) {
        
        PersonalInfoViewController *vc = [[PersonalInfoViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if([title isEqualToString:@"修改密码"]) {
        
        UpdatePasswordViewController *vc = [[UpdatePasswordViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        
        [Tools showAlert:self.view andTitle:@"正在建设中..."];
    }
}


#pragma mark - 功能函数
/**
 获取Plist数据
 */
- (void)getPlistData {
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Setting.plist" ofType:nil];
    _settingPlist = [NSArray arrayWithContentsOfFile:path];
}

@end
