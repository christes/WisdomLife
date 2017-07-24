//
//  NMtextField.m
//  NMWalletAPP
//
//  Created by boundlessocean on 2017/4/1.
//  Copyright © 2017年 Lemon. All rights reserved.
//

#import "NMtextField.h"

@implementation NMtextField

-(CGRect)placeholderRectForBounds:(CGRect)bounds{
    //return CGRectInset(bounds, 20, 0);
    CGRect inset = CGRectMake(bounds.origin.x, bounds.origin.y + 13, bounds.size.width , bounds.size.height);
    return inset;
}

@end
