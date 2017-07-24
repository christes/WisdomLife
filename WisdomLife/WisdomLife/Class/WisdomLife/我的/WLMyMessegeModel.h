//
//  WLMyMessegeModel.h
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/24.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLBaseModel.h"

@interface WLMyMessegeModel : WLBaseModel
/** 标题 */
@property (nonatomic ,strong)NSString *titleLable;
/**  子标题*/
@property (nonatomic ,strong)NSString *subtitleLable;
/** 图片名 */
@property (nonatomic ,strong)NSString *imageName;
@end
