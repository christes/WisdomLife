//
//  NMAPPContext.h
//  NMWalletAPP
//
//  Created by xiaoping on 2016/11/17.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NMUserInfoManager.h"

@interface NMAPPContext : NSObject

@property (nonatomic,strong,readonly) NMUserInfoManager *userInfoManager;
@property (nonatomic, copy, readonly) NSString *appIdentifier;
@property (nonatomic, readonly) NSString *uuid;
@property (nonatomic, readonly) NSString *deviceNo;
@property (nonatomic,     copy) NSString *phoneNumber;
@property (nonatomic,     copy) NSString *accessToken;

+ (instancetype)defaultContext;
@end
