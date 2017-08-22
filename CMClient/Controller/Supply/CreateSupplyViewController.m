//
//  CreateSupplyViewController.m
//  CMClient
//
//  Created by 凯东源 on 17/5/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "CreateSupplyViewController.h"
#import "Tools.h"
#import "CreateSupplyService.h"
#import <MBProgressHUD.h>
#import "LQXSwitch.h"
#import "PassingViewController.h"
#import "Routes_UploadModel.h"
#import "IB_UIButton.h"
#import <LCActionSheet.h>
#import "PassingTableViewCell.h"


@interface TimeLabel : UILabel

@property (copy, nonatomic) NSString *time;

@end

@implementation TimeLabel


@end

@interface CreateSupplyViewController ()<CreateSupplyServiceDelegate, UIAlertViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) AppDelegate *app;

@property (strong, nonatomic) CreateSupplyService *service;

// 运费金额
@property (weak, nonatomic) IBOutlet UITextField *TOTAL_AMOUNT;

// 是否需返仓
@property (weak, nonatomic) IBOutlet UIView *switchView_storage;

// 是否需回单
@property (weak, nonatomic) IBOutlet UIView *switchView_receipt;

// 配送开始时间
@property (weak, nonatomic) IBOutlet TimeLabel *SHIPMENT_DATE_STRAT;

// 配送结束时间
@property (weak, nonatomic) IBOutlet TimeLabel *SHIPMENT_DATE_END;

// 要求到仓时间
@property (weak, nonatomic) IBOutlet TimeLabel *REQUEST_WAREHOUSE;

// 要求交付时间
@property (weak, nonatomic) IBOutlet TimeLabel *REQUEST_ISSUE;

// 任务补充说明
@property (weak, nonatomic) IBOutlet UITextView *TASK_DESCRIPTION;

// 货物类型
@property (weak, nonatomic) IBOutlet UILabel *SUPPLY_TYPE;

// 总件数
@property (weak, nonatomic) IBOutlet UITextField *TOTAL_QTY;

// 整车重量
@property (weak, nonatomic) IBOutlet UITextField *TOTAL_WEIGHT;

// 整车体积
@property (weak, nonatomic) IBOutlet UITextField *TOTAL_VOLUME;

// 司机要求
@property (weak, nonatomic) IBOutlet UITextField *DRIVER_REQUEST;

// 司机搬运程度
@property (weak, nonatomic) IBOutlet UITextField *HANDLING_DEGREE;

// 是否需帮忙卸货
@property (weak, nonatomic) IBOutlet UIView *switchView_discharge;

// 是否需自带搬运
@property (weak, nonatomic) IBOutlet UIView *switchView_carryCarry;

// 是否需有人装货
@property (weak, nonatomic) IBOutlet UIView *switchView_loading;

// 要求车辆类型
@property (weak, nonatomic) IBOutlet UILabel *SUPPLY_VEHICLE_TYPE;

// 要求车辆尺寸
@property (weak, nonatomic) IBOutlet UILabel *SUPPLY_VEHICLE_SIZE;

@property (weak, nonatomic) IBOutlet UILabel *routesNameLabel;

// 备注提示
@property (weak, nonatomic) IBOutlet UILabel *remarkTextPromtpLabel;

// 货源线路点数组
@property (strong, nonatomic) NSMutableArray *routes;

// 时间
@property (strong, nonatomic) UIView *coView;


// 28个字段

// 是否需返仓
@property (strong, nonatomic) NSString *IS_RETURN_STORE;

// 是否需回单
@property (strong, nonatomic) NSString *IS_RETURN;

// 是否有人卸货
@property (strong, nonatomic) NSString *HAVE_UNLOAD;

// 是否需要自带搬运
@property (strong, nonatomic) NSString *IS_HANDLING;

// 是否有人装货
@property (strong, nonatomic) NSString *HAVE_LOAD;

