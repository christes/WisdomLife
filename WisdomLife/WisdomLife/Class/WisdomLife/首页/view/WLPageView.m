//
//  WLPageView.m
//  08-分页
//
//  Created by xiaomage on 15/5/28.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "WLPageView.h"

@interface WLPageView() <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@end

@implementation WLPageView

+ (instancetype)pageView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    // 设置scrollView的frame
    self.scrollView.frame = self.bounds;
    
    // 获得scrollview的尺寸
    CGFloat scrollW = self.scrollView.frame.size.width;
    CGFloat scrollH = self.scrollView.frame.size.height;
    
//     //设置pageControl
    CGFloat pageW = 200;
//    CGFloat pageH = 10;
//    CGFloat pageX = _scrollView.centerX-pageW/2;
//    CGFloat pageY = scrollH - pageH-35;
//    self.pageControl.frame = CGRectMake(WL_WIDTH(pageX), WL_HEIGHT(pageY), WL_WIDTH(pageW), WL_HEIGHT(pageH));
//    CGFloat pageX = (_scrollView.width - pageW)/2;
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(WL_HEIGHT(10));
        make.width.mas_equalTo(WL_WIDTH(100));
//        make.centerX.mas_equalTo(WL_SCREEN_W/2);
        make.left.mas_equalTo(self).offset(WL_WIDTH(140));
        make.top.mas_equalTo(self).offset(WL_HEIGHT(140));
    }];
    // 设置内容大小
    self.scrollView.contentSize = CGSizeMake(self.imageNames.count * scrollW, 0);
    
    // 设置所有imageView的frame
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i * scrollW, 0, scrollW, scrollH);
    }
    
        
    
}

#pragma mark - setter方法的重写
- (void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;
    
    // 移除之前的所有imageView
    // 让subviews数组中的所有对象都执行removeFromSuperview方法
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // 根据图片名创建对应个数的imageView
    for (int i = 0; i<imageNames.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:imageNames[i]];
        [self.scrollView addSubview:imageView];
    }
    
    // 设置总页数
    self.pageControl.numberOfPages = imageNames.count;
//    if (imageNames.count <= 1) {
//        self.pageControl.hidden = YES;
//    } else {
//        self.pageControl.hidden = NO;
//    }
//    self.pageControl.hidden = imageNames.count <= 1;
//    self.pageControl.hidesForSinglePage = YES;
}

- (void)setCurrentColor:(UIColor *)currentColor
{
    _currentColor = currentColor;
    
    self.pageControl.currentPageIndicatorTintColor = currentColor;
}

- (void)setOtherColor:(UIColor *)otherColor
{
    _otherColor = otherColor;
    
    self.pageControl.pageIndicatorTintColor = otherColor;
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
}
@end
