//
//  UILabel+LineAndWordSpace.h
//  NMWalletAPP
//
//  Created by boundlessocean on 2017/5/17.
//  Copyright © 2017年 Lemon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LineAndWordSpace)

/**
 设置行间距，文字间距

 @param lineSpace 行间距
 @param wordSpace 文字间距
 */
- (void)setUpLineSpace:(float)lineSpace
             WordSpace:(float)wordSpace;
- (void)setUpLineSpace:(float)lineSpace;
- (void)setUpWordSpace:(float)wordSpace;
@end
