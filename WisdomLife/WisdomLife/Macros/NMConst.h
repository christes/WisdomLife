//
//  NMConst.h
//  NMWalletAPP
//
//  Created by boundlessocean on 2016/12/1.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 服务器地址 */
UIKIT_EXTERN NSString * const kNMAPIDOMAIN;
UIKIT_EXTERN NSString * const kNMAPIDOMAIN1;
UIKIT_EXTERN NSString * const kNMAPIDOMAIN2;
UIKIT_EXTERN NSString * const kNMAPIDOMAIN3;
UIKIT_EXTERN NSString * const kNMAPIDOMAIN4;
UIKIT_EXTERN NSString * const kNMAPIDOMAIN5;
/** tabbar高度 */
UIKIT_EXTERN CGFloat const kTabBarH;
/** 导航栏+状态栏高度 */
UIKIT_EXTERN CGFloat const kNavigationBarH;
/** 版本更新 */
UIKIT_EXTERN NSString * const kFVersionKey;

/** 首页需要刷新 */
UIKIT_EXTERN NSString * const kNMHomeViewNeedRefresh;
/** 融360app ID */
UIKIT_EXTERN NSString * const kRong360APPID;
/** 友盟app ID */
UIKIT_EXTERN NSString * const kUmengAPPID;
/** 阿里云推送app ID */
UIKIT_EXTERN NSString * const kCloudPushAPPID;
/** 阿里云推送app Secret */
UIKIT_EXTERN NSString * const kCloudPushAPPSecret;
/** App ID */
UIKIT_EXTERN NSString * const kAppStoreAppID;

UIKIT_EXTERN NSString * const kNMAPPContextUUID;
UIKIT_EXTERN NSString * const kNMAPPContextAccessToken;
UIKIT_EXTERN NSString * const kNMAPPContextPhoneNumber;
UIKIT_EXTERN NSString * const kNMHUDDefaultText;
UIKIT_EXTERN NSString * const kNMHUDUploadText;
UIKIT_EXTERN CGFloat const kHUDDismissDelay;
UIKIT_EXTERN CGFloat const kHUDLDismissDelay;


UIKIT_EXTERN NSString * const kNMIDFrontCellTitleNameText;
UIKIT_EXTERN NSString * const kNMIDFrontCellTitleSexText;
UIKIT_EXTERN NSString * const kNMIDFrontCellTitleDateText;
UIKIT_EXTERN NSString * const kNMIDFrontCellTitleAddressText;
UIKIT_EXTERN NSString * const kNMIDFrontCellTitleCardIDText;
UIKIT_EXTERN NSString * const kNMIDFrontCellTitleNationText;

UIKIT_EXTERN NSString * const kNMIDReverseCellTitleOrgnizeText;
UIKIT_EXTERN NSString * const kNMIDReverseCellTitleAvalbelText;

UIKIT_EXTERN NSString * const kNMMessageCenterTypeSystem;
UIKIT_EXTERN NSString * const kNMMessageCenterTypeNotification;
UIKIT_EXTERN NSString * const kNMNeedMustUpdate;

UIKIT_EXTERN NSString * const kNMACTypePhone ;
UIKIT_EXTERN NSString * const kNMACTypeJD ;
UIKIT_EXTERN NSString * const kNMACTypeZM ;
UIKIT_EXTERN NSString * const kNMACVCNeedsRefreshStatus;
/** 还款状态 */
UIKIT_EXTERN NSString * const kNMRepamentMoneyIsNotEnough;
UIKIT_EXTERN NSString * const kNMRepamentIsSuccess;
UIKIT_EXTERN NSString * const kNMRepamentOrderIshandleing;
/** 账户提现状态 */
UIKIT_EXTERN NSString * const kNMBorrowStatusBorrowing;
UIKIT_EXTERN NSString * const kNMBorrowStatusBorrowSuccess;

/** 消息状态 */
UIKIT_EXTERN NSString * const kNMMessageStatusTypeUnRead;
UIKIT_EXTERN NSString * const kNMMessageStatusTypeRead;
/** 表情提示 */
UIKIT_EXTERN NSString * const kNMEmojiTip ;
/** 图片验证码需要刷新 */
UIKIT_EXTERN NSString * const kNMImageCodeNeedRefresh;
/** 网络连接丢失 */
UIKIT_EXTERN NSString * const kNMNetworkLostNotifacation;
/** 网络连接恢复 */
UIKIT_EXTERN NSString * const kNMNetworkResetNotifacation;
/** 通讯录权限 */
UIKIT_EXTERN NSString * const kNMContactAuthority;
/** 记录时间 */
UIKIT_EXTERN NSString * const kNMACTime;
/** 记录超过5分钟是否刷新 */
//UIKIT_EXTERN NSString * const kNMACResultTimeIsRefreshed;
