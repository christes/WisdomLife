//
//  UIViewController+Loading.h
//  ocean
//
//  Created by boundlessocean on 16/5/15.
//  Copyright © 2016年 ocean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Loading)

/** 根据frame显示loadingView  */
- (void)bl_showLoadingViewWithFrame:(CGRect)frame;

/** 显示loadingView */
- (void)bl_showLoadingView;

/** 隐藏loadingView */
- (void)bl_hideLoadingView;

@end
