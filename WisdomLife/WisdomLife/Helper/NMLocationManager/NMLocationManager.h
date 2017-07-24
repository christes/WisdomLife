//
//  MFMapManage.h
//  MyFreeMall
//
//  Created by boundlessocean on 16/9/7.
//  Copyright © 2016年 GXCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;
@class NMLocationManager;

@interface NMAddressModel : NSObject
/** 省 */
@property (nonatomic, copy)NSString *province;
/** 市 */
@property (nonatomic, copy)NSString *city;
/** 区 */
@property (nonatomic, copy)NSString *area;
/** 街道 */
@property (nonatomic, copy)NSString *street;
/** 门牌号 */
@property (nonatomic, copy)NSString *number;
@end


@protocol LocationManagerLocationDelegate <NSObject>
@optional
/** 更新位置 */
- (void)locationManager:(NMLocationManager *)manager didUpdateAndGetLastCLLocation:(CLLocation *)location annAddress:(NMAddressModel *)addressModel;
/** 定位失败 */
- (void)locationManager:(NMLocationManager *)manager didFailed:(NSError *)error;
/** 定位功能关闭 */
- (void)locationManagerServerClosed:(NMLocationManager *)manager;

@end

@interface NMLocationManager : NSObject

/** 代理 */
@property (nonatomic, weak)id<LocationManagerLocationDelegate> delegate;
/** 授权状态 */
@property (nonatomic, readonly) CLAuthorizationStatus authorizationStatus;
/** 位置 */
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, strong) NMAddressModel *addressModel;
+ (instancetype)sharedManager;
/** 开始定位 */
- (void)start;

@end



