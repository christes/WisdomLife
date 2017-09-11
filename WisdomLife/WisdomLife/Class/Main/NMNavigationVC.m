//
//  NMNavigationVC.m
//  NMWalletAPP
//
//  Created by boundlessocean on 2016/11/18.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "NMNavigationVC.h"
#import "WLBaseVC.h"

@interface NMNavigationVC ()<UIGestureRecognizerDelegate>
/** 是否支持侧滑返回 */
@property(nonatomic, assign)BOOL canDragBack;
@end

@implementation NMNavigationVC

+ (void)initialize {
    // 设置导航栏背景颜色
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_baseboard"] forBarMetrics:UIBarMetricsDefault];
    // 文字大小
    NSMutableDictionary * color = [NSMutableDictionary dictionary];
    color[NSFontAttributeName] = WL_FONT(17);
    color[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:color];
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    [[UIBarButtonItem appearance] setTitleTextAttributes:color forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dealWithDargBack];
}

/** 处理侧滑返回 */
- (void)dealWithDargBack{
    
    _canDragBack                = YES;
    id target                   = self.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target
                                                                          action:@selector(handleNavigationTransition:)];
    pan.delegate                = self;
    [self.view addGestureRecognizer:pan];
    self.interactivePopGestureRecognizer.enabled = NO;
}


/** 推控制器 */
- (void)pushViewController:(WLBaseVC *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        // 替换back按钮
        UIBarButtonItem *backBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"get_back"
                                                                         imageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)
                                                                                  target:self
                                                                                  action:@selector(back)];
        
        viewController.navigationItem.leftBarButtonItem = backBarButtonItem;
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed         = YES;
        if ([viewController respondsToSelector:@selector(canDragBack)]) {
            _canDragBack = viewController.canDragBack;
        }else{
            _canDragBack = NO;
        }
    }
    [super pushViewController:viewController animated:animated];
}

/** 返回 */
- (void)back {
    [self popViewControllerAnimated:YES];
//    [[NMNetworkManager defaultManager] cancelTaskRequst];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    // 判断 gestureRecognizer 方向 translatedPoint.x < 0 向右 > 0 向左
    CGPoint translatedPoint = [gestureRecognizer translationInView:self.view];
    
    if (_canDragBack && translatedPoint.x > 0 && self.viewControllers.count > 1 ) {
        return YES;
    }else{
        return NO;
    }
}


@end
