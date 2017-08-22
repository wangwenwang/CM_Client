//
//  PersonalInfoViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/3/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "PersonalInfoService.h"
#import <MBProgressHUD.h>
#import "Tools.h"
#import "PersonalInfoTableViewCell.h"
#import "ModifyUserInfoService.h"
#import "AreaProvinceViewController.h"


/// Section之间的高度
#define kSectionHeight 30

/// CELL名称
#define kCellName @"PersonalInfoTableViewCell"


@interface PersonalInfoViewController ()<PersonalInfoServiceDelegate, UITableViewDelegate, UITableViewDataSource, ModifyUserInfoServiceDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) UserModel *userM;

@property (strong, nonatomic) PersonalInfoService *service;

@property (strong, nonatomic) AppDelegate *app;

@property (strong, nonatomic) NSArray *personalPlist;

@property (strong, nonatomic) NSMutableArray *personals;

@property (strong, nonatomic) ModifyUserInfoService *service_ModifyU;

@end

@implementation PersonalInfoViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[PersonalInfoService alloc] init];
        _service.delegate = self;
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _personals = [[NSMutableArray alloc] init];
        _service_ModifyU = [[ModifyUserInfoService alloc] init];
        _service_ModifyU.delegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"个人信息";
    
    _tableView.sectionHeaderHeight = 0;
    _tableView.sectionFooterHeight = kSectionHeight;
    _tableView.contentInset = UIEdgeInsetsMake(kSectionHeight - 47, 0, 0, 0);
    
    [self getPlistData];
    
    [self registerCell];
    
    [self requestNetWorkData];
    
    [self addNotification];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    
    [self removeNotification];
}


#pragma mark - 功能函数

- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData:) name:kAreaCity_reloadData_Notification object:nil];
}


- (void)removeNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kAreaCity_reloadData_Notification object:nil];
}


- (void)reloadData:(NSNotification *)aNotifica {
    
    NSString *city = aNotifica.userInfo[@"city"];
    [self modifyInfo:city andSection:1 andRow:3];
}


- (void)registerCell {
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
}


- (void)getPlistData {
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Personal.plist" ofType:nil];
    _personalPlist = [NSArray arrayWithContentsOfFile:path];
}


- (void)requestNetWorkData {
    
    [_service GetUserInfo:_app.user.iDX];
}


// 修改本地值
- (void)modifyInfo:(NSString *)key andSection:(NSUInteger)section andRow:(NSUInteger)row {
    
    NSString *title = _personals[section][row][@"title"];
    NSDictionary *dicM = @{@"title" : title, @"key" : key};
    _personals[section][row] = dicM;
    
    [self ModifyUserInfo_Service];
    
    [_tableView reloadData];
}


// 修改服务器值
- (void)ModifyUserInfo_Service {
    
//    NSDictionary *dict = @{@"UserId" : _app.user.iDX,
//                           @"USER_CODE" : @"",
//                           @"ADDRESS" : @"广东中山1",
//                           @"Avatar" : @""
//                           };
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSDictionary *d1 = @{@"UserId" : _app.user.iDX};
    NSDictionary *d2 = @{@"Avatar" : @""};
    [dict addEntriesFromDictionary:d1];
    [dict addEntriesFromDictionary:d2];
    
    for(int i = 0; i < _personals.count; i++) {
        
        NSMutableArray *section = _personals[i];
        for(int j = 0; j < section.count; j++) {
            
            NSDictionary *dic = section[j];
            if([dic[@"title"] isEqualToString:@"手机号码"]) {
                
                NSDictionary *d3 = @{@"USER_CODE" : dic[@"key"]};
                [dict addEntriesFromDictionary:d3];
            } else if([dic[@"title"] isEqualToString:@"用户常住地"]) {
                
                NSDictionary *d4 = @{@"ADDRESS" : dic[@"key"]};
                [dict addEntriesFromDictionary:d4];
            }
        }
    }
    
    [_service_ModifyU ModifyUserInfo:dict];
}


#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _personals.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_personals[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = kCellName;
    
    PersonalInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    NSString *title = _personals[indexPath.section][indexPath.row][@"title"];
    NSString *key = _personals[indexPath.section][indexPath.row][@"key"];
    
    [cell setCellData:title andKey:key andSection:indexPath.section andRow:indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *title = _personals[indexPath.section][indexPath.row][@"title"];
    if([title isEqualToString:@"用户常住地"]) {
        
        AreaProvinceViewController *vc = [[AreaProvinceViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
        //nav导航
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//        [self presentViewController:nav animated:YES completion:nil];
        
    }
}


#pragma mark - PersonalInfoServiceDelegate

- (void)successOfGetUserInfo:(UserModel *)userM {
    
    _userM = userM;
    
    for(int i = 0; i < _personalPlist.count; i++) {
        
        NSArray *section = _personalPlist[i];
        NSMutableArray *sectionM = [[NSMutableArray alloc] init];
        for(int j = 0; j < section.count; j++) {
            
            NSDictionary *dict= section[j];
            NSString *title = dict[@"title"];
            
            NSDictionary *dicM = nil;
            
            // 做 ？ 判断 是为了避免服务器传来的数据的key不匹配，导致_userM里的值为nil，导致carsh
            if([title isEqualToString:@"姓名"]) {
                dicM = @{@"title":title, @"key": _userM.uSERNAME ? _userM.uSERNAME : @""};
            } else if([title isEqualToString:@"手机号码"]) {
                
                dicM = @{@"title":title, @"key": _userM.uSERCODE ? _userM.uSERCODE : @""};
            } else if([title isEqualToString:@"公司名称"]) {
                
                dicM = @{@"title":title, @"key": _userM.cOMPANYNAME ? _userM.cOMPANYNAME : @""};
            } else if([title isEqualToString:@"所属车队"]) {
                
                dicM = @{@"title":title, @"key": _userM.fLEETTYPE ? _userM.fLEETTYPE : @""};
            } else if([title isEqualToString:@"推荐人"]) {
                
                dicM = @{@"title":title, @"key": _userM.rECOMNAME ? _userM.rECOMNAME : @""};
            } else if([title isEqualToString:@"用户常住地"]) {
                
                dicM = @{@"title":title, @"key": _userM.aDDRESS ? _userM.aDDRESS : @""};
            }
            [sectionM addObject:dicM];
            NSLog(@"");
        }
        [_personals addObject:sectionM];
    }
    
    [_tableView reloadData];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
