//
//  WLUserInfoModel.h
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/22.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLUserInfoModel : WLBaseModel
/** 客户编号 */
@property (nonatomic ,strong)NSString *custNo;
/** 手机号 */
@property (nonatomic ,strong)NSString *moblNo;
/** 用户来源 */
@property (nonatomic ,strong)NSString *source;
@end
