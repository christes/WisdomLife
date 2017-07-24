//
//  UILabel+LineAndWordSpace.m
//  NMWalletAPP
//
//  Created by boundlessocean on 2017/5/17.
//  Copyright © 2017年 Lemon. All rights reserved.
//

#import "UILabel+LineAndWordSpace.h"

@implementation UILabel (LineAndWordSpace)

- (void)setUpLineSpace:(float)lineSpace WordSpace:(float)wordSpace{
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
}

- (void)setUpLineSpace:(float)lineSpace{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
}

- (void)setUpWordSpace:(float)wordSpace{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text
                                                                                         attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
}
@end
