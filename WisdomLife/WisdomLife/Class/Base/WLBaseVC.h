//
//  WLBaseVC.h
//  NMWalletAPP
//
//  Created by xiaoping on 2016/11/17.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMLoadingFailedView.h"
@interface WLBaseVC : UIViewController

@property (nonatomic, strong) NMLoadingFailedView *loadingFailedView;
@property (nonatomic, strong) UIBarButtonItem *leftBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;
/** 是否支持侧滑返回, 默认YES */
@property (nonatomic, assign) BOOL canDragBack;


/** 统计事件 */
- (void)statisticsEventsWithName:(NSString *)eventName;
/** 会先调用 initSubviews */
- (void)initSubviews;
- (void)initLayout;
- (void)handleViewAction;

/** 是否显示刷新页面 */
- (void)reloadViewShouldShow:(BOOL)isShow;

/** 重新加载 */
- (void)reloadPage;

/**
 *  设置导航栏左边item
 *
 *  @param imageName 图片名称
 *  @param title     标题
 *  @param target    <#target description#>
 *  @param action    <#action description#>
 */
- (void)setUpLeftItemWithImageName:(NSString *)imageName
                             title:(NSString *)title
                        titleColor:(UIColor *)color
                            target:(id)target
                            action:(SEL)action;
/**
 *  设置导航栏右边item
 *
 *  @param imageName 图片名称
 *  @param title     标题
 *  @param target    <#target description#>
 *  @param action    <#action description#>
 */
- (void)setUpRightItemWithImageName:(NSString *)imageName
                              title:(NSString *)title
                      selectedTitle:(NSString *)selectedTitle
                         titleColor:(UIColor *)color
                             target:(id)target
                             action:(SEL)action;

@end
