//
//  MineViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/2/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "MineViewController.h"
#import "UINavigationController+Title.h"
#import "LogListTableViewController.h"
#import "FleetListViewController.h"
#import "Tools.h"
#import "SettingViewController.h"
#import "InvitationDriverViewController.h"
#import <LCActionSheet.h>
#import "ModifyUserInfoService.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "AboutUsViewController.h"
#import "FeedbackViewController.h"
#import "AskedQusetionsViewController.h"

@interface MineViewController ()<UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate, ModifyUserInfoServiceDelegate> {
    
    NSArray *_minePlistArrM;
    AppDelegate *_app;
    UIImagePickerController *pickerController;
}

// 头像View 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *AvatarViewHeight;

// 个人简介View 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *personalProfileViewHeight;

// scrollContentView 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

// 使用APP天数
@property (weak, nonatomic) IBOutlet UILabel *useDaysLabel;

// 头像_本地
@property (weak, nonatomic) IBOutlet UIImageView *AvatarImageView;

// 头像_服务器
@property (strong, nonatomic) NSData *Avatar_ServiceData;

// 网络层
@property (strong, nonatomic) ModifyUserInfoService *service_ModifyUserInfo;

@end

@implementation MineViewController


#define kTitle @"我的"


#pragma mark - 生命周期

- (instancetype)init {
    
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        self.tabBarItem.title = kTitle;
        self.tabBarItem.image = [UIImage imageNamed:@"ic_mine"];
        _service_ModifyUserInfo = [[ModifyUserInfoService alloc] init];
        _service_ModifyUserInfo.delegate = self;
    }
    
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //获取Pist数据
    [self getPlistData];
    
    _useDaysLabel.text = [NSString stringWithFormat:@"%ld天", (long)_app.user.useDays];
    
    [self createData];
    
    [_AvatarImageView.layer setMasksToBounds:YES];
    
    // 设置头像
    if(_app.user.avatar && ![_app.user.avatar isEqualToString:@""]) {
        
        NSString *urlStr = [NSString stringWithFormat:@"%@/%@/%@", API_ServerAddress, kGetAutographDir, _app.user.avatar];
        NSURL *url = [NSURL URLWithString:urlStr];
        [_AvatarImageView sd_setImageWithURL:url];
    }
    
    [self addNotification];
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.tabBarController.navigationItem.rightBarButtonItems = nil;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(setting)];
    
    self.tabBarController.navigationItem.rightBarButtonItem = rightItem;
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self.navigationController titleText:kTitle andColor:CMWhiteColor];
    _scrollContentViewHeight.constant = _AvatarViewHeight.constant + 20 + 44 * _minePlistArrM.count;
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    
    [self removeNotification];
}


#pragma mark - 事件

- (void)setting {
    
    SettingViewController *vc = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


// 修改用户头像
- (IBAction)modifyAvatarOnclick:(UITapGestureRecognizer *)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"选择头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册",@"图库",nil];
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}


#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {//相机
        
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            NSLog(@"支持相机");
            [self makePhoto];
        } else {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"message:@"请在设置-->隐私-->相机，中开启本应用的相机访问权限！！"delegate:self cancelButtonTitle:@"取消"otherButtonTitles:@"我知道了",nil];
            [alert show];
        }
    } else if (buttonIndex == 1) {//相片
        
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            
            NSLog(@"支持相册");
            [self choosePicture];
        }else{
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"message:@"请在设置-->隐私-->照片，中开启本应用的相机访问权限！！"delegate:self cancelButtonTitle:@"取消"otherButtonTitles:@"我知道了",nil];
            [alert show];
        }
    } else if (buttonIndex == 2) {//图册
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
            
            NSLog(@"支持图库");
            [self pictureLibrary];
        } else {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"message:@"请在设置-->隐私-->照片，中开启本应用的相机访问权限！！"delegate:self cancelButtonTitle:@"取消"otherButtonTitles:@"我知道了",nil];
            [alert show];
        }
    }
}



#pragma mark - 通知

- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UserFeedbackSuccess) name:kMineVC_UserFeedback_Notification object:nil];
}


- (void)removeNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kMineVC_UserFeedback_Notification object:nil];
}


#pragma mark - 功能函数

- (void)UserFeedbackSuccess {
    
    [Tools showAlert:self.view andTitle:@"您的意见反馈我们已收到，谢谢..."];
}


/**
 获取Plist数据
 */
- (void)getPlistData {
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Mine.plist" ofType:nil];
    _minePlistArrM = [NSArray arrayWithContentsOfFile:path];
}


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


// 保存照片到沙盒路径(保存)
- (void)saveImage:(UIImage *)image name:(NSString *)iconName {
    
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    //写入文件
    NSString *icomImage = iconName;
    NSString *filePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", icomImage]];
    // 保存文件的名称
    //    [[self getDataByImage:image] writeToFile:filePath atomically:YES];
    [UIImagePNGRepresentation(image)writeToFile: filePath atomically:YES];
}


// 缩放图片
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize {
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
    [image drawInRect:CGRectMake(0,0, image.size.width * scaleSize, image.size.height *scaleSize)];
    UIImage *scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSLog(@"%@",NSStringFromCGSize(scaledImage.size));
    return scaledImage;
}


