//
//  NMUserInfoManager.h
//  NMWalletAPP
//
//  Created by xiaoping on 2016/11/17.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLUserInfoModel.h"
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
- (WLUserInfoModel *)currentUserInfo;

/**
 *  更新缓存中的用户信息
 */
- (void)resetUserInfoWithUserInfo:(WLUserInfoModel *)userInfo;

/**
 *  用来记录是否是登陆状态
 */
@property (nonatomic, assign) BOOL isLogin;

/** 手机号 */
@property (nonatomic ,strong)NSString *phoneNum;

/** 手机号 */
@property (nonatomic ,strong)NSString *phoneSecretNum;

/** 用户昵称 */
@property (nonatomic ,strong)NSString *userName;

/**  */
@property (nonatomic ,strong)id userJson;
/**
 *  用户激活状态
 */
@property (nonatomic, assign) NMHomeActivateStatusType userStatus;

@end
