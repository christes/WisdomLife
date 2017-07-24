//
//  NMAPPContext.m
//  NMWalletAPP
//
//  Created by xiaoping on 2016/11/17.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "NMAPPContext.h"
#import "SAMKeychain.h"
#import <sys/utsname.h>
#import "NMFileCacheManager.h"
@implementation NMAPPContext
@synthesize uuid = _uuid;
@synthesize accessToken = _accessToken;
@synthesize appIdentifier = _appIdentifier;
@synthesize deviceNo = _deviceNo;
@synthesize phoneNumber = _phoneNumber;

+ (instancetype)defaultContext {
    static NMAPPContext *context = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        context = [NMAPPContext new];
    });
    return context;
}


- (NSString *)uuid {
    if (!_uuid) {
        _uuid = [SAMKeychain passwordForService:self.appIdentifier account:kNMAPPContextUUID];
        if (!_uuid) {
            _uuid = [UIDevice currentDevice].identifierForVendor.UUIDString;
            [SAMKeychain setPassword:_uuid forService:self.appIdentifier account:kNMAPPContextUUID];
        }
    }
    return _uuid;
}
- (void)setAccessToken:(NSString *)accessToken {
    _accessToken = accessToken;
}

- (NSString *)accessToken {
    _accessToken = [NMFileCacheManager readUserDataForKey:kNMAPPContextAccessToken];
    _accessToken = _accessToken == nil ? @"" : _accessToken;
    return _accessToken;
}

- (void)setPhoneNumber:(NSString *)phoneNumber{
    _phoneNumber = phoneNumber;
    [NMFileCacheManager saveUserData:phoneNumber forKey:kNMAPPContextPhoneNumber];
    
}

- (NSString *)phoneNumber{
    _phoneNumber = [NMFileCacheManager readUserDataForKey:kNMAPPContextPhoneNumber];
    _phoneNumber = _phoneNumber == nil ? @"" : _phoneNumber;
    return _phoneNumber;
}

- (NSString *)appIdentifier {
    if (!_appIdentifier) {
        _appIdentifier = [NSBundle mainBundle].infoDictionary[@"CFBundleIdentifier"];
    }
    return _appIdentifier;
}

