//
//  NMLoadingFailedView.h
//  NMWalletAPP
//
//  Created by boundlessocean on 2017/3/9.
//  Copyright © 2017年 coffee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^NMLoadingFailedViewActionBlock)();

@interface NMLoadingFailedView : UIView

@property (nonatomic, copy)NMLoadingFailedViewActionBlock actionBlock;

@property (nonatomic, assign)NMNoDataViewType type;
@end
