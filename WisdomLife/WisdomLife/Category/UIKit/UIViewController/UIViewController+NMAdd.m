//
//  UIViewController+NMAdd.m
//  LemonClient
//
//  Created by xiaoping on 2016/11/30.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "UIViewController+NMAdd.h"

@implementation UIViewController (NMAdd)

- (void)WL_alertShowWithTitle:(NSString *)title message:(NSString *)message {
    [self WL_alertShowWithTitle:title message:message handler:nil];
}

- (void)WL_alertShowWithTitle:(NSString *)title message:(NSString *)message handler:(void (^)(UIAlertAction *))handler {
    if ([title isEqual:[NSNull null]]) {
        title = @"";
    }
    if ([message isEqual:[NSNull null]]) {
        message = @"";
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            handler?handler(action):NULL;
        });
    }];
    [action setValue:WL_COLOR_THEME forKey:@"_titleTextColor"];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)WL_alertShowWithTitle:(NSString *)title message:(NSString *)message cancelHandler:(void (^)(UIAlertAction *))cancelHandler confirmHandler:(void (^)(UIAlertAction *))confirmHandler {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:cancelHandler];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:confirmHandler];
    [cancelAction setValue:WL_COLOR_THEME forKey:@"_titleTextColor"];
    [sureAction setValue:WL_COLOR_THEME forKey:@"_titleTextColor"];
    [alertVC addAction:cancelAction];
    [alertVC addAction:sureAction];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)WL_pushViewControllerForHidesBottomBar:(UIViewController *)vc animation:(BOOL)animation {
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:animation];
}

@end
