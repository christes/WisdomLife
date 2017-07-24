//
//  NMAPPConfigure.h
//  NMWalletAPP
//
//  Created by xiaoping on 2016/11/17.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface NMAPPConfigure : NSObject

/** 获取根控制器 */
+ (UIViewController *)getRootViewController;

/** 异常捕捉 */
+ (void)catchExceptionCreash;

/** 配置环境 */
+ (void)configureAPIDOMAIN;

@end
