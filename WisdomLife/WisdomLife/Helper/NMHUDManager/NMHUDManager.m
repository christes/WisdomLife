//
//  NMHUDManager.m
//  LemonLoan
//
//  Created by xiaoping on 16/5/16.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "NMHUDManager.h"
#import "SVProgressHUD.h"
#import <objc/runtime.h>

@import UIKit;

#pragma mark - private categories

@interface UIButton (P_NMAdd_HUDManager)


@property (nonatomic,strong) UIView *WL_hudManager_view;

@end


@implementation UIButton (P_NMAdd_HUDManager)

- (void)setWL_hudManager_view:(UIView *)WL_hudManager_view {
    objc_setAssociatedObject(self, @selector(WL_hudManager_view), WL_hudManager_view, OBJC_ASSOCIATION_ASSIGN);
}

- (UIView *)WL_hudManager_view {
    return objc_getAssociatedObject(self, _cmd);
}

@end


#pragma mark - private class

@interface P_NMHUDLoadView : UIView
+ (instancetype)viewWithText:(NSString *)text;
@end

#pragma mark - HUD

@interface NMHUDManager ()

@property (nonatomic,copy) void(^reloadBtnActionBlock)(UIButton *sender);
@property (nonatomic,strong) UIView *reloadBgView;

@end

static const void * kNMTargetObjectForFailureView = &kNMTargetObjectForFailureView;
static const void * kNMKeyForLoadViewAndDissmissView = &kNMKeyForLoadViewAndDissmissView;

@implementation NMHUDManager

+ (void)showWithDefaultText {
    [self showWithText:@"正在努力加载中"];
}

+ (void)showWithText:(NSString *)text {
    [SVProgressHUD showWithStatus:text];
}

+ (void)showWithView:(UIView *)view text:(NSString *)text {
    view.userInteractionEnabled = NO;
    [SVProgressHUD showWithStatus:text];
}

+ (void)showWithText:(NSString *)text dismissDelay:(NSTimeInterval)delay{
    [SVProgressHUD showWithStatus:text];
    [self dismissWithDelay:delay];
}

+ (void)dismiss {
    [SVProgressHUD dismiss];
}

+ (void)dismissWithView:(UIView *)view {
    view.userInteractionEnabled = YES;
    [self dismiss];
}

+ (void)showSuccessWithText:(NSString *)text {
    [SVProgressHUD showSuccessWithStatus:text];
}

+ (void)showSuccessWithText:(NSString *)text dismissDelay:(NSTimeInterval)delay{
    [SVProgressHUD showSuccessWithStatus:text];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}

+ (void)showSuccessWithView:(UIView *)view text:(NSString *)text dismissDelay:(NSTimeInterval)delay{
    [self showSuccessWithText:text dismissDelay:delay];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        view.userInteractionEnabled = YES;
    });
}

+ (void)showSuccessWithView:(UIView *)view text:(NSString *)text dismissDelay:(NSTimeInterval)delay finished:(void(^)(void))finishedBlock {
    [self showSuccessWithView:view text:text dismissDelay:delay];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (finishedBlock) {
            finishedBlock();
        }
    });
}

+ (void)showErrorWithText:(NSString *)text {
    [SVProgressHUD showErrorWithStatus:text];
}

+ (void)showInfoWithText:(NSString *)text dismissDelay:(NSTimeInterval)delay {
    [SVProgressHUD showInfoWithStatus:text];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}

+ (void)showErrorWithText:(NSString *)text dismissDelay:(NSTimeInterval)delay {
    [self showErrorWithText:text];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}

+ (void)showDefaultTextForLoadViewWithView:(UIView *)view {
    [self showLoadViewWithView:view text:@"正在努力加载中"];
}

+ (void)showProgress:(float)pro text:(NSString *)text {
    [SVProgressHUD showProgress:pro status:text];
}

+ (void)showProgress:(float)pro {
    [SVProgressHUD showProgress:pro];
}

