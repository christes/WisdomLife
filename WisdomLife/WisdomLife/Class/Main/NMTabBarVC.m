//
//  NMTabBarVC.m
//  NMWalletAPP
//
//  Created by boundlessocean on 2016/11/18.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "NMTabBarVC.h"
#import "NMNavigationVC.h"
@interface NMTabBarVC ()
@end
@implementation NMTabBarVC

+ (void)load{
    [UITabBar appearance].tintColor = WL_COLOR_THEME;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllerWithClassname:@"WLHomeViewController" imagename:@"home" title:@"首页"];
    [self addChildViewControllerWithClassname:@"WLNearbyViewController" imagename:@"nearby" title:@"附近"];
    [self addChildViewControllerWithClassname:@"WLLifeViewController" imagename:@"live" title:@"惠生活"];
    [self addChildViewControllerWithClassname:@"WLMineViewController" imagename:@"mine" title:@"我的"];
    
}

#pragma mark - - 添加控制器
// 添加子控制器
- (void)addChildViewControllerWithClassname:(NSString *)classname
                                  imagename:(NSString *)imagename
                                      title:(NSString *)title {
    
    UIViewController *vc = [[NSClassFromString(classname) alloc] init];
    vc.title = title;
    NMNavigationVC *nav = [[NMNavigationVC alloc] initWithRootViewController:vc];
    nav.tabBarItem.image = [UIImage imageNamed:[imagename stringByAppendingString:@"_n"]];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:[imagename stringByAppendingString:@"_s"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
}

@end
