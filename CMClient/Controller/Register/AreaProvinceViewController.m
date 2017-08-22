//
//  AreaProvinceViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/3/21.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "AreaProvinceViewController.h"
#import "AreaCityViewController.h"
#import "MyBMKLocationService.h"
#import "PersonalInfoViewController.h"

@interface AreaProvinceViewController ()<UITableViewDelegate, UITableViewDataSource, MyBMKLocationServiceDelegate, BMKLocationServiceDelegate> {
    
    NSArray *_addressM;
    
    /// 二次封装的定位
    MyBMKLocationService *_myLocationService;
    
    NSString *_area;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AreaProvinceViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"地区";
    
    [self getPlistData];
    
    // 自动判断push进来，还是模态进来
    if (self.presentingViewController) {
        
        [self addLeftButton];
    }
    
    [self startLocationService];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)addLeftButton {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(backOnclick)];
    self.navigationItem.leftBarButtonItem = item;
}


- (void)backOnclick {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)startLocationService {
    // 百度地图定位服务
    _myLocationService = [[MyBMKLocationService alloc] init];
    _myLocationService.delegate = self;
    _myLocationService.myDelegate = self;
}


#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if(section == 0) {
        
        return @"定位到的位置";
    } else if(section == 1) {
        
        return @"全部";
    } else {
        
        return @"看不到我，就是看不到我";
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(section == 0) {
        
        return 1;
    } else if(section == 1) {
        
        return _addressM.count;
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if(!cell) {
        
        cell = [[UITableViewCell alloc] init];
        
    }
    
    if(indexPath.section == 0) {
        
        cell.textLabel.text = _area;
    } else if(indexPath.section == 1) {
        
        cell.textLabel.text = _addressM[indexPath.row][@"state"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.section == 0) {
        
        if(_area) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:kAreaCity_reloadData_Notification object:nil userInfo:@{@"city":_area}];
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
        }
        
    } else if(indexPath.section == 1) {
        
        NSString *province = _addressM[indexPath.row][@"state"];
        NSArray *citys = _addressM[indexPath.row][@"cities"];
        
        AreaCityViewController *vc = [[AreaCityViewController alloc] init];
        vc.citys = citys;
        vc.province = province;
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark - 功能函数

/**
 获取Plist数据
 */
- (void)getPlistData {
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"ChinaArea.plist" ofType:nil];
    _addressM = [NSArray arrayWithContentsOfFile:path];
}


#pragma mark - MyBMKLocationServiceDelegate

- (void)successUploadLocation:(BMKUserLocation *)userLocation {
    
    BMKCoordinateRegion region;
    
    region.center.latitude  = userLocation.location.coordinate.latitude;
    region.center.longitude = userLocation.location.coordinate.longitude;
    region.span.latitudeDelta = 0;
    region.span.longitudeDelta = 0;
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation: userLocation.location completionHandler:^(NSArray *array, NSError *error) {
        if (array.count > 0) {
            CLPlacemark *placemark = [array objectAtIndex:0];
            if (placemark != nil) {
                NSString *city = placemark.locality;
                NSString *province = placemark.administrativeArea;
                city = [city stringByReplacingOccurrencesOfString:@"市" withString:@""];
                province = [province stringByReplacingOccurrencesOfString:@"省" withString:@""];
                _area = [NSString stringWithFormat:@"%@  %@", province, city];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [_tableView reloadData];
                });
                
                //找到了当前位置城市后就关闭服务
                [_myLocationService stopUserLocationService];
                
            }
        }
    }];
}

@end
