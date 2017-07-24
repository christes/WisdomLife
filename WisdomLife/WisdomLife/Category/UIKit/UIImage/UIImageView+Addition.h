//
//  UIImageView+Addition.h
//  NeiHan
//
//  Created by Charles on 16/9/7.
//  Copyright © 2016年 Com.Charles. All rights reserved.
//

#import <UIKit/UIKit.h> 

@interface UIImageView (Addition)

- (instancetype)initWithTarget:(id)target action:( SEL)action;

- (void)addTarget:( id)target action:( SEL)action;

+ (UIImageView *)imageViewWithGIFData:(NSData *)data;
/**
 *  扩大 UIButton 的点击范围
 *  上下左右需要延伸的范围
 *
 *  @param top    <#top description#>
 *  @param right  <#right description#>
 *  @param bottom <#bottom description#>
 *  @param left   <#left description#>
 */
- (void)bl_setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;
@end
