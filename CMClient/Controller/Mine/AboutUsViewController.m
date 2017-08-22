//
//  AboutUsViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/5/18.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://www.chengma.co/about.aspx"];
    
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
