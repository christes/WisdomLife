//
//  WLLifeCollectionViewCell.h
//  WisdomLife
//
//  Created by boundlessocean on 2017/8/9.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WLLifeCollectionViewCellModel;
@interface WLLifeCollectionViewCell : UICollectionViewCell
/**  */
@property (nonatomic ,strong)WLLifeCollectionViewCellModel *model;
/**  */
@property (nonatomic ,strong)UIColor *bigTitleColor;
@end
