//
//  NMAPPConfigure.m
//  NMWalletAPP
//
//  Created by xiaoping on 2016/11/17.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "NMAPPConfigure.h"
#import "NMTabBarVC.h"
#import "NMFileCacheManager.h"
#import "WLAppIsNewVersionTool.h"
#import "WLCollectionViewController.h"
#import "WLLoginViewController.h"
@interface NMAPPConfigure ()
@end

@implementation NMAPPConfigure

+ (UIViewController *)getRootViewController {
    
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
        return [NMTabBarVC new];
    }
}


+ (void)configureAPIDOMAIN{
    if ([NMFileCacheManager readUserDataForKey:kNMAPIDOMAIN] == nil) {
        [NMFileCacheManager saveUserData:kNMAPIDOMAIN5 forKey:kNMAPIDOMAIN];
    }
}
#warning 异常捕捉
+ (void)catchExceptionCreash{
#ifdef DEBUG
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
#endif
}

void UncaughtExceptionHandler(NSException *exception) {
    
    NSArray *arr = [exception callStackSymbols];
    
    NSString *reason = [exception reason];
    
    NSString *name = [exception name];
    
    NSString *urlStr = [NSString stringWithFormat:@"mailto:boundlessocean@icloud.com?subject=bug报告&body=感谢您的配合!<br><br><br>"
                        
                        "错误详情:<br>%@<br>--------------------------<br>%@<br>---------------------<br>%@",
                        
                        name,reason,[arr componentsJoinedByString:@"<br>"]];
    
    NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [[UIApplication sharedApplication] openURL:url];
    
}



@end
