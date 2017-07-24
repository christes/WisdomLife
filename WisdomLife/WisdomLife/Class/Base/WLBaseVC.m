//
//  WLBaseVC.m
//  NMWalletAPP
//
//  Created by xiaoping on 2016/11/17.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "WLBaseVC.h"
@interface WLBaseVC ()
@end

static const CGFloat navBarItemfixedSpaceWidth = -1;

@implementation WLBaseVC

- (instancetype)init{
    
    if (self = [super init]) {
        _canDragBack = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = WL_COLOR_BACKG;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showNetworkLost) name:kNMNetworkLostNotifacation object:nil];
    // Do any additional setup after loading the view.
    [self initSubviews];
    [self initLayout];
    [self handleViewAction];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSString *str = NSStringFromClass(self.class);
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSString *str = NSStringFromClass(self.class);
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNMNetworkLostNotifacation object:nil];
}

#pragma mark - - public

/** 初始化页面 */
- (void)initSubviews {
    [self.view addSubview:self.loadingFailedView];
}

- (void)initLayout {
    [_loadingFailedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
}

/** 事件处理 */
- (void)handleViewAction{
    WL_WEAKSELF
    _loadingFailedView.actionBlock = ^(){
        WL_STRONGSELF
        [self reloadPage];
    };
}

/** 重新加载 */
- (void)reloadViewShouldShow:(BOOL)isShow{
    self.loadingFailedView.hidden = !isShow;
    if (isShow) {
        self.rightBarButtonItem.enabled = NO;
        self.leftBarButtonItem.enabled = NO;
        [self.view bringSubviewToFront:self.loadingFailedView];
    } else {
        self.rightBarButtonItem.enabled = YES;
        self.leftBarButtonItem.enabled = YES;
        [self.view sendSubviewToBack:self.loadingFailedView];
    }
}

- (void)reloadPage{
    WLLog(@"刷新页面");
}

/** 统计事件 */
- (void)statisticsEventsWithName:(NSString *)eventName{
}

/** 网络连接丢失 */
- (void)showNetworkLost{
}



#pragma mark - - lazy load

- (NMLoadingFailedView *)loadingFailedView{
    if (!_loadingFailedView) {
        _loadingFailedView = [[NMLoadingFailedView alloc] init];
        _loadingFailedView.hidden = YES;
        _loadingFailedView.type = NMNoDataViewTypeRefresh;
    }
    return _loadingFailedView;
}


#pragma mark - - left right Item
/** left item */
- (void)setUpLeftItemWithImageName:(NSString *)imageName
                             title:(NSString *)title
                        titleColor:(UIColor *)color
                            target:(id)target
                            action:(SEL)action{
    
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                   target:nil
                                   action:nil];
    
    fixedSpace.width = navBarItemfixedSpaceWidth;

    if (imageName != nil) {
        _leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:imageName
                                                    target:self
                                                    action:action];
    }else{
        _leftBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:title
                                         selectedTitle:title
                                            titleColor:color
                                                target:self
                                                action:action];
    }
    self.navigationItem.leftBarButtonItems = @[fixedSpace,_leftBarButtonItem];
}

/** right item */
- (void)setUpRightItemWithImageName:(NSString *)imageName
                              title:(NSString *)title
                      selectedTitle:(NSString *)selectedTitle
                         titleColor:(UIColor *)color
                             target:(id)target
                             action:(SEL)action{
    
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                   target:nil
                                   action:nil];
    fixedSpace.width = navBarItemfixedSpaceWidth;
    
    if (imageName != nil) {
        _rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:imageName
                                                    target:self
                                                    action:action];
    }else{
        _rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:title
                                         selectedTitle:selectedTitle
                                            titleColor:color
                                                target:self
                                                action:action];
    }
    self.navigationItem.rightBarButtonItems = @[fixedSpace,_rightBarButtonItem];
}


@end
