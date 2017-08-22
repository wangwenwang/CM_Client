//
//  TruckDetailViewController.m
//  CMDriver
//
//  Created by 凯东源 on 17/2/17.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "TruckDetailViewController.h"
#import "TruckDetailService.h"
#import "AddFleetTextField.h"
#import "PhotoBroswerVC.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Tools.h"

@interface TruckDetailViewController ()<TruckDetailServiceDelegate>


// scrollContentView 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

// 车牌号
@property (weak, nonatomic) IBOutlet AddFleetTextField *plateNumberF;

// 车辆类型
@property (weak, nonatomic) IBOutlet AddFleetTextField *vehicleModelF;

// 车辆尺寸
@property (weak, nonatomic) IBOutlet AddFleetTextField *vehicleSizeF;

// 品牌型号
@property (weak, nonatomic) IBOutlet AddFleetTextField *brandModelF;

// 车辆颜色
@property (weak, nonatomic) IBOutlet AddFleetTextField *vehicleColorF;

// 最大载重量
@property (weak, nonatomic) IBOutlet AddFleetTextField *maxWeightF;

// 最大装载量
@property (weak, nonatomic) IBOutlet AddFleetTextField *maxVolumeF;

// 驾驶证正面
@property (weak, nonatomic) IBOutlet UIImageView *drivingLicense_forword_imageView;

// 驾驶证副页
@property (weak, nonatomic) IBOutlet UIImageView *drivingLicense_back_imageView;

// 车头照片
@property (weak, nonatomic) IBOutlet UIImageView *truck_header_imageView;

// 车辆详情
@property (nonatomic, strong) TruckDetailModel *truckDetailM;

// 网络层
@property (nonatomic, strong) TruckDetailService *service;

// 车头图片父视图
@property (weak, nonatomic) IBOutlet UIView *truck_header_image;

// 图片数组
@property (strong, nonatomic) NSMutableArray *imagess;

// 图片容器
@property (weak, nonatomic) IBOutlet UIView *pictureContainerView;

@end

@implementation TruckDetailViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[TruckDetailService alloc] init];
        _service.delegate = self;
        _imagess = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"车辆详情";
    
    _plateNumberF.labelText = @"车牌号";
    _vehicleModelF.labelText = @"车辆类型";
    _vehicleSizeF.labelText = @"车辆尺寸";
    _brandModelF.labelText = @"品牌型号";
    _vehicleColorF.labelText = @"车辆颜色";
    _maxWeightF.labelText = @"最大载重量";
    _maxVolumeF.labelText = @"最大装载量";
    
    _plateNumberF.textColor = CMRedColor;
    _vehicleModelF.textColor = CMRedColor;
    _vehicleSizeF.textColor = CMRedColor;
    _brandModelF.textColor = CMRedColor;
    _vehicleColorF.textColor = CMRedColor;
    _maxWeightF.textColor = CMRedColor;
    _maxVolumeF.textColor = CMRedColor;
    
    [_service SearchVehicle:_PLATE_NUMBER andstrFleetIdx:_fleetIdx];
}


- (void)updateViewConstraints {
    
    [super updateViewConstraints];
    
    _scrollContentViewHeight.constant = CGRectGetMaxY(_pictureContainerView.frame) + 20;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 手势

// 驾驶证正面
- (IBAction)driver_forword_onclick:(UITapGestureRecognizer *)sender {
    
    [self checkPicture:0];
}


// 驾驶证副页
- (IBAction)driver_back_onclick:(UITapGestureRecognizer *)sender {
    
    [self checkPicture:1];
}


// 车头照片
- (IBAction)truck_header_onclick:(UITapGestureRecognizer *)sender {
    
    [self checkPicture:2];
}


- (void)checkPicture:(NSUInteger)index {
    
    __weak typeof(self) weakSelf = self;
    
    [PhotoBroswerVC show:self type:PhotoBroswerVCTypeZoom index:index photoModelBlock:^NSArray *{
        
        NSArray *localImages = [_imagess copy];
        
        NSMutableArray *modelsM = [NSMutableArray arrayWithCapacity:localImages.count];
        for (NSUInteger i = 0; i< localImages.count; i++) {
            
            PhotoModel *pbModel=[[PhotoModel alloc] init];
            pbModel.mid = i + 1;
            pbModel.image = localImages[i];
            
            //源frame
            UIImageView *imageV = (UIImageView *)_pictureContainerView.subviews[i];
            
            pbModel.sourceImageView = imageV;
            
            [modelsM addObject:pbModel];
        }
        
        return modelsM;
    }];
}


#pragma mark - TruckDetailServiceDelegate

- (void)successOfTruckDetail:(TruckDetailModel *)truckDetailM {
    
    _truckDetailM = truckDetailM;
    
    _plateNumberF.text = _truckDetailM.pLATENUMBER;
    _vehicleModelF.text = _truckDetailM.vEHICLEMODEL;
    _vehicleSizeF.text = _truckDetailM.vEHICLESIZE;
    _brandModelF.text = _truckDetailM.bRANDMODEL;
    _vehicleColorF.text = _truckDetailM.vEHICLECOLOR;
    _maxWeightF.text = [NSString stringWithFormat:@"%@吨", _truckDetailM.mAXWEIGHT];
    _maxVolumeF.text = [NSString stringWithFormat:@"%@(m³)", _truckDetailM.mAXVOLUME];
    
    
    NSURL *path1 = [Tools getCompleteUrl:_truckDetailM.pictureFile1];
    
    NSURL *path2 = [Tools getCompleteUrl:_truckDetailM.pictureFile2];
    
    NSURL *path3 = [Tools getCompleteUrl:_truckDetailM.autographFile];
    
    if(![_truckDetailM.pictureFile1 isEqualToString:@""]) {
        
        UIImage *defaultImage = [UIImage imageNamed:@"truck_drivingLicense_forword_prompt"];
        [_imagess addObject:defaultImage];
        [_drivingLicense_forword_imageView sd_setImageWithURL:path1 placeholderImage:defaultImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            [_imagess replaceObjectAtIndex:0 withObject:_drivingLicense_forword_imageView.image];
        }];
    }
    
    if(![_truckDetailM.pictureFile2 isEqualToString:@""]) {
        
        UIImage *defaultImage = [UIImage imageNamed:@"truck_drivingLicense_back_prompt"];
        [_imagess addObject:defaultImage];
        [_drivingLicense_back_imageView sd_setImageWithURL:path2 placeholderImage:defaultImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            [_imagess replaceObjectAtIndex:1 withObject:_drivingLicense_back_imageView.image];
        }];
    }
    
    if(![_truckDetailM.autographFile isEqualToString:@""]) {
        
        UIImage *defaultImage = [UIImage imageNamed:@"truck_header_prompt"];
        [_imagess addObject:defaultImage];
        [_truck_header_imageView sd_setImageWithURL:path3 placeholderImage:defaultImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            [_imagess replaceObjectAtIndex:2 withObject:_truck_header_imageView.image];
        }];
    }
}


- (void)failureOfTruckDetail:(NSString *)msg {
    
    
}

@end
