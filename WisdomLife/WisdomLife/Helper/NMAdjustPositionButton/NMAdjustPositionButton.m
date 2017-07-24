//
//  NMAdjustPositionButton.m
//  NMWalletAPP
//
//  Created by boundlessocean on 2016/12/7.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "NMAdjustPositionButton.h"
@implementation NMAdjustPositionButton
{
    CGRect _imageFrame;
    CGRect _titleFrame;
}


- (void)adjustButtonTitleAndImagePositionWithImageFrame:(CGRect)imageFrame
                                             titleFrame:(CGRect)titleFrame{
    _imageFrame = imageFrame;
    _titleFrame = titleFrame;
    
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = _imageFrame;
    self.titleLabel.frame = _titleFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
