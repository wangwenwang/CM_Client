//
//  TruckDriverManViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/2/17.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "TruckDriverManViewController.h"
#import "DriverListViewController.h"
#import "TruckListViewController.h"

@interface TruckDriverManViewController ()

@end

@implementation TruckDriverManViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"管理详情";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)DriverManOnclick:(UIButton *)sender {
    
    DriverListViewController *vc = [[DriverListViewController alloc] init];
    vc.fleetIdx = _fleetM.iDX;
    vc.FLEET_PROPERTY = _fleetM.fLEETPROPERTY;
    vc.title = @"司机管理";
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)TruckManOnclick:(UIButton *)sender {
    
    TruckListViewController *vc = [[TruckListViewController alloc] init];
    vc.fleetIdx = _fleetM.iDX;
    vc.FLEET_PROPERTY = _fleetM.fLEETPROPERTY;
    vc.title = @"车辆管理";
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
