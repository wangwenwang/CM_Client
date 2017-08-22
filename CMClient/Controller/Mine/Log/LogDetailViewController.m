//
//  LogDetailViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/2/13.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "LogDetailViewController.h"
#import <CFNetwork/CFNetwork.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "SCRFTPRequest.h"

@interface LogDetailViewController ()<SCRFTPRequestDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation LogDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"日记详情";
    
    NSString *content = [NSString stringWithContentsOfFile:_logPath encoding:NSUTF8StringEncoding error:nil];
    
    //日记换行
    content = [content stringByReplacingOccurrencesOfString:@"2017-" withString:@"<br/><br/>2017-"];
    content = [content substringFromIndex:10];
    
    NSString *jsString = [NSString stringWithFormat:@"<html> \n"
                          "<head> \n"
                          "<style type=\"text/css\"> \n"
                          "body {font-size: %f; font-family: \"%@\"; color: %@;}\n"
                          "</style> \n"
                          "</head> \n"
                          "<body>%@</body> \n"
                          "</html>", 13.0, @"Arial", @"#000000", content];
    [_webView loadHTMLString:jsString baseURL:nil];
    
    
    [self.view addSubview:_webView];
    
    
    
    SCRFTPRequest *ftpRequest = [[SCRFTPRequest alloc] initWithURL:[NSURL URLWithString:@"ftp://192.249.60.150/"] toUploadFile:[[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"]];
    ftpRequest.username = @"hzlftp";
    ftpRequest.password = @"ftp2016";
    ftpRequest.customUploadFileName = @"App_Info.plist";
    ftpRequest.delegate = self;
//    [ftpRequest startRequest];


}

#pragma mark - unused(aStream)
// Required delegate methods
- (void)ftpRequestDidFinish:(SCRFTPRequest *)request {
    
    NSLog(@"Upload finished.");
}

- (void)ftpRequest:(SCRFTPRequest *)request didFailWithError:(NSError *)error {
    
    NSLog(@"Upload failed: %@", [error localizedDescription]);
}

// Optional delegate methods
- (void)ftpRequestWillStart:(SCRFTPRequest *)request {
    
    NSLog(@"Will transfer %llu bytes.", request.fileSize);
}

- (void)ftpRequest:(SCRFTPRequest *)request didWriteBytes:(NSUInteger)bytesWritten {
    
    NSLog(@"Transferred: %lu", (unsigned long)bytesWritten);
}

- (void)ftpRequest:(SCRFTPRequest *)request didChangeStatus:(SCRFTPRequestStatus)status {
    
    switch (status) {
        case SCRFTPRequestStatusOpenNetworkConnection:
            NSLog(@"Opened connection.");
            break;
        case SCRFTPRequestStatusReadingFromStream:
            NSLog(@"Reading from stream...");
            break;
        case SCRFTPRequestStatusWritingToStream:
            NSLog(@"Writing to stream...");
            break;
        case SCRFTPRequestStatusClosedNetworkConnection:
            NSLog(@"Closed connection.");
            break;
        case SCRFTPRequestStatusError:
            NSLog(@"Error occurred."); 
            break; 
    } 
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