- (NSString *)deviceNo{
    if (!_deviceNo) {
        struct utsname systemInfo;
        uname(&systemInfo);
        _deviceNo = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
        if ([_deviceNo isEqualToString:@"iPhone1,1"]) _deviceNo = @"iPhone 2G";
        
        if ([_deviceNo isEqualToString:@"iPhone1,2"]) _deviceNo = @"iPhone 3G";
        
        if ([_deviceNo isEqualToString:@"iPhone2,1"]) _deviceNo = @"iPhone 3GS";
        
        if ([_deviceNo isEqualToString:@"iPhone3,1"]) _deviceNo = @"iPhone 4";
        
        if ([_deviceNo isEqualToString:@"iPhone3,2"]) _deviceNo = @"iPhone 4";
        
        if ([_deviceNo isEqualToString:@"iPhone3,3"]) _deviceNo = @"iPhone 4";
        
        if ([_deviceNo isEqualToString:@"iPhone4,1"]) _deviceNo = @"iPhone 4S";
        
        if ([_deviceNo isEqualToString:@"iPhone5,1"]) _deviceNo = @"iPhone 5";
        
        if ([_deviceNo isEqualToString:@"iPhone5,2"]) _deviceNo = @"iPhone 5";
        
        if ([_deviceNo isEqualToString:@"iPhone5,3"]) _deviceNo = @"iPhone 5c";
        
        if ([_deviceNo isEqualToString:@"iPhone5,4"]) _deviceNo = @"iPhone 5c";
        
        if ([_deviceNo isEqualToString:@"iPhone6,1"]) _deviceNo = @"iPhone 5s";
        
        if ([_deviceNo isEqualToString:@"iPhone6,2"]) _deviceNo = @"iPhone 5s";
        
        if ([_deviceNo isEqualToString:@"iPhone7,1"]) _deviceNo = @"iPhone 6 Plus";
        
        if ([_deviceNo isEqualToString:@"iPhone7,2"]) _deviceNo = @"iPhone 6";
        
        if ([_deviceNo isEqualToString:@"iPhone8,1"]) _deviceNo = @"iPhone 6s";
        
        if ([_deviceNo isEqualToString:@"iPhone8,2"]) _deviceNo = @"iPhone 6s Plus";
        
        if ([_deviceNo isEqualToString:@"iPhone8,4"]) _deviceNo = @"iPhone SE";
        
        if ([_deviceNo isEqualToString:@"iPhone9,1"]) _deviceNo = @"iPhone 7";
        
        if ([_deviceNo isEqualToString:@"iPhone9,2"]) _deviceNo = @"iPhone 7 Plus";
        
        if ([_deviceNo isEqualToString:@"iPod1,1"])   _deviceNo = @"iPod Touch 1G";
        
        if ([_deviceNo isEqualToString:@"iPod2,1"])   _deviceNo = @"iPod Touch 2G";
        
        if ([_deviceNo isEqualToString:@"iPod3,1"])   _deviceNo = @"iPod Touch 3G";
        
        if ([_deviceNo isEqualToString:@"iPod4,1"])   _deviceNo = @"iPod Touch 4G";
        
        if ([_deviceNo isEqualToString:@"iPod5,1"])   _deviceNo = @"iPod Touch 5G";
        
        if ([_deviceNo isEqualToString:@"iPad1,1"])   _deviceNo = @"iPad 1G";
        
        if ([_deviceNo isEqualToString:@"iPad2,1"])   _deviceNo = @"iPad 2";
        
        if ([_deviceNo isEqualToString:@"iPad2,2"])   _deviceNo = @"iPad 2";
        
        if ([_deviceNo isEqualToString:@"iPad2,3"])   _deviceNo = @"iPad 2";
        
        if ([_deviceNo isEqualToString:@"iPad2,4"])   _deviceNo = @"iPad 2";
        
        if ([_deviceNo isEqualToString:@"iPad2,5"])   _deviceNo = @"iPad Mini 1G";
        
        if ([_deviceNo isEqualToString:@"iPad2,6"])   _deviceNo = @"iPad Mini 1G";
        
        if ([_deviceNo isEqualToString:@"iPad2,7"])   _deviceNo = @"iPad Mini 1G";
        
        if ([_deviceNo isEqualToString:@"iPad3,1"])   _deviceNo = @"iPad 3";
        
        if ([_deviceNo isEqualToString:@"iPad3,2"])   _deviceNo = @"iPad 3";
        
        if ([_deviceNo isEqualToString:@"iPad3,3"])   _deviceNo = @"iPad 3";
        
        if ([_deviceNo isEqualToString:@"iPad3,4"])   _deviceNo = @"iPad 4";
        
        if ([_deviceNo isEqualToString:@"iPad3,5"])   _deviceNo = @"iPad 4";
        
        if ([_deviceNo isEqualToString:@"iPad3,6"])   _deviceNo = @"iPad 4";
        
        if ([_deviceNo isEqualToString:@"iPad4,1"])   _deviceNo = @"iPad Air";
        
        if ([_deviceNo isEqualToString:@"iPad4,2"])   _deviceNo = @"iPad Air";
        
        if ([_deviceNo isEqualToString:@"iPad4,3"])   _deviceNo = @"iPad Air";
        
        if ([_deviceNo isEqualToString:@"iPad4,4"])   _deviceNo = @"iPad Mini 2G";
        
        if ([_deviceNo isEqualToString:@"iPad4,5"])   _deviceNo = @"iPad Mini 2G";
        
        if ([_deviceNo isEqualToString:@"iPad4,6"])   _deviceNo = @"iPad Mini 2G";
        
        if ([_deviceNo isEqualToString:@"i386"])      _deviceNo = @"iPhone Simulator";
        
        if ([_deviceNo isEqualToString:@"x86_64"])    _deviceNo = @"iPhone Simulator";
    }
    return _deviceNo;
}
@end
