//
//  AddTruckViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/3/2.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "AddTruckViewController.h"
#import "AddTruckServer.h"
#import "Tools.h"
#import "AddFleetTextField.h"
#import "AddFleetButton.h"
#import <MBProgressHUD.h>

@interface AddTruckViewController ()<AddTruckServerDelegate> {
    
    AppDelegate *_app;
    UIImagePickerController *pickerController;
}

/// 车牌号
@property (weak, nonatomic) IBOutlet AddFleetTextField *plateNumberF;

/// 车辆类型
@property (weak, nonatomic) IBOutlet AddFleetTextField *vehicleModelF;

/// 车辆尺寸
@property (weak, nonatomic) IBOutlet AddFleetTextField *vehicleSizeF;

/// 品牌型号
@property (weak, nonatomic) IBOutlet AddFleetTextField *brandModelF;

/// 车辆颜色
@property (weak, nonatomic) IBOutlet AddFleetTextField *vehicleColorF;

/// 最大载重量
@property (weak, nonatomic) IBOutlet AddFleetTextField *maxWeightF;

/// 最大装载量
@property (weak, nonatomic) IBOutlet AddFleetTextField *maxVolumeF;

/// 提交按钮
@property (weak, nonatomic) IBOutlet AddFleetButton *commitBtn;

/// 网络请求服务
@property (strong, nonatomic) AddTruckServer *service;

// scrollContentView 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

@property (strong, nonatomic) UIImageView *image1;

@property (strong, nonatomic) UIImageView *image2;

@property (strong, nonatomic) UIImageView *image3;

@end


@implementation AddTruckViewController


#pragma mark - 生命周期

- (instancetype)init {
    if(self = [super init]) {
        
        _service = [[AddTruckServer alloc] init];
        _service.delegate = self;
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加车辆";
    
    _plateNumberF.labelText = @"车牌号";
    _vehicleModelF.labelText = @"车辆类型";
    _vehicleSizeF.labelText = @"车辆尺寸";
    _brandModelF.labelText = @"品牌型号";
    _vehicleColorF.labelText = @"车辆颜色";
    _maxWeightF.labelText = @"最大载重量";
    _maxVolumeF.labelText = @"最大装载量";
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    _scrollContentViewHeight.constant = CGRectGetMaxY(_commitBtn.frame) + 20;
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 照片
- (void)createData {
    
    // 初始化pickerController
    pickerController = [[UIImagePickerController alloc] init];
    pickerController.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    pickerController.delegate = self;
    pickerController.allowsEditing = YES;
}


// 跳转到imagePicker里
- (void)makePhoto {
    
    pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:pickerController animated:YES completion:nil];
}


// 跳转到相册
- (void)choosePicture {
    
    pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:pickerController animated:YES completion:nil];
}


// 跳转图库
- (void)pictureLibrary {
    
    pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:pickerController animated:YES completion:nil];
}


#pragma mark - 事件

- (IBAction)commitOnclick:(UIButton *)sender {
    
    [self.view endEditing:YES];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        usleep(500000);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if([_maxWeightF isPureFloat] || [_maxWeightF.textTrim isEqualToString:@""]) {
                if([_maxVolumeF isPureFloat] || [_maxVolumeF.textTrim isEqualToString:@""]) {
                    
                    NSString *w1 = [Tools convertImageToString:_image1.image];
                    NSString *w2 = [Tools convertImageToString:_image2.image];
                    NSString *w3 = [Tools convertImageToString:_image3.image];
                    
                    [_service addTruck:_app.user.iDX andFLEET_ID:_fleetIdx andPLATE_NUMBER:_plateNumberF.textTrim andVEHICLE_MODEL:_vehicleModelF.textTrim andVEHICLE_SIZE:_vehicleSizeF.textTrim andBRAND_MODEL:_brandModelF.textTrim andVEHICLE_COLOR:_vehicleColorF.textTrim andMAX_WEIGHT:[_maxWeightF.textTrim floatValue] andMAX_VOLUME:[_maxVolumeF.textTrim floatValue] andPictureFile1:w1 andPictureFile2:w2 andAutographFile:w3];
                    
                    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                } else {
                    
                    [Tools showAlert:self.view andTitle:@"最大装载量不合法，只能输入数字"];
                }
            } else {
                
                [Tools showAlert:self.view andTitle:@"最大载重不合法，只能输入数字"];
            }
        });
    });
    
    
}


- (IBAction)textChanged:(UITextField *)sender {
    
    if([_plateNumberF.textTrim isEqualToString:@""]) {
        
        [_commitBtn setEnabled:NO];
        
    } else {
        
        [_commitBtn setEnabled:YES];
    }
}


#pragma mark - AddTruckServerDelegate

- (void)successOfAddTruck {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kTruckListVC_RequestNetWorkData_Notification object:nil];
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [Tools showAlert:self.view andTitle:@"添加成功"];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        usleep(250000);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.navigationController popViewControllerAnimated:YES];
        });
    });
}


- (void)failureOfAddTruck:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [Tools showAlert:self.view andTitle:msg];
}


#pragma mark - UIImagePickerControllerDelegate


// 用户选中图片之后的回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSLog(@"%s,info == %@",__func__,info);
    
    UIImage *userImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    NSData *b = [Tools compressImage:userImage andMaxLength:1024*100 andMaxWidthAndHeight:300];
    
    if(!_image1) {
        
        _image1.image = [UIImage imageWithData:b];
    } else if(!_image2) {
        
        _image2.image = [UIImage imageWithData:b];
    } else if(!_image3) {
        
        _image3.image = [UIImage imageWithData:b];
    }
    
    [pickerController dismissViewControllerAnimated:YES completion:^{
        
        
    }];
}


// 用户取消退出picker时候调用
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    NSLog(@"%@",picker);
    [pickerController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
