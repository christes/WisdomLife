//
//  WLMyWalletModel.h
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/26.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLBaseModel.h"

@interface WLMyWalletModel : WLBaseModel
/** 日期 */
@property (nonatomic ,strong)NSString *date;
/** 商家 */
@property (nonatomic ,strong)NSString *dealership;
/** 消费类型 */
@property (nonatomic ,strong)NSString *type;
/** 金额 */
@property (nonatomic ,strong)NSString *money;
/**圆圈图片  */
//@property (nonatomic ,strong)NSString *cicrleImageName;
@end
