//
//  PushOrderViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/3/30.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "PushOrderViewController.h"
#import "OrderNoListModel.h"
#import "OrderInfoViewController.h"

@interface PushOrderViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PushOrderViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"订单列表";
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   return _orders.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellid = @"PushOrderViewController";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if(!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    OrderNoListModel *m = _orders[indexPath.row];
    cell.textLabel.text = m.oRDNO;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    OrderInfoViewController *vc = [[OrderInfoViewController alloc] init];
    
    OrderNoListModel *m = _orders[indexPath.row];
    vc.orderIdx = m.oRDIDX;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
