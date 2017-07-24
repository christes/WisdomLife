//
//  WLTools.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/22.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLAppIsNewVersionTool.h"
@implementation WLAppIsNewVersionTool

+ (BOOL)appIsNewVersion{
    // 当前版本
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSString *bunldVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    NSString *currentVersion = [curVersion stringByAppendingString:bunldVersion];
    
    // 保存的版本
    NSString *oldVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"version"];
    
    // 版本比较，下降代表是新版本
    if ([currentVersion compare:oldVersion] == NSOrderedDescending) {
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"version"];
    }
    return  [currentVersion compare:oldVersion] == NSOrderedDescending;
}

@end