+ (void)showLoadViewWithView:(UIView *)view text:(NSString *)text {
    P_NMHUDLoadView *loadView = [P_NMHUDLoadView viewWithText:text];
    [view addSubview:loadView];
    loadView.backgroundColor = [UIColor whiteColor];
    [loadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    objc_setAssociatedObject(view, _cmd, loadView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)dismissLoadViewWithView:(UIView *)view {
    UIView *bgView = objc_getAssociatedObject(view, @selector(showLoadViewWithView:text:));
    [UIView animateWithDuration:0.5 animations:^{
        bgView.alpha = 0;
    } completion:^(BOOL finished) {
        [bgView removeFromSuperview];
        objc_setAssociatedObject(view, @selector(showLoadViewWithView:text:), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }];
}

+ (void)showFailureViewWithView:(UIView *)view buttonActionBlock:(void(^)(UIButton *sender))block {
    [self showFailureViewWithView:view text:@"客官，您的网络貌似有点小问题哦~！" buttonActionBlock:block];
}

+ (void)showFailureViewWithView:(UIView *)view text:(NSString *)text buttonActionBlock:(void(^)(UIButton *sender))block {
    
    if (!view) {
        return;
    }
    
    UIView *bgView = [UIView new];
    [view addSubview:bgView];
    
    bgView.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    //button
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bgView addSubview:btn];
    
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitle:@"重新加载" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.layer.cornerRadius = 20;
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    btn.layer.borderWidth = 1;
    btn.WL_hudManager_view = view;
    
    NMHUDManager *targetObject = [NMHUDManager new];
    targetObject.reloadBtnActionBlock = [block copy];
    targetObject.reloadBgView = bgView;
    
    // retain self
    objc_setAssociatedObject(view, @selector(p_reloadBtnAction:), targetObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [btn addTarget:targetObject action:@selector(p_reloadBtnAction:) forControlEvents:UIControlEventTouchUpInside];
//    [btn zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
//        layout.centerByView(bgView,0);
//        layout.widthValue(100);
//        layout.heightValue(40);
//    }];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    
    // label
    UILabel *label = [UILabel new];
    [bgView addSubview:label];
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = text;
    label.font = [UIFont systemFontOfSize:14];
    label.adjustsFontSizeToFitWidth = YES;
//    [label zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
//        layout.bottomSpaceByView(btn,20);
//        layout.leftSpace(0);
//        layout.rightSpace(0);
//        layout.heightValue(30);
//    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(btn.mas_bottom).offset(40);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
    
    // animation
    bgView.hidden = YES;
    [UIView transitionWithView:view duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        bgView.hidden = NO;
    } completion:nil];
    
}

+ (void)dismissWithDelay:(NSTimeInterval)delay {
    [SVProgressHUD dismissWithDelay:delay];
}

#pragma mark - private

- (void)p_reloadBtnAction:(UIButton *)sender {
    
    [UIView transitionWithView:self.reloadBgView.superview duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        self.reloadBgView.hidden = YES;
    } completion:nil];
    
    NMHUDManager *targetObject = objc_getAssociatedObject(sender.WL_hudManager_view, @selector(p_reloadBtnAction:));
    [targetObject.reloadBgView removeFromSuperview];
    targetObject.reloadBgView = nil;
    
    // release self
    objc_setAssociatedObject(sender.WL_hudManager_view, @selector(p_reloadBtnAction:), nil, OBJC_ASSOCIATION_ASSIGN);
    
    if (self.reloadBtnActionBlock) {
        self.reloadBtnActionBlock(sender);
    }
}

@end

#pragma mark - private class implementation

@implementation P_NMHUDLoadView

+ (instancetype)viewWithText:(NSString *)text {
    P_NMHUDLoadView *loadView = [P_NMHUDLoadView new];
    [loadView p_setupSubviewsWithText:text];
    return loadView;
}

- (void)p_setupSubviewsWithText:(NSString *)text {
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:activityView];
    [activityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [activityView startAnimating];
    
    UILabel *label      = [UILabel new];
    [self addSubview:label];
    
    label.text          = text;
    label.textColor     = [UIColor grayColor];
    label.font          = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
//    [label zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
//        layout.yCenterByView(self,30);
//        layout.widthEqualTo(self,0).multiplier(0.5);
//        layout.xCenterByView(self,0);
//        layout.autoHeight();
//    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(30);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.5);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
}

@end
