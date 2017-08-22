//
//  AddFleetViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/2/23.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "AddFleetViewController.h"
#import "AddFleetService.h"
#import "Tools.h"
#import "LoginTextFieId.h"
#import "AddFleetTextField.h"
#import <RadioButton.h>
#import <MBProgressHUD.h>
#import "AddFleetButton.h"

@interface AddFleetViewController ()<AddFleetServiceDelegate> {
    
    AppDelegate *_app;
}

/// 车队名称
@property (weak, nonatomic) IBOutlet AddFleetTextField *fleetNameF;

/// 车队类型
@property (weak, nonatomic) IBOutlet RadioButton *Radiobtn_INDIVIDUAL;
@property (weak, nonatomic) IBOutlet RadioButton *Radiobtn_COMPANY;

/// 公司名称
@property (weak, nonatomic) IBOutlet AddFleetTextField *companyNameF;

/// 车队描述
@property (weak, nonatomic) IBOutlet AddFleetTextField *descF;

/// 车队负责人
@property (weak, nonatomic) IBOutlet AddFleetTextField *ceoF;

/// 联系电话
@property (weak, nonatomic) IBOutlet AddFleetTextField *contactTelF;

/// 添加
@property (weak, nonatomic) IBOutlet AddFleetButton *commitBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

@end

@implementation AddFleetViewController


- (instancetype)init {
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加车队";
    
    _fleetNameF.labelText = @"车队名称";
    _companyNameF.labelText = @"公司名称";
    _descF.labelText = @"车队描述";
    _ceoF.labelText = @"车队负责人";
    _contactTelF.labelText = @"联系电话";
    
    [_Radiobtn_INDIVIDUAL setImage:[UIImage imageNamed:@"radio_button_unchecked"] forState:UIControlStateNormal];
    [_Radiobtn_INDIVIDUAL setImage:[UIImage imageNamed:@"radio_button_checked"] forState:UIControlStateSelected];
    
    [_Radiobtn_COMPANY setImage:[UIImage imageNamed:@"radio_button_unchecked"] forState:UIControlStateNormal];
    [_Radiobtn_COMPANY setImage:[UIImage imageNamed:@"radio_button_checked"] forState:UIControlStateSelected];
    
    [_commitBtn setEnabled:YES];
}


- (void)updateViewConstraints {
    
    [super updateViewConstraints];
    _scrollContentViewHeight.constant = CGRectGetMaxY(_commitBtn.frame) + 20;
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 事件

- (IBAction)commitOnclick:(UIButton *)sender {
    
    // 车队名称是必填项
    if([_fleetNameF.textTrim isEqualToString:@""]) {
        
        [_fleetNameF becomeFirstResponder];
        return;
    } else {
        
        [self.view endEditing:YES];
    }
    
    NSString *fleetType = @"INDIVIDUAL";
//    if(_Radiobtn_INDIVIDUAL.selected) {
//        
//        fleetType = @"INDIVIDUAL";
//    } else if(_Radiobtn_COMPANY.selected) {
//        
//        fleetType = @"COMPANY";
//    }
    
    AddFleetService *s = [[AddFleetService alloc] init];
    s.delegate = self;
    [s addFleet:_app.user.iDX andFLEET_PROPERTY:fleetType andTMS_NAME:@"" andFLEET_NAME:_fleetNameF.textTrim andFLEET_DESC:_descF.textTrim andCONTACT_PERSON:_ceoF.textTrim andCONTACT_TEL:_contactTelF.textTrim];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}


#pragma mark - AddFleetServiceDelegate
- (void)successOfAddFleet:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:@"添加成功"];
    
    // 通知 车队列表 重新请求网络数据
    [[NSNotificationCenter defaultCenter] postNotificationName:kFleetListVC_RequestNetWorkData_Notification object:nil];
    
    // 添加车队成功 pop
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        usleep(1200000);
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [self.navigationController popViewControllerAnimated:YES];
        });
    });
}


- (void)failureOfAddFleet:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