// 要求车辆类型
//@property (strong, nonatomic) NSString *SUPPLY_VEHICLE_TYPE;

// 要求车辆尺寸
//@property (strong, nonatomic) NSString *SUPPLY_VEHICLE_SIZE;


// 当前时间类型
@property (assign, nonatomic) NSUInteger currentDateType;

// 时间格式 yyyy-MM-dd
@property (strong, nonatomic) NSDateFormatter *formatter_dd;

// 时间格式 yyyy-MM-dd HH:mm:ss
@property (strong, nonatomic) NSDateFormatter *formatter_ss;

// 已选择时间
@property (strong, nonatomic) NSDate *selectedDate;

// 编辑 配送线路
@property (weak, nonatomic) IBOutlet UIView *editRoutesView;

// 提示 添加配送线路
@property (weak, nonatomic) IBOutlet UIView *addRoutesPromptView;

// 路线简介
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// scrollContentView高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewHeight;

// 配送线路 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *routeViewHeight;

@property (strong, nonatomic) UIDatePicker *datePicker;

@end


// 开关类型
typedef enum _SwitchType {
    
    Switch_TYPE_Storage  = 0,     // 是否需返仓
    Switch_TYPE_Receipt,          // 是否需回单
    Switch_TYPE_Discharge,        // 是否有人卸货
    Switch_TYPE_CarryCarry,       // 是否需要自带搬运
    Switch_TYPE_Loading           // 是否有人装货
} SwitchType;


// 时间类型
typedef enum _DateType {
    
    Date_TYPE_SHIPMENT_DATE_STRAT  = 0,      // 竞标开始时间
    Date_TYPE_SHIPMENT_DATE_END,             // 竞标结束时间
    Date_TYPE_REQUEST_WAREHOUSE,             // 到仓时间
    Date_TYPE_REQUEST_ISSUE                  // 交付时间
} DateType;


#define kCellName @"PassingTableViewCell"
#define kCellHeight 114


@implementation CreateSupplyViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _service = [[CreateSupplyService alloc] init];
        _service.delegate = self;
        _routes = [[NSMutableArray alloc] init];
        _formatter_dd = [[NSDateFormatter alloc] init];
        [_formatter_dd setDateFormat:@"yyyy-MM-dd"];
        _formatter_ss = [[NSDateFormatter alloc] init];
        [_formatter_ss setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        _IS_RETURN_STORE = @"N";
        _IS_RETURN = @"N";
        _HAVE_UNLOAD = @"N";
        _IS_HANDLING = @"N";
        _HAVE_LOAD = @"N";
        
        _datePicker = [[UIDatePicker alloc] init];
    }
    return self;
}


#pragma mark - 时间模块

- (void)createDatePicker:(NSUInteger)tag andDefaultDate:(NSDate *)defaultDate andMaxDate:(NSDate *)maxDate andMinDate:(NSDate *)minDate andUIDatePickerMode:(UIDatePickerMode)datePickerMode {
    
    // 遮罩
    UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    coverView.tag = 1098;
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.18;
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:coverView];
    
    CGFloat startX = 10;
    CGFloat width = self.view.frame.size.width - startX * 2;
    CGFloat height = width * 2 / 3;
    CGFloat startY = (ScreenHeight - height) / 2;
    CGFloat buttonHeight = 35;
    CGFloat buttonWidth = 100;
    CGFloat buttonSpan = (width-buttonWidth * 2) / 3;
    
    /// 添加背景
    _coView = [[UIView alloc] initWithFrame:CGRectMake(startX, startY, width, height + buttonHeight + 10)];
    _coView.backgroundColor = [UIColor lightGrayColor];
    [_coView setCenter:CGPointMake(ScreenWidth / 2, ScreenHeight / 2)];
    [keyWindow addSubview:_coView];
    
    // 添加取消按钮
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonSpan, height + 5, buttonWidth, buttonHeight)];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelButton setBackgroundColor:[UIColor orangeColor]];
    cancelButton.layer.cornerRadius = 2.0;
    [cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_coView addSubview:cancelButton];
    
    // 添加确认按钮
    UIButton *sureButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonSpan * 2 + buttonWidth, height + 5, buttonWidth, buttonHeight)];
    sureButton.tag = tag;
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sureButton setBackgroundColor:[UIColor orangeColor]];
    sureButton.layer.cornerRadius = 2.0;
    [sureButton addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_coView addSubview:sureButton];
    
    //创建日期选择器
    [_datePicker setFrame:CGRectMake(0, 0, width, height)];
    //将日期选择器区域设置为中文，则选择器日期显示为中文
