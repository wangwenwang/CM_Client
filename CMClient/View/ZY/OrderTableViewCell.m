//
//  OrderTableViewCell.m
//  CMClient
//
//  Created by 凯东源 on 17/3/7.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "OrderTableViewCell.h"
#import "Tools.h"

@interface OrderModel ()

///// TMS订单号
//@property (weak, nonatomic) IBOutlet UILabel *ORD_NO;
//
///// 起运点联系人
//@property (weak, nonatomic) IBOutlet UILabel *ORD_FROM_CNAME;
//
///// 起运点联系电话
//@property (weak, nonatomic) IBOutlet UILabel *ORD_FROM_NAME;
//
///// 到达点联系人
//@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_CNAME;
//
///// 到达点联系电话
//@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_NAME;
//
///// 起运点地址
//@property (weak, nonatomic) IBOutlet UILabel *ORD_FROM_ADDRESS;
//
///// 到达点名地址
//@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_ADDRESS;

@end

#define kORG_FROM_NAME_FontPointSize 14

@implementation OrderTableViewCell

- (instancetype)init {
    
    if(self = [super init]) {
        
        _ORG_FROM_NAME_FontPointSize = kORG_FROM_NAME_FontPointSize;
    }
    return self;
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    _ORG_FROM_NAME_FontPointSize = kORG_FROM_NAME_FontPointSize;
    
    [_ORD_FROM_NAME setFont:[UIFont systemFontOfSize:_ORG_FROM_NAME_FontPointSize]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


- (void)setOrder:(OrderModel *)order {
    
    _order = order;
    
    _ORD_NO.text = _order.oRDNO;
    _ORD_FROM_CNAME.text = _order.oRDFROMCNAME;
    _ORD_FROM_CTEL.text = _order.oRDFROMCTEL;
    _ORD_TO_CNAME.text = _order.oRDTOCNAME;
    _ORD_TO_CTEL.text = _order.oRDTOCTEL;
    _ORD_FROM_NAME.text = _order.oRDFROMNAME;
    _ORD_TO_NAME.text = _order.oRDTONAME;
    
    // Cell 地址换行
    [self layoutIfNeeded];
    CGFloat oneLine = 0;
    CGFloat textHeight = 0;
    CGFloat containerWidth = ScreenWidth - CGRectGetMaxX(_ORG_FROM_NAME_PromptLabel.frame) - _ORG_FROM_NAME_trailing.constant;
    oneLine = [Tools getHeightOfString:@"fds" fontSize:_ORD_FROM_NAME.font.pointSize andWidth:containerWidth];
    textHeight = [Tools getHeightOfString:_order.oRDFROMNAME fontSize:_ORD_FROM_NAME.font.pointSize andWidth:containerWidth];
    
    CGFloat overHeight = 0;
    if(textHeight > oneLine) {
        
        overHeight = textHeight - oneLine;
    }
    _ORG_FROM_NAME_bottom.constant = _ORG_FROM_NAME_bottom.constant + overHeight;
}

@end
