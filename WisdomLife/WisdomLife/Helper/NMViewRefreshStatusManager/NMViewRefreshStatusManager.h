//
//  NMViewRefreshStatusManager.h
//  NMWalletAPP
//
//  Created by boundlessocean on 2017/5/25.
//  Copyright © 2017年 Lemon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NMViewRefreshStatusManager : NSObject
WL_SINGLETION(NMViewRefreshStatusManager)
@property (nonatomic, assign) BOOL homeViewIsNeedRefresh;
@end
