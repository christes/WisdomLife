//
//  MFMapManage.m
//  MyFreeMall
//
//  Created by boundlessocean on 16/9/7.
//  Copyright © 2016年 GXCloud. All rights reserved.
//

#import "NMLocationManager.h"

@interface NMLocationManager ()<CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;

@end
static NMLocationManager *_singleton = nil;
@implementation NMLocationManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[NMLocationManager alloc] init];
    });
    return _singleton;
}

/** 开始定位 */
- (void)start{
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];

}


/** 定位成功 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    [manager stopUpdatingLocation];
    if (_delegate && [_delegate respondsToSelector:@selector(locationManager:didUpdateAndGetLastCLLocation:annAddress:)]) {
        CLLocation *location = [locations lastObject];
        //反向地理编码
        CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
        CLLocation *clLocation = [[CLLocation alloc] initWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude];
        [geoCoder reverseGeocodeLocation:clLocation
                       completionHandler: ^(NSArray *placemarks,NSError *error) {
            NMAddressModel *model = [[NMAddressModel alloc] init];
            for (CLPlacemark *placeMark in placemarks) {
                NSDictionary *addressDic = placeMark.addressDictionary;
                model.province = [addressDic objectForKey:@"State"];
                model.city = [addressDic objectForKey:@"City"];
                model.area = [addressDic objectForKey:@"SubLocality"];
                model.street = [addressDic objectForKey:@"Thoroughfare"];
                model.number = [addressDic objectForKey:@"SubThoroughfare"];
            }
                           self.location = location;
                           self.addressModel = model;
           [_delegate locationManager:self didUpdateAndGetLastCLLocation:location annAddress:model];
        }];
    }
}

/** 定位失败 */
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways &&
        [CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
        if (_delegate && [_delegate respondsToSelector:@selector(locationManagerServerClosed:)]) {
            [_delegate locationManagerServerClosed:self];
        }
    } else {
        if (_delegate && [_delegate respondsToSelector:@selector(locationManager:didFailed:)]) {
            WLLog(@"%@", error);
            [_delegate locationManager:self didFailed:error];
        }
    }
}

- (CLLocationManager *)locationManager{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

@synthesize authorizationStatus = _authorizationStatus;

- (CLAuthorizationStatus)authorizationStatus {
    return [CLLocationManager authorizationStatus];
}

@end
@implementation NMAddressModel
@end
