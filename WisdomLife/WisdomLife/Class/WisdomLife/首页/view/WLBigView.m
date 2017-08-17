//
//  WLBigView.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/8/1.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLBigView.h"
#import "WLBigModel.h"

@interface WLBigView()
/** 图片 */
@property (nonatomic ,strong)UIImageView *imageV;
/** 文字 */
@property (nonatomic ,strong)UILabel *label;

@end

@implementation WLBigView

-(void)setModel:(WLBigModel *)model{
    _model = model;
    _imageV.image = [UIImage imageNamed:model.imageName];
       _label.text = model.labelName;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self addSubview:self.imageV];
            [self addSubview:self.label];
    }
   return self;
}



- (void)layoutSubviews{
    [super layoutSubviews];
    [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.centerX.mas_equalTo(self);
        
    }];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.top.mas_equalTo(_imageV.mas_bottom).offset(5);
//        make.bottom.mas_equalTo(self);
        make.width.mas_equalTo(self);
    }];
}
#pragma mark lazy load
-(UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [[UIImageView alloc] init];
    }
    return _imageV;
}
-(UILabel *)label{
    if (!_label) {
        _label =[UILabel new];
        _label.font = WL_FONT(15);
        _label.textColor = WL_COLOR_TITLE;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.adjustsFontSizeToFitWidth = YES;
    }
    return _label;

}


@end