//    _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    //设置样式，当前设为同时显示日期和时间
    _datePicker.datePickerMode = datePickerMode;
    
    _datePicker.minimumDate = minDate;
    _datePicker.maximumDate = maxDate;
    
    // 设置默认时间
    _datePicker.date = defaultDate;
    
    //注意：action里面的方法名后面需要加个冒号“：”
    [_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    [_coView addSubview:_datePicker];
}


- (void)removeDateview {
    
    [_coView removeFromSuperview];
    for (int i = 0; i < self.view.window.subviews.count; i++) {
        
        UIView *v = self.view.window.subviews[i];
        if(v.tag == 1098) {
            
            NSLog(@"找到cover，并移除");
            [v removeFromSuperview];
        }
    }
}


- (void)sureButtonClick:(UIButton *)sender {
    
    // 移除UI
    [self removeDateview];
    
    switch (sender.tag) {
        case Date_TYPE_SHIPMENT_DATE_STRAT: // 竞标开始时间
            
            _SHIPMENT_DATE_STRAT.text = [_formatter_dd stringFromDate:_selectedDate];
            _SHIPMENT_DATE_STRAT.time = [_formatter_ss stringFromDate:_selectedDate];
            NSLog(@"");
            break;
            
        case Date_TYPE_SHIPMENT_DATE_END:   // 竞标结束时间
            
            _SHIPMENT_DATE_END.text = [_formatter_dd stringFromDate:_selectedDate];
            _SHIPMENT_DATE_END.time = [_formatter_ss stringFromDate:_selectedDate];
            NSLog(@"");
            break;
            
        case Date_TYPE_REQUEST_WAREHOUSE:   // 到仓时间
            
            _REQUEST_WAREHOUSE.text = [_formatter_ss stringFromDate:_selectedDate];
            _REQUEST_WAREHOUSE.time = [_formatter_ss stringFromDate:_selectedDate];
            NSLog(@"");
            break;
            
        case Date_TYPE_REQUEST_ISSUE:       // 交付时间
            
            _REQUEST_ISSUE.text = [_formatter_ss stringFromDate:_selectedDate];
            _REQUEST_ISSUE.time = [_formatter_ss stringFromDate:_selectedDate];
            NSLog(@"");
            break;
            
        default:
            break;
    }
}


- (void)cancelButtonClick {
    
    // 移除UI
    [self removeDateview];
}


// 日期选择器响应方法
- (void)dateChanged:(UIDatePicker *)datePicker {
    
    _selectedDate = datePicker.date;
    NSLog(@"tag:%ld %@", (long)datePicker.tag, _selectedDate);
}


#pragma mark - 时间手势

- (IBAction)BidStartDate:(UITapGestureRecognizer *)sender {
    
    [self.view endEditing:YES];
    
    _currentDateType = Date_TYPE_SHIPMENT_DATE_STRAT;
    
    NSDate *maxDate = [_formatter_ss dateFromString:[Tools getCurrentBeforeDate_Second:365 * 24 * 60 * 60]];
    
    NSDate *defaultDate = [_formatter_ss dateFromString:_SHIPMENT_DATE_STRAT.time];
    
    _selectedDate = defaultDate;
    
    [self createDatePicker:Date_TYPE_SHIPMENT_DATE_STRAT andDefaultDate:defaultDate andMaxDate:maxDate andMinDate:[NSDate date] andUIDatePickerMode:UIDatePickerModeDate];
}


