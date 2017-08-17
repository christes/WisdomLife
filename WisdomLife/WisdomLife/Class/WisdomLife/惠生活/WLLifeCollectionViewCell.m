//
//  WLLifeCollectionViewCell.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/8/9.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLLifeCollectionViewCell.h"
#import "WLLifeCollectionViewCellModel.h"
@interface WLLifeCollectionViewCell()
/**  */
@property (nonatomic ,strong)UILabel *bigTitle;
/**  */
@property (nonatomic ,strong)UILabel *smallTitle;
/**  */
@property (nonatomic ,strong)UIImageView *iconImageeView;
/**  */
//@property (nonatomic ,strong)UIView *bottomLine;
///**  */
//@property (nonatomic ,strong)UIView *rightLine;

@end

@implementation WLLifeCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self  = [super initWithFrame:frame];
    if (self) {
        [self addSubviews];
        [self layout];
    }

    return self;
}
-(void)setModel:(WLLifeCollectionViewCellModel *)model{
    _model = model;
    _bigTitle.text = model.bigTitleLable;
    _smallTitle.text = model.smallTitleLable;
    _iconImageeView.image = [UIImage imageNamed:model.iconImageName];
    _bigTitleColor = model.bigTitleLableColor;
    

}
/** 添加子控件 */
- (void)addSubviews{
    [self addSubview:self.bigTitle];
      [self addSubview:self.smallTitle];
      [self addSubview:self.iconImageeView];
//    [self addSubview:self.bottomLine];
//    [self addSubview:self.rightLine];

}
/** 设置约束 */
- (void)layout{
    [_bigTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(WL_HEIGHT(35));
        make.left.mas_equalTo(self).offset(WL_WIDTH(11));
    }];
    [_smallTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_bigTitle.mas_bottom).offset(WL_HEIGHT(11));
        make.left.mas_equalTo(self).offset(WL_WIDTH(11));
    }];
    [_iconImageeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(WL_WIDTH(60));
        make.height.mas_equalTo(WL_HEIGHT(60));
        make.left.mas_equalTo(_smallTitle.mas_right).offset(WL_WIDTH(12));
    }];
//    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self).offset(WL_WIDTH(5));
//        make.right.mas_equalTo(self).offset(WL_WIDTH(-5));
//        make.height.mas_equalTo(WL_HEIGHT(0.5));
//        make.bottom.mas_equalTo(self);
//        
//    }];
//    [_rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self).offset(WL_HEIGHT(5));
//        make.right.mas_equalTo(self).offset(WL_HEIGHT(-5));
//        make.width.mas_equalTo(WL_WIDTH(0.5));
//        make.bottom.mas_equalTo(self);
//    }];

}
#pragma mark lazy load
-(UILabel *)bigTitle{
    if (!_bigTitle) {
        _bigTitle = [UILabel new];
        _bigTitle.font = WL_FONT(16);
        _bigTitle.textColor = self.bigTitleColor;
    }
    return _bigTitle;
}
-(UILabel *)smallTitle{
    if (!_smallTitle) {
        _smallTitle = [UILabel new];
        _smallTitle.font = WL_FONT(13);
        _smallTitle.textColor = WL_COLOR_SUBTITLE;
    }
    return _smallTitle;
}
-(UIImageView *)iconImageeView{
    if (!_iconImageeView) {
        _iconImageeView = [[UIImageView alloc] init];
    }
    return _iconImageeView;
}
//- (UIView *)bottomLine{
//    if (!_bottomLine) {
//        _bottomLine = [UIView new];
//        _bottomLine.backgroundColor = WL_COLOR_LINE;
//       
//    }
//    return _bottomLine;
//}
//-(UIView *)rightLine{
//    if (!_rightLine) {
//        _rightLine = [UIView new];
//        _rightLine.backgroundColor = WL_COLOR_LINE;
//        
//    }
//    return _rightLine;
//
//}

@end
