//
//  WLCollectionViewController.h
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/22.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLCollectionViewController : UICollectionViewController

NS_ASSUME_NONNULL_BEGIN
/** 新特性的图片数组 */
@property (nonatomic, strong)NSArray <NSString *> *imageArray;

/** 当前页pageControl 图片 */
@property(nonatomic, strong, nullable) UIImage *currentPageControlImage;
/** 其他页pageControl 图片 */
@property (nonatomic ,strong, nullable) UIImage *otherPageControlImage;
/** 当前页pageControl 颜色 */
@property(nonatomic,strong, nullable) UIColor *currentPageControlColor;
/** 其他页pageControl 颜色 */
@property (nonatomic ,strong, nullable)UIColor *otherPageControlColor;

/** 点击进入 */
@property(nonatomic,copy, nullable) void(^buttonClickCallBackBlock)();

NS_ASSUME_NONNULL_END
@end