- (IBAction)BidEndDate:(UITapGestureRecognizer *)sender {
    
    [self.view endEditing:YES];
    
    _currentDateType = Date_TYPE_SHIPMENT_DATE_END;
    
    NSDate *maxDate = [_formatter_ss dateFromString:[Tools getCurrentBeforeDate_Second:365 * 24 * 60 * 60]];
    
    NSDate *defaultDate = [_formatter_ss dateFromString:_SHIPMENT_DATE_END.time];
    
    _selectedDate = defaultDate;
    
    [self createDatePicker:Date_TYPE_SHIPMENT_DATE_END andDefaultDate:defaultDate andMaxDate:maxDate andMinDate:[NSDate date] andUIDatePickerMode:UIDatePickerModeDate];
}


// 到仓时间
- (IBAction)ToWarehouseDate:(UITapGestureRecognizer *)sender {
    
    [self.view endEditing:YES];
    
    _currentDateType = Date_TYPE_REQUEST_WAREHOUSE;
    
    NSDate *maxDate = [_formatter_ss dateFromString:[Tools getCurrentBeforeDate_Second:365 * 24 * 60 * 60]];
    
    NSDate *defaultDate = nil;
    
    if([_REQUEST_WAREHOUSE.time isEqualToString:@""] ) {
        
        defaultDate = [NSDate date];
    } else {
        
        defaultDate = [_formatter_ss dateFromString:_REQUEST_WAREHOUSE.time];
    }
    
    _selectedDate = defaultDate;
    
    [self createDatePicker:Date_TYPE_REQUEST_WAREHOUSE andDefaultDate:defaultDate andMaxDate:maxDate andMinDate:[NSDate date] andUIDatePickerMode:UIDatePickerModeDateAndTime];
}


// 交付时间
- (IBAction)IssueDate:(UITapGestureRecognizer *)sender {
    
    [self.view endEditing:YES];
    
    _currentDateType = Date_TYPE_REQUEST_ISSUE;
    
    NSDate *maxDate = [_formatter_ss dateFromString:[Tools getCurrentBeforeDate_Second:365 * 24 * 60 * 60]];
    
    NSDate *defaultDate = nil;
    
    if([_REQUEST_ISSUE.time isEqualToString:@""] ) {
        
        defaultDate = [NSDate date];
    } else {
        
        defaultDate = [_formatter_ss dateFromString:_REQUEST_ISSUE.time];
    }
    
    _selectedDate = defaultDate;
    
    [self createDatePicker:Date_TYPE_REQUEST_ISSUE andDefaultDate:defaultDate andMaxDate:maxDate andMinDate:[NSDate date] andUIDatePickerMode:UIDatePickerModeDateAndTime];
}


#pragma mark - 手势

// 车辆类型
- (IBAction)truckTypeOnclick:(UITapGestureRecognizer *)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"车辆类型" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
    alert.tag = 1001;
    
    for ( int i = 0; i < _itemListM.vehicleType.count; i++) {
        
        [alert addButtonWithTitle:_itemListM.vehicleType[i]];
    }
    
    alert.delegate = self;
    
    [alert show];
}


// 车辆尺寸
- (IBAction)truckSizeOnclick:(UITapGestureRecognizer *)sender {
    
//    LCActionSheet *actionSheet = [LCActionSheet sheetWithTitle:@"车辆类型" cancelButtonTitle:@"取消" clicked:^(LCActionSheet *actionSheet, NSInteger buttonIndex) {
//        
//        NSLog(@"clickedButtonAtIndex: %d", (int)buttonIndex);
//    } otherButtonTitleArray:_itemListM.vehicleSize];
//    [actionSheet show];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"车辆尺寸" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
    alert.tag = 1002;
    
    for ( int i = 0; i < _itemListM.vehicleSize.count; i++) {
        
        [alert addButtonWithTitle:_itemListM.vehicleSize[i]];
    }
    
    alert.delegate = self;
    
    [alert show];
}


