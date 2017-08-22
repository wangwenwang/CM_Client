//
//  FleetListViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/2/16.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "FleetListViewController.h"
#import "TruckDriverManViewController.h"
#import "Tools.h"
#import "FleetListService.h"
#import "FleetListModel.h"
#import <MBProgressHUD.h>
#import "AddFleetViewController.h"
#import "FleetListTableViewCell.h"
#import "SupplyInfoViewController.h"

@interface FleetListViewController ()<UITableViewDelegate, UITableViewDataSource, FleetListServiceDelegate> {
    
    FleetListModel *_fleetListM;
    AppDelegate *_app;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

/// 是否选择车队
@property (assign, nonatomic) BOOL isChoose;

@end

@implementation FleetListViewController

#pragma mark - 生命周期
- (instancetype)init {
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _isChoose = NO;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.navigationController.viewControllers.count > 0) {
        
        if([self.navigationController.viewControllers[1] isKindOfClass:[SupplyInfoViewController class]]) {
            
            _isChoose = YES;
        }
    }
    
    if(!_isChoose) [Tools addNavRightItemTypeAdd:self andAction:@selector(addFleetList)];
    
    //请求网络数据
    [self requestNetWorkData];
    
    //注册通知
    [self addNotification];
    
    //注册Cell
    [self registCell];
}


- (void)viewWillAppear:(BOOL)animated {
    
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    
    [self removeNotification];
}


#pragma mark - 事件
- (void)addFleetList {
    
    AddFleetViewController *vc = [[AddFleetViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _fleetListM.fleetModel.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"FleetListTableViewCell";
    
    FleetListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    FleetModel *m = _fleetListM.fleetModel[indexPath.row];
    
    cell.fleetNameLabel.text = m.fLEETNAME;
    cell.companyNameLabel.text = m.tMSNAME;
    cell.comtactTelLabel.text = m.cONTACTTEL;
    
    if([m.fLEETPROPERTY isEqualToString:@"COMPANY"]) {
        
        cell.fleetTypeImageView.image = [UIImage imageNamed:@"fleet_company"];
    } else if([m.fLEETPROPERTY isEqualToString:@"INDIVIDUAL"]) {
        
        cell.fleetTypeImageView.image = [UIImage imageNamed:@"fleet_individual"];
    } else {
        
        cell.fleetTypeImageView.image = nil;
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    FleetModel *m = _fleetListM.fleetModel[indexPath.row];
    
    if(_isChoose) {
        
        NSDictionary *fleetM = @{@"fleetM" : m};
        [[NSNotificationCenter defaultCenter] postNotificationName:kSupplyInfoVC_refreshFleet_Notification object:nil userInfo:fleetM];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        
        TruckDriverManViewController *vc = [[TruckDriverManViewController alloc] init];
        vc.fleetM = m;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark - FleetListServiceDelegate
- (void)successOfGetFleetList:(FleetListModel *)fleetListM {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    _fleetListM = fleetListM;
    [_tableView reloadData];
}


- (void)successGetFleetListNoData {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}


- (void)failureOfGetFleetList:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}

#pragma mark - 功能方法

- (void)registCell {
    
    [_tableView registerNib:[UINib nibWithNibName:@"FleetListTableViewCell" bundle:nil] forCellReuseIdentifier:@"FleetListTableViewCell"];
}


/**
 请求网络数据
 */
- (void)requestNetWorkData {
    
    FleetListService *service = [[FleetListService alloc] init];
    service.delegate = self;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [service getFleetList:_app.user.iDX];
}


- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestNetWorkData) name:kFleetListVC_RequestNetWorkData_Notification object:nil];
}


- (void)removeNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kFleetListVC_RequestNetWorkData_Notification object:nil];
}

@end
