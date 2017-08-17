//
//  WLLifeFoodPreferenceView.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/8/9.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLLifeFoodPreferenceView.h"
@interface WLLifeFoodPreferenceView()
/** 叉子勺子图片 */
@property (nonatomic ,strong)UIImageView *tablewareImageV;
/** 美食特惠 */
@property (nonatomic ,strong)UILabel *foodPreference;
/** 线 */
@property (nonatomic ,strong)UIView *lineView;
/** 大的图片 */
@property (nonatomic ,strong)UIImageView *bigImageV;
/** 小的分类图片 */
@property (nonatomic ,strong)UIView *smallView;
@end

@implementation WLLifeFoodPreferenceView
-(instancetype)init{
    self = [super init ];
    if (self) {
        [self addSubviews];
        [self layout];
        self.image = [UIImage imageNamed:@"baseboard_02life"];
    }
    return  self;

}
/** 添加子控件 */
- (void)addSubviews{
    [self addSubview:self.tablewareImageV];
     [self addSubview:self.foodPreference];
     [self addSubview:self.lineView];
     [self addSubview:self.bigImageV];
     [self addSubview:self.smallView];

}
/** 布局 */

- (void)layout{
    [_tablewareImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(WL_WIDTH(10));
        make.top.mas_equalTo(self).offset(WL_HEIGHT(9));
    }];
    [_foodPreference mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(WL_HEIGHT(9));
        make.left.mas_equalTo(_tablewareImageV.mas_right).offset(WL_WIDTH(10));
    }];

    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.height.mas_equalTo(WL_HEIGHT(0.5));
        make.top.mas_equalTo(self).offset(WL_HEIGHT(60));
    }];
    [_bigImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(WL_WIDTH(21));
        make.top.mas_equalTo(_lineView.mas_bottom).offset(WL_HEIGHT(11));
        make.height.mas_equalTo(WL_HEIGHT(105));
        make.right.mas_equalTo(self).offset(WL_WIDTH(-21));
    }];

    [_smallView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(WL_WIDTH(10));
        make.top.mas_equalTo(_bigImageV.mas_bottom).offset(WL_HEIGHT(15));
    }];


}
#pragma mark lazy load
-(UIImageView *)tablewareImageV{
    if (!_tablewareImageV) {
        _tablewareImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableware"]];
    }
    return _tablewareImageV;
}
-(UILabel *)foodPreference{
    if (!_foodPreference) {
        _foodPreference= [UILabel new];
        _foodPreference.font = WL_FONT(16);
        _foodPreference.textColor = WL_COLOR_TITLE;
        _foodPreference.text = @"美食特惠";
    }
    return _foodPreference;
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = WL_COLOR_LINE;
    }
    return _lineView;
}
-(UIImageView *)bigImageV{
    if (!_bigImageV) {
        _bigImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_cate"]];
    }
    return _bigImageV;
}
-(UIView *)smallView{
    if (!_smallView) {
        _smallView = [UIView new];
    }
    return _smallView;
}

@end