// 货物类型
- (IBAction)supplyTypeOnclick:(UITapGestureRecognizer *)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"货物类型" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
    alert.tag = 1003;
    
    for ( int i = 0; i < _itemListM.supplyType.count; i++) {
        
        [alert addButtonWithTitle:_itemListM.supplyType[i]];
    }
    
    alert.delegate = self;
    
    [alert show];
}


- (void)setItemListM:(GetItemListModel *)itemListM {
    
    _itemListM = itemListM;
}


- (IBAction)PassingOnclick:(UITapGestureRecognizer *)sender {
    
    PassingViewController *vc = [[PassingViewController alloc] init];
    vc.routes = _routes;
    
    [self.view endEditing:YES];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        usleep(200000);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.navigationController pushViewController:vc animated:YES];
        });
    });
}


#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@"buttonIndex:%ld", (long)buttonIndex);
    
    if(buttonIndex == 0) {
        
        nil;  //点击取消， 不操作
    } else {
        
        if(alertView.tag == 1001) { // 车辆类型
            
            _SUPPLY_VEHICLE_TYPE.text = _itemListM.vehicleType[buttonIndex - 1];
        } else if(alertView.tag == 1002) { // 车辆尺寸
            
            _SUPPLY_VEHICLE_SIZE.text = _itemListM.vehicleSize[buttonIndex - 1];
        } else if(alertView.tag == 1003) { // 货物类型
            
            _SUPPLY_TYPE.text = _itemListM.supplyType[buttonIndex - 1];
        }
    }
}

#pragma mark - 功能函数

// 返回线路城市 和 线路数组
- (NSDictionary *)getROUTES_CITYandDictRoutes{
    
    NSMutableArray *dicRoutes = [[NSMutableArray alloc] init];
    
    NSString *ROUTES_CITY = @"";
    
    for (int i = 0; i < _routes.count; i++) {
        
        Routes_UploadModel *m = _routes[i];
        NSDictionary *dic = [m toDictionary];
        [dicRoutes addObject:dic];
        
        if([ROUTES_CITY isEqualToString:@""]) {
            
//            ROUTES_CITY = [NSString stringWithFormat:@"%@%@", m.aDDRESSPROVINCE, m.aDDRESSCITY];
            ROUTES_CITY = m.aDDRESSNAME;
        } else {
            
//            ROUTES_CITY = [NSString stringWithFormat:@"%@,%@%@", ROUTES_CITY, m.aDDRESSPROVINCE, m.aDDRESSCITY];
            ROUTES_CITY = [NSString stringWithFormat:@"%@/%@", ROUTES_CITY, m.aDDRESSNAME];
        }
    }
    
    return @{@"dict" : dicRoutes, @"ROUTES_CITY" : ROUTES_CITY};
}


- (void)registerCell {
    
    [_tableView registerNib:[UINib nibWithNibName:kCellName bundle:nil] forCellReuseIdentifier:kCellName];
}


#pragma mark - 事件

