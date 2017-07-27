//
//  WLMyWalletViewCell.h
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/26.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WLMyWalletModel;
@interface WLMyWalletViewCell : UITableViewCell
/** 顶部线 */
@property (nonatomic ,strong)UIView *topLine;
/** 底部线 */
@property (nonatomic ,strong)UIView *bottomLine;
/**  */
@property (nonatomic ,strong)WLMyWalletModel *model;
/** 金额 */
@property (nonatomic ,strong)UILabel *money;
/** 圆圈 */
@property (nonatomic ,strong)UIImageView *circleImageV;
@end
