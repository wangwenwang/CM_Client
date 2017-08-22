//
//  PassingViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/5/13.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "PassingViewController.h"
#import "PassingTableViewCell.h"
#import "Tools.h"
#import "IB_UIView.h"
#import "IB_UIButton.h"
#import "Routes_UploadModel.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "AreaProvinceViewController.h"

@interface PassingViewController ()<SWTableViewCellDelegate>

//
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// 添加货源线路点
@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *AddSupplyPassPointScrollView;

// 地址名称
@property (weak, nonatomic) IBOutlet UITextField *ADDRESS_NAME;

// 省
@property (weak, nonatomic) IBOutlet UITextField *provinceF;

// 市
@property (weak, nonatomic) IBOutlet UITextField *cityF;

// 区/县
@property (weak, nonatomic) IBOutlet UITextField *districtF;

// 街道/乡镇
@property (weak, nonatomic) IBOutlet UITextField *streetOrtownF;

// 联系人
@property (weak, nonatomic) IBOutlet UITextField *contactPersonF;

// 联系电话
@property (weak, nonatomic) IBOutlet UITextField *contactTelF;

// 详细地址
@property (weak, nonatomic) IBOutlet UITextField *ADDRESS_ADDRESS;

// 确认一个路线
@property (weak, nonatomic) IBOutlet IB_UIButton *confirmSingleRouteBtn;

// 全局变量
@property (strong, nonatomic) AppDelegate *app;

// 遮罩
@property (strong, nonatomic) UIView *coverBg;

// scrollContentView 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

@property (assign, nonatomic) UILongPressGestureRecognizer *longPress;

@end


#define kCellName @"PassingTableViewCell"
#define kCellHeight 114
#define kDuration 0.3

@implementation PassingViewController


- (instancetype)init {
    
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"途径点信息";
    
//        [self.view layoutIfNeeded];
    
    [self registCell];
    
    [Tools addNavRightItemTypeAdd:self andAction:@selector(addOnclick)];
    
    [self addKVO];
    
    [self addNotification];
    
    _coverBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    _coverBg.alpha = 0;
    _coverBg.backgroundColor = [UIColor blackColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverBgOnclick)];
    tap.numberOfTapsRequired = 1;
    [_coverBg addGestureRecognizer:tap];
    
    [self.view insertSubview:_coverBg belowSubview:_AddSupplyPassPointScrollView];
    
    [self dragButtonClick];
    
    _provinceF.enabled = NO;
    _cityF.enabled = NO;
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [_AddSupplyPassPointScrollView setHidden:NO];
}


- (void)updateViewConstraints {
    
    [super updateViewConstraints];
    
    _scrollContentViewHeight.constant = 320;
}


- (void)coverBgOnclick {
    
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    
    [self removeKVO];
    [self removeNotification];
}


#pragma mark - 手势


- (IBAction)ProvinceAndCityOnclick:(UITapGestureRecognizer *)sender {
    
    AreaProvinceViewController *vc = [[AreaProvinceViewController alloc] init];
    
    //nav导航
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}


- (void)refshreProAndCity:(NSNotification *)aNotifica {
    
    NSString *ProAndCity = aNotifica.userInfo[@"city"];
    NSArray *array = [ProAndCity componentsSeparatedByString:@"  "];
    NSString *Pro = (array.count > 0) ? array[0] : @"";
    NSString *city = (array.count > 1) ? array[1] : @"";
    
    _provinceF.text = Pro;
    _cityF.text = city;
}


#pragma mark - 事件

- (void)addOnclick {
    
    _confirmSingleRouteBtn.tag = 0;
    [_AddSupplyPassPointScrollView setHidden:NO];
    
    // addSubview动画
    CATransition *applicationLoadViewIn =[CATransition animation];
    [applicationLoadViewIn setDuration:1.3];
    [applicationLoadViewIn setType:kCATransitionFade];
    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    //you view need to replace
    [[_AddSupplyPassPointScrollView layer]addAnimation:applicationLoadViewIn forKey:kCATransitionFade];
    
#ifdef DEBUG
    
#else
    
    _ADDRESS_NAME.text = @"";
    _provinceF.text = @"";
    _cityF.text = @"";
    _districtF.text = @"";
    _streetOrtownF.text = @"";
    _contactPersonF.text = @"";
    _contactTelF.text = @"";
    _ADDRESS_ADDRESS.text = @"";
#endif
    
}


// 返回
- (IBAction)backOnclick:(IB_UIButton *)sender {
    
    [self.view endEditing:YES];
    [_AddSupplyPassPointScrollView setHidden:YES];
}

