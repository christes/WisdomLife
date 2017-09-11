//
//  NMUserInfoManager.m
//  NMWalletAPP
//
//  Created by xiaoping on 2016/11/17.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "NMUserInfoManager.h"
#import "NMFileCacheManager.h"
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
}

// 登陆
- (void)didLoginInWithUserInfo:(WLUserInfoModel *)userInfo {
    [userInfo archive];
    
}

// 退出登陆
- (void)didLoginOut {
    [NMFileCacheManager removeObjectByFileName:NSStringFromClass([WLUserInfoModel class])];
}

// 判断是否是登陆状态
- (BOOL)isLogin {
    WLUserInfoModel *model = [self currentUserInfo];
    if (model.pwd.length > 0 && [model.moblNo isValidMobileNumber]) {
        return YES;
    } else{
        return NO;
    }
}

- (NSString *)phoneNum{
    if (!_phoneNum) {
        _phoneNum = [self currentUserInfo].moblNo;
    }
    return _phoneNum;
}

- (NSString *)phoneSecretNum{
    if (!_phoneSecretNum) {
       _phoneSecretNum = [self.phoneNum stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    }
    return _phoneSecretNum;
}

- (NSString *)userName{
    if (!_userName) {
        _userName = [self currentUserInfo].userName;
        if (!_userName) {
            _userName = @"请设置昵称";
        }
    }
    return _userName;
}

- (id)userJson{
    if (!_userJson) {
        _userJson = @"";
    }
    return _userJson;
}

@end
