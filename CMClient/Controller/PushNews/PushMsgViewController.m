//
//  PushMsgViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/3/30.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "PushMsgViewController.h"

@interface PushMsgViewController ()

// 推送公告标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

// 推送公告内容
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

// 内容视图高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

@end

@implementation PushMsgViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"消息详情";
    
    _titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    _titleLabel.text = _title1;
    _contentLabel.text = _message;
    _scrollContentViewHeight.constant = self.view.frame.size.height - 10;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