// 确认
- (IBAction)comfirmAllOnclick:(IB_UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


// 添加确认
- (IBAction)comfirmSingleOnclick:(IB_UIButton *)sender {
    
    // tag 大于 0，属于修改行为，修改下标 = sender.tag - 1000
    
    Routes_UploadModel *m = nil;
    
    if(sender.tag == 0) {
        
        m = [[Routes_UploadModel alloc] init];
    } else {
        
        m = _routes[sender.tag - 1000];
    }
    m.aDDRESSNAME = _ADDRESS_NAME.textTrim;
    m.aDDRESSPROVINCE = _provinceF.textTrim;
    m.aDDRESSCITY = _cityF.textTrim;
    m.aDDRESSAREA = _districtF.textTrim;
    m.aDDRESSRURAL = _streetOrtownF.textTrim;
    m.aDDRESSPERSON = _contactPersonF.textTrim;
    m.aDDRESSTEL = _contactTelF.textTrim;
    m.aDDRESSADDRESS = _ADDRESS_ADDRESS.textTrim;
    m.oPERATORIDX = _app.user.iDX;
    
    
    if([m.aDDRESSNAME isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"地址名称不为能空"];
        return;
    } else if([m.aDDRESSPROVINCE isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"省份不为能空"];
        return;
    } else if([m.aDDRESSCITY isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"城市不为能空"];
        return;
    } else if([m.aDDRESSAREA isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"区/县 不为能空"];
        return;
    } else if([m.aDDRESSRURAL isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"街道/乡镇 不为能空"];
        return;
    } else if([m.aDDRESSPERSON isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"联系人不为能空"];
        return;
    } else if([m.aDDRESSTEL isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"联系电话不为能空"];
        return;
    } else if([m.aDDRESSADDRESS isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"详细地址不为能空"];
        return;
    }
    
    
    [self.view endEditing:YES];
    [_AddSupplyPassPointScrollView setHidden:YES];
    
    m.aDDRESSZIP = @"";
    m.aDDRESSREMARK = @"";
    
    // 地址名称 = 省 + 市
    //    m.aDDRESSNAME = [NSString stringWithFormat:@"%@ %@", m.aDDRESSPROVINCE, m.aDDRESSCITY];
    
    // 地址汇总 = 省 + 市 + 区/县 + 街道/乡镇 + 详细地址
    m.aDDRESSINFO = [NSString stringWithFormat:@"%@%@%@%@%@", m.aDDRESSPROVINCE, m.aDDRESSCITY, m.aDDRESSAREA, m.aDDRESSRURAL, m.aDDRESSADDRESS];
    
    if(sender.tag == 0) {
        
        [_routes addObject:m];
    }
    
    [self sortPoint];
    
    [_tableView reloadData];
}


// 地址类型排序
- (void)sortPoint {
    
    // 地址类型 0 起点
    for(int i = 0; i < _routes.count; i++) {
        
        Routes_UploadModel *LM = _routes[i];
        if(i == 0) {
            
            LM.rOUTESTYPE = @"FROM";
            LM.rOUTESTYPE_Convert = @"起点";
        } else if (i == _routes.count - 1){
            
            LM.rOUTESTYPE = @"TO";
            LM.rOUTESTYPE_Convert = @"终点";
        } else {
            
            LM.rOUTESTYPE = @"TO";
            LM.rOUTESTYPE_Convert = @"途中点";
        }
    }
}


#pragma mark - 功能函数

- (void)registCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
}


- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refshreProAndCity:) name:kAreaCity_reloadData_Notification object:nil];
}


- (void)removeNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kAreaCity_reloadData_Notification object:nil];
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kCellHeight;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _routes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellid = kCellName;
    
    PassingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid forIndexPath:indexPath];
    
    Routes_UploadModel *m = _routes[indexPath.row];
    
    cell.routeM = m;
    
    cell.rightUtilityButtons = [self rightButtons];
    
    cell.tag = indexPath.row;
    
    cell.delegate = self;
    
    return cell;
}


- (NSArray *)rightButtons {
    
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"删除"];
    return rightUtilityButtons;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    _confirmSingleRouteBtn.tag = indexPath.row + 1000;
    [_AddSupplyPassPointScrollView setHidden:NO];
    
    Routes_UploadModel *m = _routes[indexPath.row];
    
    _ADDRESS_NAME.text = m.aDDRESSNAME;
    _provinceF.text = m.aDDRESSPROVINCE;
    _cityF.text = m.aDDRESSCITY;
    _districtF.text = m.aDDRESSAREA;
    _streetOrtownF.text = m.aDDRESSRURAL;
    _contactPersonF.text = m.aDDRESSPERSON;
    _contactTelF.text = m.aDDRESSTEL;
    _ADDRESS_ADDRESS.text = m.aDDRESSADDRESS;
}


