//
//  UISwitch+BLBlock.h
//  MyFreeMall
//
//  Created by boundlessocean on 16/11/11.
//  Copyright © 2016年 GXCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BLSwitchActionBlock)(id sender);

@interface UISwitch (BLBlock)

- (void)bl_handleWithBlock:(BLSwitchActionBlock)actionBlock controlEvent:(UIControlEvents)controlEvent;
@end
