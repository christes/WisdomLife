//
//  UIViewController+NMAdd.h
//  LemonClient
//
//  Created by xiaoping on 2016/11/30.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NMAdd)

- (void)WL_alertShowWithTitle:(NSString *)title message:(NSString *)message;

- (void)WL_alertShowWithTitle:(NSString *)title message:(NSString *)message handler:(void (^)(UIAlertAction *action))handler;

- (void)WL_alertShowWithTitle:(NSString *)title message:(NSString *)message cancelHandler:(void (^)(UIAlertAction *action))cancelHandler confirmHandler:(void (^)(UIAlertAction *action))confirmHandler;

- (void)WL_pushViewControllerForHidesBottomBar:(UIViewController *)vc animation:(BOOL)animation;

@end
