//
//  CheckAutographViewController.m
//  CMDriver
//
//  Created by 凯东源 on 17/3/12.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "CheckAutographViewController.h"
#import "CheckAutographService.h"
#import <MBProgressHUD.h>
#import "Tools.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "PhotoBroswerVC.h"

@interface CheckAutographViewController ()<CheckAutographServiceDelegate>

// 签名
@property (weak, nonatomic) IBOutlet UIImageView *autoGraphImageView;
@property (weak, nonatomic) IBOutlet UIButton *autoGraphBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *autoGraph_ImageView_aspect;

// 卸货
@property (weak, nonatomic) IBOutlet UIImageView *unLoadImageView;
@property (weak, nonatomic) IBOutlet UIButton *unLoadBtn;

// 回单
@property (weak, nonatomic) IBOutlet UIImageView *receiptImageView;
@property (weak, nonatomic) IBOutlet UIButton *receiptBtn;

// 网络层
@property (strong, nonatomic) CheckAutographService *service;

@property (strong, nonatomic) NSMutableArray *images;

@end

@implementation CheckAutographViewController


#pragma mark - 生命周期

- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[CheckAutographService alloc] init];
        _service.delegate = self;
        
        _images = [[NSMutableArray alloc] initWithCapacity:3];
        
        for(int i = 0; i < 3; i++) {
            
            [_images addObject:[UIImage imageNamed:@"ic_imageview_default_bg"]
             ];
        }
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"查看签名/图片";
    
    [_service GetAutograph:_orderIdx];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 事件

- (IBAction)pictureOnclick:(UIButton *)sender {
    
    [self localImageShow:sender.tag - 1001];
}


#pragma mark - 功能函数

- (void)localImageShow:(NSUInteger)index {
    
    __weak typeof(self) weakSelf = self;
    
    [PhotoBroswerVC show:self type:PhotoBroswerVCTypeZoom index:index photoModelBlock:^NSArray *{
        
        NSArray *localImages = [weakSelf.images copy];
        
        NSMutableArray *modelsM = [NSMutableArray arrayWithCapacity:localImages.count];
        for (NSUInteger i = 0; i< localImages.count; i++) {
            
            PhotoModel *pbModel=[[PhotoModel alloc] init];
            pbModel.mid = i + 1;
            pbModel.image = localImages[i];
            
            //源frame
            UIImageView *imageV =(UIImageView *) weakSelf.view.subviews[i];
            pbModel.sourceImageView = imageV;
            
            [modelsM addObject:pbModel];
        }
        
        return modelsM;
    }];
}


#pragma mark - CheckAutographServiceDelegate

- (void)successOfCheckAutograph:(CheckAutographListModel *)checkAutographListM {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    // 处理两个 pricture 问题
    int _kkk = 0;
    
    // 处理照片数量大于3的情况
    NSUInteger pictureCount = (checkAutographListM.CheckAutograph.count <= 3) ? checkAutographListM.CheckAutograph.count : 3;
    
//    // 处理RUL为空的情况
//    for (<#initialization#>; <#condition#>; <#increment#>) {
//        <#statements#>
//    }
    
    for (int i = 0; i < pictureCount; i++) {
        
        CheckAutograph *m = checkAutographListM.CheckAutograph[i];
        
        NSString *url = [NSString stringWithFormat:@"%@/%@/%@", API_ServerAddress, kGetAutographDir, m.pRODUCTURL];
        
        // 签名照片
        if([m.rEMARK isEqualToString:@"Autograph"]) {
            
            if([m.pRODUCTURL isEqualToString:@""]) {
                
                continue;
            }
            
            [MBProgressHUD showHUDAddedTo:_autoGraphBtn animated:YES];
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                
                UIImage *image = [Tools getImageFromURL:url];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [MBProgressHUD hideHUDForView:_autoGraphBtn animated:YES];
                    
                    for (int i = 0; image == nil; i++) {
                        
                        sleep(1);
                    }
                    
                    CGFloat aspect = image.size.width / image.size.height;
                    _autoGraph_ImageView_aspect.constant = aspect;
                    _autoGraphImageView.contentMode = UIViewContentModeScaleAspectFit;
//                    _autoGraphImageView.clipsToBounds = YES;
                    _autoGraphImageView.image = image;
                    
                    [_images replaceObjectAtIndex:0 withObject:image];
                });
            });
            
        // 现场照片1
        } else if([m.rEMARK isEqualToString:@"pricture"]) {
            
            if([m.pRODUCTURL isEqualToString:@""]) {
                
                continue;
            }
            
            if(_kkk == 0) {
                
                [MBProgressHUD showHUDAddedTo:_unLoadBtn animated:YES];
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    
                    UIImage *image = [Tools getImageFromURL:url];
                    
                    for (int i = 0; image == nil; i++) {
                        
                        sleep(1);
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        [MBProgressHUD hideHUDForView:_unLoadBtn animated:YES];
                        
                        _unLoadImageView.contentMode = UIViewContentModeScaleAspectFit;
//                        _unLoadImageView.clipsToBounds = YES;
                        _unLoadImageView.image = image;
                        
                        [_images replaceObjectAtIndex:1 withObject:image];
                    });
                });
                _kkk = 1;
                
            // 现场照片2
            } else {
                
                [MBProgressHUD showHUDAddedTo:_receiptBtn animated:YES];
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    
                    UIImage *image = [Tools getImageFromURL:url];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        [MBProgressHUD hideHUDForView:_receiptBtn animated:YES];
                        
                        for (int i = 0; image == nil; i++) {
                            
                             sleep(1);
                        }
                        
                        _receiptImageView.contentMode = UIViewContentModeScaleAspectFit;
//                        _receiptImageView.clipsToBounds = YES;
                        _receiptImageView.image = image;
                        
                        [_images replaceObjectAtIndex:2 withObject:image];
                    });
                });
            }
        }
    }
}


- (void)failureOfCheckAutograph:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
