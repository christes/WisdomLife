//
//  NMHUDManager.h
//  LemonLoan
//
//  Created by xiaoping on 16/5/16.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIView,UIButton;

@interface NMHUDManager : NSObject

#pragma mark - show
+ (void)showWithText:(NSString *)text;
+ (void)showWithDefaultText;
+ (void)showWithText:(NSString *)text dismissDelay:(NSTimeInterval)delay;

+ (void)showErrorWithText:(NSString *)text;
+ (void)showErrorWithText:(NSString *)text dismissDelay:(NSTimeInterval)delay;

+ (void)showSuccessWithText:(NSString *)text;
+ (void)showSuccessWithText:(NSString *)text dismissDelay:(NSTimeInterval)delay;
+ (void)showSuccessWithView:(UIView *)view text:(NSString *)text dismissDelay:(NSTimeInterval)delay;
+ (void)showSuccessWithView:(UIView *)view text:(NSString *)text dismissDelay:(NSTimeInterval)delay finished:(void(^)(void))finishedBlock;

+ (void)showInfoWithText:(NSString *)text dismissDelay:(NSTimeInterval)delay;

+ (void)showProgress:(float)pro;
+ (void)showProgress:(float)pro text:(NSString *)text;

#pragma mark - dismiss
+ (void)dismiss;
+ (void)dismissWithDelay:(NSTimeInterval)delay;

#pragma mark - new apis

+ (void)showWithView:(UIView *)view text:(NSString *)text;
+ (void)dismissWithView:(UIView *)view;

#pragma mark - failure view

/**
 *  failure view
 *
 *  @param view  view description
 *  @param block block description
 */
+ (void)showFailureViewWithView:(UIView *)view buttonActionBlock:(void(^)(UIButton *sender))block;

+ (void)showFailureViewWithView:(UIView *)view text:(NSString *)text buttonActionBlock:(void(^)(UIButton *sender))block;

#pragma mark - load and dismiss for load

+ (void)showLoadViewWithView:(UIView *)view text:(NSString *)text;
+ (void)showDefaultTextForLoadViewWithView:(UIView *)view;
+ (void)dismissLoadViewWithView:(UIView *)view;


@end
