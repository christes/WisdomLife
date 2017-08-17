//
//  WLLifeCollectionViewCellModel.h
//  WisdomLife
//
//  Created by boundlessocean on 2017/8/9.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLBaseModel.h"

@interface WLLifeCollectionViewCellModel : WLBaseModel
/**  */
@property(nonatomic,copy) NSString *iconImageName;
/**  */
@property(nonatomic,copy) NSString *bigTitleLable;

/**  */
@property(nonatomic,copy) NSString *smallTitleLable;
/**  */
@property(nonatomic,copy) UIColor *bigTitleLableColor;


@end