// 修正照片方向(手机转90度方向拍照)
- (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation ==UIImageOrientationUp)
        return aImage;
    
    CGAffineTransform transform =CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        caseUIImageOrientationDown:
        caseUIImageOrientationDownMirrored:
            transform =CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform =CGAffineTransformRotate(transform,M_PI);
            break;
            
        caseUIImageOrientationLeft:
        caseUIImageOrientationLeftMirrored:
            transform =CGAffineTransformTranslate(transform, aImage.size.width,0);
            transform =CGAffineTransformRotate(transform,M_PI_2);
            break;
            
        caseUIImageOrientationRight:
        caseUIImageOrientationRightMirrored:
            transform =CGAffineTransformTranslate(transform,0, aImage.size.height);
            transform =CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform =CGAffineTransformTranslate(transform, aImage.size.width,0);
            transform =CGAffineTransformScale(transform, -1,1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform =CGAffineTransformTranslate(transform, aImage.size.height,0);
            transform =CGAffineTransformScale(transform, -1,1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx =CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                            CGImageGetBitsPerComponent(aImage.CGImage),0,
                                            CGImageGetColorSpace(aImage.CGImage),
                                            CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(ctx,CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx,CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    CGImageRef cgimg =CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _minePlistArrM.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if(!cell) {
        
        cell = [[UITableViewCell alloc] init];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    cell.textLabel.text = _minePlistArrM[indexPath.row][@"title"];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *str = _minePlistArrM[indexPath.row][@"title"];
    
    if([str isEqualToString:@"运行日记"]) {
        
        LogListTableViewController *vc = [[LogListTableViewController alloc] init];
        vc.title = _minePlistArrM[indexPath.row][@"title"];
        [self.navigationController pushViewController:vc animated:YES];
    } else if([str isEqualToString:@"车队管理"]) {
        
        FleetListViewController *vc = [[FleetListViewController alloc] init];
        vc.title = _minePlistArrM[indexPath.row][@"title"];
        [self.navigationController pushViewController:vc animated:YES];
    } else if([str isEqualToString:@"客户邀请"]) {
        
        InvitationDriverViewController *vc = [[InvitationDriverViewController alloc] init];
        vc.title = _minePlistArrM[indexPath.row][@"title"];
        [self.navigationController pushViewController:vc animated:YES];
    } else if([str isEqualToString:@"意见反馈"]) {
        
        FeedbackViewController *vc = [[FeedbackViewController alloc] init];
        vc.title = _minePlistArrM[indexPath.row][@"title"];
        [self.navigationController pushViewController:vc animated:YES];
    } else if([str isEqualToString:@"常见问题"]) {
        
        AskedQusetionsViewController *vc = [[AskedQusetionsViewController alloc] init];
        vc.title = _minePlistArrM[indexPath.row][@"title"];
        [self.navigationController pushViewController:vc animated:YES];
    } else if([str isEqualToString:@"关于我们"]) {
        
        AboutUsViewController *vc = [[AboutUsViewController alloc] init];
        vc.title = _minePlistArrM[indexPath.row][@"title"];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        
        [Tools showAlert:self.view andTitle:@"正在建设中..."];
    }
}


#pragma mark - ModifyUserInfoServiceDelegate

- (void)successOfModifyUserInfo {
    
    [Tools showAlert:self.view andTitle:@"修改成功"];
}


- (void)failureOfModifyUserInfo:(NSString *)msg {
    
    [Tools showAlert:self.view andTitle:msg];
}


#pragma mark - UIImagePickerControllerDelegate


// 用户选中图片之后的回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSLog(@"%s,info == %@",__func__,info);
    
//    UIImage *userImage = [self fixOrientation:[info objectForKey:@"UIImagePickerControllerEditedImage"]];
    UIImage *userImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    NSData *b = [Tools compressImage:userImage andMaxLength:1024*100 andMaxWidthAndHeight:300];
    
    // 本地显示图片
    if(b) {
        
        userImage = [UIImage imageWithData:b];
    }
    
    // 上传服务器图片
    if(b) {
        
        NSString *AvatarString = [b base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        NSDictionary *dict = @{@"UserId" : _app.user.iDX,
                               @"USER_CODE" : _app.user.uSERCODE,
                               @"ADDRESS" : _app.user.aDDRESS,
                               @"Avatar" : AvatarString
                               };
        
        [_service_ModifyUserInfo ModifyUserInfo:dict];
    }
    
    //保存图片
    //    [self saveImage:userImage name:@"某个特定标示"];
    
    [pickerController dismissViewControllerAnimated:YES completion:^{
        
        
    }];
    //    [self.headIconsetImage:userImage];
    //    self.headIcon.contentMode = UIViewContentModeScaleAspectFill;
    //    self.headIcon.clipsToBounds =YES;
    //照片上传
    //    [self upDateHeadIcon:userImage];
    
    _AvatarImageView.image = userImage;
}


// 用户取消退出picker时候调用
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    NSLog(@"%@",picker);
    [pickerController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
