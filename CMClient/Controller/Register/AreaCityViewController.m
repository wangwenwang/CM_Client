//
//  AreaCityViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/3/21.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "AreaCityViewController.h"
#import "PersonalInfoViewController.h"

@interface AreaCityViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AreaCityViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"地区";
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, ScreenWidth, CGRectGetHeight(view.frame))];
    [label setFont:[UIFont systemFontOfSize:12.0]];
    label.textColor = [UIColor grayColor];
    label.text = @"全部";
    
    [view addSubview:label];
    
    _tableView.tableHeaderView = view;
    
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _citys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if(!cell) {
        
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = _citys[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *province = _province;
    NSString *city = _citys[indexPath.row];
    
    city = [city stringByReplacingOccurrencesOfString:@"市" withString:@""];
    province = [province stringByReplacingOccurrencesOfString:@"省" withString:@""];
    NSString *area = [NSString stringWithFormat:@"%@  %@", province, city];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kAreaCity_reloadData_Notification object:nil userInfo:@{@"city":area}];
    
    
    if (self.presentingViewController) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        
        for(int i = 0; i < self.navigationController.viewControllers.count; i++) {
            
            UIViewController *vc = self.navigationController.viewControllers[i];
            
            if([vc isKindOfClass:[PersonalInfoViewController class]]) {
                
                [self.navigationController popToViewController:vc animated:YES];
            }
        }
    }

    
    
    //    if(indexPath.row == 0) {
    //
    //        LogListTableViewController *vc = [[LogListTableViewController alloc] init];
    //        vc.title = _minePlistArrM[indexPath.row][@"title"];
    //        [self.navigationController pushViewController:vc animated:YES];
    //    } else if(indexPath.row == 1) {
    //
    //        FleetListViewController *vc = [[FleetListViewController alloc] init];
    //        vc.title = _minePlistArrM[indexPath.row][@"title"];
    //        [self.navigationController pushViewController:vc animated:YES];
    //    } else {
    //
    //        [Tools showAlert:self.view andTitle:@"正在建设中..."];
    //    }
}

@end