#pragma mark - SWTableViewCellDelegate

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell {
    
    return YES;
}


// prevent cell(s) from displaying left/right utility buttons
- (BOOL)swipeableTableViewCell:(SWTableViewCell *)cell canSwipeToState:(SWCellState)state {
    
    return YES;
}


- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    NSLog(@"index:%ld, cell.tag:%ld", (long)index, (long)cell.tag);
    
    // 删除
    [_routes removeObjectAtIndex:cell.tag];
    [_tableView reloadData];
}

#define kvo_hidden @"hidden"

#pragma mark - 功能方法

- (void)addKVO {
    
    [_AddSupplyPassPointScrollView addObserver:self forKeyPath:kvo_hidden options:NSKeyValueObservingOptionNew context:nil];
}


- (void)removeKVO {
    
    [_AddSupplyPassPointScrollView removeObserver:self forKeyPath:kvo_hidden];
}


#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:kvo_hidden]) {
        
        NSUInteger old = [change[@"old"] integerValue];
        NSUInteger new = [change[@"new"] integerValue];
        NSLog(@"old:%lu, new:%lu", (unsigned long)old, (unsigned long)new);
        
        if(new == 1) {
            
            [UIView animateWithDuration:kDuration animations:^{
                
                _coverBg.alpha = 0;
            }];
            
        } else {
            
            [UIView animateWithDuration:kDuration animations:^{
                
                _coverBg.alpha = 0.3;
            }];
        }
    } else {
        
        //        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

// cell长按拖动排序
- (void)longPressRecognizer:(UILongPressGestureRecognizer *)longPress{
    
    // 获取长按的点及cell
    CGPoint location = [longPress locationInView:_tableView];
    NSIndexPath *indexPath = [_tableView indexPathForRowAtPoint:location];
    UIGestureRecognizerState state = longPress.state;
    
    static UIView *snapView = nil;
    static NSIndexPath *sourceIndex = nil;
    switch (state) {
        case UIGestureRecognizerStateBegan:{
            if (indexPath) {
                sourceIndex = indexPath;
                UITableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                snapView = [self customViewWithTargetView:cell];
                
                __block CGPoint center = cell.center;
                snapView.center = center;
                snapView.alpha = 0.0;
                [_tableView addSubview:snapView];
                
                [UIView animateWithDuration:0.1 animations:^{
                    center.y = location.y;
                    snapView.center = center;
                    snapView.transform = CGAffineTransformMakeScale(1.05, 1.05);
                    snapView.alpha = 0.5;
                    
                    cell.alpha = 0.0;
                }];
            }
        }
            NSLog(@"a");
            break;
            
        case UIGestureRecognizerStateChanged:{
            CGPoint center = snapView.center;
            center.y = location.y;
            snapView.center = center;
            
            UITableViewCell *cell = [_tableView cellForRowAtIndexPath:sourceIndex];
            cell.alpha = 0.0;
            
            if (indexPath && ![indexPath isEqual:sourceIndex]) {
                
                [_routes exchangeObjectAtIndex:indexPath.row withObjectAtIndex:sourceIndex.row];
                
                [_tableView moveRowAtIndexPath:sourceIndex toIndexPath:indexPath];
                
                sourceIndex = indexPath;
            }
            
        }
            NSLog(@"b");
            break;
            
        default:{
            UITableViewCell *cell = [_tableView cellForRowAtIndexPath:sourceIndex];
            [UIView animateWithDuration:0.25 animations:^{
                snapView.center = cell.center;
                snapView.transform = CGAffineTransformIdentity;
                snapView.alpha = 0.0;
                
                cell.alpha = 1.0;
            } completion:^(BOOL finished) {
                [snapView removeFromSuperview];
                snapView = nil;
            }];
            sourceIndex = nil;
        }
            [self sortPoint];
            NSLog(@"c");
            [_tableView reloadData];
            break;
    }
}


- (void)dragButtonClick {
    
    // 添加长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressRecognizer:)];
    self.longPress = longPress;
    longPress.minimumPressDuration = 0.2;
    [_tableView addGestureRecognizer:longPress];
}


// 截取选中cell
- (UIView *)customViewWithTargetView:(UIView *)target{
    UIGraphicsBeginImageContextWithOptions(target.bounds.size, NO, 0);
    [target.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIView *snapshot = [[UIImageView alloc] initWithImage:image];
    snapshot.layer.masksToBounds = NO;
    snapshot.layer.cornerRadius = 0.0;
    snapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
    snapshot.layer.shadowRadius = 5.0;
    snapshot.layer.shadowOpacity = 0.4;
    
    return snapshot;
}


@end
