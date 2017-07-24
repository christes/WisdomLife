//
//  UIViewController+Loading.m
//  ocean
//
//  Created by boundleaocean on 16/5/15.
//  Copyright © 2016年 ocean. All rights reserved.
//

#import "UIViewController+Loading.h"
#import <objc/runtime.h>

@interface UIViewControllerLodingView : UIView
/** 正在加载... */
@property (nonatomic, weak) UILabel *loadingLabel;
/** 菊花 */
@property (nonatomic, weak) UIActivityIndicatorView *indicatorView;
@end

static const CGFloat indicatorViewHeight = 40.0;
static const CGFloat loadingLabelWidth = 80.0;
static const CGFloat loadingImageWidth = 40.0;

@implementation UIViewControllerLodingView

- (void)layoutSubviews {
    [super layoutSubviews];
    self.loadingLabel.frame = CGRectMake(self.frame.size.width / 2.0 - 30, self.frame.size.height / 2.0 - indicatorViewHeight/2, loadingLabelWidth, indicatorViewHeight);
    self.indicatorView.frame = CGRectMake(self.frame.size.width  / 2.0 - 70, self.loadingLabel.frame.origin.y, loadingImageWidth, indicatorViewHeight);
}
#pragma mark - - startAnimating
- (void)startAnimating {
    [self.indicatorView startAnimating];
}

#pragma mark - - get

/** 正在加载... */
- (UILabel *)loadingLabel {
    if (!_loadingLabel) {
        UILabel *loadingLabel = [[UILabel alloc] init];
        loadingLabel.font = [UIFont systemFontOfSize:13];
        loadingLabel.textColor = [UIColor colorWithRed:0.32f green:0.36f blue:0.40f alpha:1.00f];
        loadingLabel.text = @"正在加载...";
        _loadingLabel = loadingLabel;
        [self addSubview:loadingLabel];
    }
    return _loadingLabel;
}
/** 菊花 */
- (UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView = indicatorView;
        [self addSubview:indicatorView];
    }
    return _indicatorView;
}
@end


@implementation UIViewController (Loading)

const static char loadingViewKey;

#pragma mark - - runtime add property
- (UIView *)loadingView {
    return objc_getAssociatedObject(self, &loadingViewKey);
}

- (void)setLoadingView:(UIView *)loadingView {
    objc_setAssociatedObject(self, &loadingViewKey, loadingView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - - public
- (void)bl_showLoadingView {
    [self bl_showLoadingViewWithFrame:CGRectMake(0, self.view.frame.size.height/2 - indicatorViewHeight/2, [[UIScreen mainScreen] bounds].size.width, indicatorViewHeight)];
}

- (void)bl_showLoadingViewWithFrame:(CGRect)frame {
    if (!self.loadingView) {
        UIViewControllerLodingView *loadingView = [[UIViewControllerLodingView alloc] init];
        self.loadingView = loadingView;
        loadingView.frame = frame;
        [self.view addSubview:self.loadingView];
        [loadingView startAnimating];
    }
}

- (void)bl_hideLoadingView {
    if (self.loadingView) {
        [self.loadingView removeFromSuperview];
    }
}
@end