- (IBAction)comfirmOnclick:(IB_UIButton *)sender {
    
    // 发布人ID
    NSString *APP_USER_IDX = _app.user.iDX;
    
    // 要求车辆类型
    NSString *SUPPLY_VEHICLE_TYPE = _SUPPLY_VEHICLE_TYPE.textTrim;
    
    // 要求车辆尺寸
    NSString *SUPPLY_VEHICLE_SIZE = _SUPPLY_VEHICLE_SIZE.textTrim;
    
    // 配送经验要求
    NSString *DISTRIBUTION_EXPERIENCE = @"";
    
    // 是否返仓
    NSString *IS_RETURN_STORE = _IS_RETURN_STORE;
    
    // 总公里数
    NSString *TOTAL_ROUTES = @"";
    
    // 配送点个数
    NSString *TOTAL_DROP = [NSString stringWithFormat:@"%lu", (unsigned long)_routes.count];
    
    // 要求到仓时间
    NSString *REQUEST_WAREHOUSE = _REQUEST_WAREHOUSE.time;
    
    // 要求交付时间
    NSString *REQUEST_ISSUE = _REQUEST_ISSUE.time;
    
    // 是否需要回单
    NSString *IS_RETURN = _IS_RETURN;
    
    // 配送开始时间
    NSString *SHIPMENT_DATE_STRAT = _SHIPMENT_DATE_STRAT.time;
    
    // 配送结束时间
    NSString *SHIPMENT_DATE_END = _SHIPMENT_DATE_END.time;
    
    // 货物类型
    NSString *SUPPLY_TYPE = _SUPPLY_TYPE.textTrim;
    
    // 整车重量
    NSString *TOTAL_WEIGHT = _TOTAL_WEIGHT.textTrim;
    
    // 整车体积
    NSString *TOTAL_VOLUME = _TOTAL_VOLUME.textTrim;
    
    // 总件数
    NSString *TOTAL_QTY = _TOTAL_QTY.textTrim;
    
    // 运费金额
    NSString *TOTAL_AMOUNT = _TOTAL_AMOUNT.textTrim;
    
    // 司机搬运程度
    NSString *HANDLING_DEGREE = _HANDLING_DEGREE.textTrim;
    
    // 是否需要自带搬运
    NSString *IS_HANDLING = _IS_HANDLING;
    
    // 是否有人帮忙装货
    NSString *HAVE_LOAD = _HAVE_LOAD;
    
    // 是否有人帮忙卸货
    NSString *HAVE_UNLOAD = _HAVE_UNLOAD;
    
    // 司机要求
    NSString *DRIVER_REQUEST = _DRIVER_REQUEST.textTrim;
    
    // 任务补充说明
    NSString *TASK_DESCRIPTION = _TASK_DESCRIPTION.text;
    
    // 任务其他说明
    NSString *TASK_DESCRIPTION_OTHER = @"";
    
    // 操作人
    NSString *OPERATOR_IDX = _app.user.iDX;
    
    // 线路城市
    NSString *ROUTES_CITY = [self getROUTES_CITYandDictRoutes][@"ROUTES_CITY"];
    
    NSArray *array = [[self getROUTES_CITYandDictRoutes][@"dict"] copy];
    
    NSDictionary *SUPPLY_ROUTES = @{@"result" : array};
    
    NSString *w = [Tools JsonStringWithDictonary:SUPPLY_ROUTES];
    
    if([TOTAL_AMOUNT isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"运费金额不能为空"];
        return;
    } else if([TOTAL_QTY isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"总件数不能为空"];
        return;
    } else if([TOTAL_WEIGHT isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"整车重量不能为空"];
        return;
    } else if([TOTAL_VOLUME isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"整车体积不能为空"];
        return;
    } else if([ROUTES_CITY isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"线路城市不能为空"];
        return;
    } else if(_routes.count < 2) {
        
        [Tools showAlert:self.view andTitle:@"配送线路不能少于2个"];
        return;
    }
    
    [self.view endEditing:YES];
    
    NSDictionary *post = @{@"aPP_USER_IDX" : APP_USER_IDX,
                           @"sUPPLY_VEHICLE_TYPE" : SUPPLY_VEHICLE_TYPE,
                           @"sUPPLY_VEHICLE_SIZE" : SUPPLY_VEHICLE_SIZE,
                           @"dISTRIBUTION_EXPERIENCE" : DISTRIBUTION_EXPERIENCE,
                           @"rOUTES_CITY" : ROUTES_CITY,
                           @"iS_RETURN_STORE" : IS_RETURN_STORE,
                           @"tOTAL_ROUTES" : TOTAL_ROUTES,
                           @"tOTAL_DROP" : TOTAL_DROP,
                           @"rEQUEST_WAREHOUSE" : REQUEST_WAREHOUSE,
                           @"rEQUEST_ISSUE" : REQUEST_ISSUE,
                           @"iS_RETURN" : IS_RETURN,
                           @"sHIPMENT_DATE_STRAT" : SHIPMENT_DATE_STRAT,
                           @"sHIPMENT_DATE_END" : SHIPMENT_DATE_END,
                           @"sUPPLY_TYPE" : SUPPLY_TYPE,
                           @"tOTAL_WEIGHT" : TOTAL_WEIGHT,
                           @"tOTAL_VOLUME" : TOTAL_VOLUME,
                           @"tOTAL_QTY" : TOTAL_QTY,
                           @"tOTAL_AMOUNT" : TOTAL_AMOUNT,
                           @"hANDLING_DEGREE" : HANDLING_DEGREE,
                           @"iS_HANDLING" : IS_HANDLING,
                           @"hAVE_LOAD" : HAVE_LOAD,
                           @"hAVE_UNLOAD" : HAVE_UNLOAD,
                           @"dRIVER_REQUEST" : DRIVER_REQUEST,
                           @"tASK_DESCRIPTION" : TASK_DESCRIPTION,
                           @"tASK_DESCRIPTION_OTHER" : TASK_DESCRIPTION_OTHER,
                           @"oPERATOR_IDX" : OPERATOR_IDX,
                           @"sUPPLY_ROUTES" : w,
                           @"strLicense" : @""
                           };
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_service CreateSupply:post];
}


