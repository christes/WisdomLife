//
//  WLCollectionViewCell.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/22.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLCollectionViewCell.h"
@interface WLCollectionViewCell ()
@property (nonatomic ,strong)UIImageView *imageView;


@end
@implementation WLCollectionViewCell

-(UIImageView *)imageView{
    if (_imageView == nil) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
        
        _imageView = imageV;
        
        [self.contentView addSubview:imageV];
    }
    
    return _imageView;
    }



- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
}


@end
