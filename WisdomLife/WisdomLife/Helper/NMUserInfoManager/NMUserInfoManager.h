//
//  NMUserInfoManager.h
//  NMWalletAPP
//
//  Created by xiaoping on 2016/11/17.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NMUserInfoModel;
@interface NMUserInfoManager : NSObject
+ (instancetype)sharedManager;

/**
 *  登录成功
 */
- (void)didLoginInWithUserInfo:(id)userInfo;

/**
 *  退出
 */
- (void)didLoginOut;

/**
 *  获取用户信息
 */
- (NMUserInfoModel *)currentUserInfo;

/**
 *  更新缓存中的用户信息
 */
- (void)resetUserInfoWithUserInfo:(NMUserInfoModel *)userInfo;

/**
 *  用来记录是否是登陆状态
 */
@property (nonatomic, assign) BOOL isLogin;


/**
 *  用户激活状态
 */
@property (nonatomic, assign) NMHomeActivateStatusType userStatus;

@end
