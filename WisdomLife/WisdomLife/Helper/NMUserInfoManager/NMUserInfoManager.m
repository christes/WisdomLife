//
//  NMUserInfoManager.m
//  NMWalletAPP
//
//  Created by xiaoping on 2016/11/17.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "NMUserInfoManager.h"
#import "NMFileCacheManager.h"
#import "WLUserInfoModel.h"
@implementation NMUserInfoManager


static  NMUserInfoManager *_singleton = nil;
+ (instancetype)sharedManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[NMUserInfoManager alloc] init];
    });
    return _singleton;
}

// 当前用户信息
- (WLUserInfoModel *)currentUserInfo {
    
    id obj = [NMFileCacheManager getObjectByFileName:NSStringFromClass([WLUserInfoModel class])];
    if (obj != nil) {
        return  obj;
    }
    return nil;
}

// 重置用户信息
- (void)resetUserInfoWithUserInfo:(WLUserInfoModel *)userInfo {
    [userInfo archive];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNMHomeViewNeedRefresh object:[NSNumber numberWithInteger:NMHomeNotificationTypeLogin]];
}

// 登陆
- (void)didLoginInWithUserInfo:(WLUserInfoModel *)userInfo {
    [userInfo archive];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNMHomeViewNeedRefresh object:[NSNumber numberWithInteger:NMHomeNotificationTypeLogin]];
}

// 退出登陆
- (void)didLoginOut {
    [NMFileCacheManager removeObjectByFileName:NSStringFromClass([WLUserInfoModel class])];
    [NMFileCacheManager removeUserDataForkey:kNMAPPContextAccessToken];
    [NMFileCacheManager removeUserDataForkey:kNMAPPContextPhoneNumber];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNMHomeViewNeedRefresh object:[NSNumber numberWithInteger:NMHomeNotificationTypeLogin]];
}

// 判断是否是登陆状态
- (BOOL)isLogin {
    NSString *accessToken = [NMFileCacheManager readUserDataForKey:kNMAPPContextAccessToken];
    WLLog(@"accessToken=%@",accessToken);
    return accessToken.length > 0;
}


@end
