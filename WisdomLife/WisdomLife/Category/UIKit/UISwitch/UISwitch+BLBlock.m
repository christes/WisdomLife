//
//  UISwitch+BLBlock.m
//  MyFreeMall
//
//  Created by boundlessocean on 16/11/11.
//  Copyright © 2016年 GXCloud. All rights reserved.
//

#import "UISwitch+BLBlock.h"
#import <objc/runtime.h>

static char kActionKey;
@implementation UISwitch (BLBlock)

- (void)bl_handleWithBlock:(BLSwitchActionBlock)actionBlock controlEvent:(UIControlEvents)controlEvent{
    
    objc_setAssociatedObject(self, &kActionKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(b_callActionBlock:) forControlEvents:controlEvent];
    
}

- (void)b_callActionBlock:(id)sender{
    
    BLSwitchActionBlock block = (BLSwitchActionBlock)objc_getAssociatedObject(self, &kActionKey);
    if (block) {
        block(self);
    }
}

@end
