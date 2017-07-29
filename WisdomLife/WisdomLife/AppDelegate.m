//
//  AppDelegate.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/22.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "AppDelegate.h"
#import "NMAPPConfigure.h"


#import "NMTabBarVC.h"
#import "WLAppIsNewVersionTool.h"
#import "WLCollectionViewController.h"
#import "WLLoginViewController.h"
#import "WLRegisteredViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [self getRootViewController];
    
    [self.window makeKeyAndVisible];
    return YES;
}



/**
 获取根控制器
 */
- (UIViewController *)getRootViewController {
    BOOL isNewVersion = [WLAppIsNewVersionTool appIsNewVersion];
    if (isNewVersion) {
        WLCollectionViewController *newFeature = [WLCollectionViewController new];
        newFeature.imageArray = @[@"guide_page01",
                                  @"guide_page02",
                                  @"guide_page03",
                                  @"guide_page04"];
        newFeature.currentPageControlImage = [UIImage imageNamed:@"circle_s"];
        newFeature.otherPageControlImage = [UIImage imageNamed:@"circle_n"];
        newFeature.buttonClickCallBackBlock = ^(){
            [UIApplication sharedApplication].keyWindow.rootViewController = [NMTabBarVC new];
        };
        return newFeature;
    }else{
        return [WLLoginViewController new];
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
