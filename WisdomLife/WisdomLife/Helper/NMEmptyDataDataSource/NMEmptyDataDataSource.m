//
//  NMEmptyDataDataSource.m
//  NMWalletAPP
//
//  Created by boundlessocean on 2017/3/9.
//  Copyright © 2017年 coffee. All rights reserved.
//

#import "NMEmptyDataDataSource.h"
@implementation NMEmptyDataDataSource

#pragma mark - - DZNEmptyDataSetSource

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    
    NSString *text = @"暂无数据";
    NSDictionary *attributes = @{NSFontAttributeName: WL_FONT(15),
                                 NSForegroundColorAttributeName: WL_COLOR_PLACEHOLDER};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    return  [UIImage imageNamed:@"blank_page"];
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView{
    return WL_HEIGHT(-45);
}
- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView{
    return WL_HEIGHT(25);
}

@end
