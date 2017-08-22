//
//  CreateSupplyService.h
//  CMClient
//
//  Created by 凯东源 on 17/5/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetItemListModel.h"


/// 请求车辆类型、尺寸、创建货源 回调协议
@protocol CreateSupplyServiceDelegate <NSObject>

@optional
- (void)successOfGetItemList:(GetItemListModel *)itemListM;

@optional
- (void)failureOfGetItemList:(NSString *)msg;

@optional
- (void)successOfCreateSupply:(NSString *)msg;

@optional
- (void)failureOfCreateSupply:(NSString *)msg;

@end

@interface CreateSupplyService : NSObject

@property (nonatomic, weak) id<CreateSupplyServiceDelegate> delegate;


- (void)GetItemLis:(NSString *)UserID;


- (void)CreateSupply:(NSDictionary *)dict;


//- (void)CreateSupply:(NSString *)APP_USER_IDX andSUPPLY_VEHICLE_TYPE:(NSString *)SUPPLY_VEHICLE_TYPE andSUPPLY_VEHICLE_SIZE:(NSString *)SUPPLY_VEHICLE_SIZE andDISTRIBUTION_EXPERIENCE:(NSString *)DISTRIBUTION_EXPERIENCE andROUTES_CITY:(NSString *)ROUTES_CITY andIS_RETURN_STORE:(NSString *)IS_RETURN_STORE andTOTAL_ROUTES:(NSString *)TOTAL_ROUTES andTOTAL_DROP:(NSString *)TOTAL_DROP andREQUEST_WAREHOUSE:(NSString *)REQUEST_WAREHOUSE andREQUEST_ISSUE:(NSString *)REQUEST_ISSUE andIS_RETURN:(NSString *)IS_RETURN andSHIPMENT_DATE_STRAT:(NSString *)SHIPMENT_DATE_STRAT andSHIPMENT_DATE_END:(NSString *)SHIPMENT_DATE_END andSUPPLY_TYPE:(NSString *)SUPPLY_TYPE andTOTAL_WEIGHT:(NSString *)TOTAL_WEIGHT andTOTAL_VOLUME:(NSString *)TOTAL_VOLUME andTOTAL_QTY:(NSString *)TOTAL_QTY andTOTAL_AMOUNT:(NSString *)TOTAL_AMOUNT andHANDLING_DEGREE:(NSString *)HANDLING_DEGREE andIS_HANDLING:(NSString *)IS_HANDLING andHAVE_LOAD:(NSString *)HAVE_LOAD andHAVE_UNLOAD:(NSString *)HAVE_UNLOAD andDRIVER_REQUEST:(NSString *)DRIVER_REQUEST andTASK_DESCRIPTION:(NSString *)TASK_DESCRIPTION andTASK_DESCRIPTION_OTHER:(NSString *)TASK_DESCRIPTION_OTHER andOPERATOR_IDX:(NSString *)OPERATOR_IDX andSUPPLY_ROUTES:(NSString *)SUPPLY_ROUTES andSUPPLY_ROUTES:(NSString *)SUPPLY_ROUTES;

@end