- (void)addSwitch {
    
    [self.view layoutIfNeeded];
    
    [self addSwitch:Switch_TYPE_Storage andOnText:@"需要" andOffText:@"不用" andContainerView:_switchView_storage];
    
    [self addSwitch:Switch_TYPE_Receipt andOnText:@"需要" andOffText:@"不用" andContainerView:_switchView_receipt];
    
    [self addSwitch:Switch_TYPE_Discharge andOnText:@"有" andOffText:@"没有" andContainerView:_switchView_discharge];
    
    [self addSwitch:Switch_TYPE_CarryCarry andOnText:@"需要" andOffText:@"不用" andContainerView:_switchView_carryCarry];
    
    [self addSwitch:Switch_TYPE_Loading andOnText:@"有" andOffText:@"没有" andContainerView:_switchView_loading];
}


- (void)addSwitch:(NSUInteger)Switch_TYPE andOnText:(NSString *)onText andOffText:(NSString *)offText andContainerView:(UIView *)containerView {
    
    LQXSwitch *swit = [[LQXSwitch alloc] initWithFrame:CGRectMake(0, 0, 57, CGRectGetHeight(containerView.frame)) onColor:[UIColor colorWithRed:23 / 255.0 green:190 / 255.0 blue:253 / 255.0 alpha:1.0] offColor:[UIColor colorWithRed:222 / 255.0 green:222 / 255.0 blue:222 / 255.0 alpha:1.0] font:[UIFont systemFontOfSize:12] ballSize:15];
    swit.tag = Switch_TYPE;
    swit.onText = onText;
    swit.offText = offText;
    [containerView addSubview:swit];
    [swit addTarget:self action:@selector(switchSex:) forControlEvents:UIControlEventValueChanged];
}


