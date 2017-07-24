//
//  UIBarButtonItem+Extension.h
//  MyFreeMall
//
//  Created by boundlessocean on 16/9/2.
//  Copyright © 2016年 GXCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Category)

+ (instancetype)barButtonItemWithImageName:(NSString *)imageName
                                    target:(id)target
                                    action:(SEL)action;

+ (instancetype)barButtonItemWithImageName:(NSString *)imageName
                           imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
                                    target:(id)target
                                    action:(SEL)action;

+ (instancetype)barButtonItemWithTitle:(NSString *)title
                            titleColor:(UIColor *)color
                                target:(id)target
                                action:(SEL)action;

+ (instancetype)barButtonItemWithTitle:(NSString *)title
                         selectedTitle:(NSString *)selTitle
                            titleColor:(UIColor *)color
                                target:(id)target
                                action:(SEL)action;

@end
