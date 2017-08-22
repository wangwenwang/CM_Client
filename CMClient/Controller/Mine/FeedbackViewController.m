//
//  FeedbackViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/5/18.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "FeedbackViewController.h"
#import "FeedbackService.h"
#import "UserModel.h"
#import "Tools.h"
#import <MBProgressHUD.h>

@interface FeedbackViewController ()<UITextViewDelegate, FeedbackServiceDelegate>

// 意见反馈
@property (weak, nonatomic) IBOutlet UITextView *Content;

// 意见反馈 提示
@property (weak, nonatomic) IBOutlet UILabel *ContentPromptLabel;

// 服务层
@property (strong, nonatomic) FeedbackService *service;

// 全局变量
@property (strong, nonatomic) AppDelegate *app;

@end

@implementation FeedbackViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[FeedbackService alloc] init];
        _service.delegate = self;
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [_Content becomeFirstResponder];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 事件

- (IBAction)commitOnclick:(UIButton *)sender {
    
    NSString *content = _Content.textTrim;
    
    if([content isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"请填写内容"];
        return;
    }
    
    [self.view endEditing:YES];
 
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_service UserFeedback:_app.user.iDX andContent:content];
}


#pragma mark - FeedbackServiceDelegate

- (void)successOfUserFeedback:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kMineVC_UserFeedback_Notification object:nil];
}


- (void)failureOfUserFeedback:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    if (![text isEqualToString:@""]) {
        
        _ContentPromptLabel.hidden = YES;
    }
    
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1) {
        
        _ContentPromptLabel.hidden = NO;
    }
    
    return YES;
}

@end