- (void)switchSex:(LQXSwitch *)swit {
    
    NSLog(@"tag:%ld status:%d", (long)swit.tag, swit.isOn);
    
    switch (swit.tag) {
        case Switch_TYPE_Storage: // 是否需返仓
            _IS_RETURN_STORE = swit.tag ? @"Y" : @"N";
            break;
            
        case Switch_TYPE_Receipt: // 是否需回单
            _IS_RETURN = swit.tag ? @"Y" : @"N";
            break;
            
        case Switch_TYPE_Discharge: // 是否有人卸货
            _HAVE_UNLOAD = swit.tag ? @"Y" : @"N";
            break;
            
        case Switch_TYPE_CarryCarry: // 是否需要自带搬运
            _IS_HANDLING = swit.tag ? @"Y" : @"N";
            break;
            
        case Switch_TYPE_Loading: // 是否有人装货
            _HAVE_LOAD = swit.tag ? @"Y" : @"N";
            break;
            
        default:
            break;
    }
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    _routesNameLabel.text = [self getROUTES_CITYandDictRoutes][@"ROUTES_CITY"];
    
    // 编辑字样
    [_editRoutesView setHidden:!_routes.count];
    
    // 线路Label
    [_addRoutesPromptView setHidden:_routes.count];
    
    [_tableView setHidden:!_routes.count];
    
    _routeViewHeight.constant = _routes.count ? kCellHeight * _routes.count : 70;
    
    _scrollContentViewHeight.constant = 900 + _routeViewHeight.constant;
    
    [_tableView reloadData];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"创建货源";
    
    [self addSwitch];
    
    [self registerCell];
    
    _SUPPLY_VEHICLE_TYPE.text = @"常温车";
    _SUPPLY_VEHICLE_SIZE.text = @"不限";
    _SUPPLY_TYPE.text = @"普通";
    
    // 今天
    NSDate *toDate = [NSDate date];
    
    // 7天后
    NSDate *weekLater = [_formatter_dd dateFromString:[Tools getCurrentBeforeDate_Day:7]];
    
    // 9天后
    NSDate *nineDayLater = [_formatter_dd dateFromString:[Tools getCurrentBeforeDate_Day:9]];
    
    // 17天后
    NSDate *seventeenDayLater = [_formatter_dd dateFromString:[Tools getCurrentBeforeDate_Day:17]];
    
    // 时间
    _SHIPMENT_DATE_STRAT.text =  [_formatter_dd stringFromDate:toDate];
    _SHIPMENT_DATE_STRAT.time = [_formatter_ss stringFromDate:toDate];
    
    _SHIPMENT_DATE_END.text =  [_formatter_dd stringFromDate:weekLater];
    _SHIPMENT_DATE_END.time = [_formatter_ss stringFromDate:[Tools getTheDayLatest_with_date_return_date:weekLater]];
    
//    _REQUEST_WAREHOUSE.text =  [_formatter_ss stringFromDate:[Tools getTheDayLatest_with_date_return_date:nineDayLater]];
//    _REQUEST_WAREHOUSE.time = [_formatter_ss stringFromDate:[Tools getTheDayLatest_with_date_return_date:nineDayLater]];
//    
//    _REQUEST_ISSUE.text = [_formatter_ss stringFromDate:[Tools getTheDayLatest_with_date_return_date:seventeenDayLater]];
//    _REQUEST_ISSUE.time = [_formatter_ss stringFromDate:[Tools getTheDayLatest_with_date_return_date:seventeenDayLater]];
    
    _REQUEST_WAREHOUSE.text = @"";
    _REQUEST_WAREHOUSE.time = @"";
    _REQUEST_ISSUE.text = @"";
    _REQUEST_ISSUE.time = @"";
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
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
    
    return cell;
}


#pragma mark - CreateSupplyServiceDelegate

- (void)successOfCreateSupply:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kSupplyListVC_refreshNetworkData_Notification object:nil userInfo:@{@"msg" : msg}];
            
     [self.navigationController popViewControllerAnimated:YES];
}


- (void)failureOfCreateSupply:(NSString *)msg {
    
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
        
        _remarkTextPromtpLabel.hidden = YES;
    }
    
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1) {
        
        _remarkTextPromtpLabel.hidden = NO;
    }
    
    return YES;
}

@end
