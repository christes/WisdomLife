//
//  WLCardCell.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/25.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLCardCell.h"
@interface WLCardCell()
/** 背景图片 */
@property (nonatomic ,strong) UIImageView * imageCard;
/** 金额 */
@property (nonatomic ,strong)UILabel *moneyLabel;
/** 使用条件 */
@property (nonatomic ,strong)UILabel *useConditionLabel;
/** 使用商家 */
@property (nonatomic ,strong)UILabel *dealershipLabel;
/** 有效期 */
@property (nonatomic ,strong)UILabel *periodOfValidityLabel;
@end
@implementation WLCardCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setALLSubviews];
        [self layout];
        self.backgroundColor = [UIColor clearColor];
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baseboardcard"]];
    }
    return self;
}
#pragma mark 添加子控件
- (void)setALLSubviews{
//    [self addSubview:self.imageCard];
      [self addSubview:self.moneyLabel];
      [self addSubview:self.useConditionLabel];
      [self addSubview:self.dealershipLabel];
      [self addSubview:self.periodOfValidityLabel];
}
#pragma mark 设置约束
- (void)layout{
    [_imageCard mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(WL_WIDTH(0));
        make.right.mas_equalTo(WL_WIDTH(0));
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(WL_HEIGHT(10));

    }];
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(20);
        make.top.mas_equalTo(self.mas_top).offset(WL_HEIGHT(15));
    }];
    [_useConditionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_moneyLabel.mas_left).offset(WL_WIDTH(0));
        make.top.mas_equalTo(_moneyLabel.mas_bottom);
        
    }];
    [_dealershipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(WL_WIDTH(125));
        make.centerY.mas_equalTo(self.centerY).offset(-WL_HEIGHT(15));
    }];
    [_periodOfValidityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_dealershipLabel.mas_bottom).offset(12);
         make.left.mas_equalTo(_dealershipLabel.mas_left).offset(0);
    }];


}

#pragma mark lazy load
- (UIImageView *)imageCard{
    if (!_imageCard) {
        _imageCard = [[UIImageView alloc] init];
        _imageCard.backgroundColor = [UIColor clearColor];
    }

    return  _imageCard;
}
- (UILabel *)moneyLabel{
    if (!_moneyLabel) {
        _moneyLabel = [UILabel new];
        _moneyLabel.font = WL_FONT(40);
        _moneyLabel.textColor = WL_COLOR_THEME;
        _moneyLabel.text = @"¥10";
    }

    return  _moneyLabel;
}
- (UILabel *)useConditionLabel{
    if (!_useConditionLabel) {
        _useConditionLabel = [UILabel new];
        _useConditionLabel.font = WL_FONT(13);
        _useConditionLabel.textColor = WL_COLOR_SUBTITLE;
        _useConditionLabel.text =@"无门槛使用";
    }
    
    return  _useConditionLabel;
}
- (UILabel *)dealershipLabel{
    if (!_dealershipLabel) {
        _dealershipLabel = [UILabel new];
        _dealershipLabel.font = WL_FONT(16);
        _dealershipLabel.textColor = WL_COLOR_TITLE;
        _dealershipLabel.text = @"洗刷刷洗车行";
    }
    
    return  _dealershipLabel;
}
- (UILabel *)periodOfValidityLabel{
    if (!_periodOfValidityLabel) {
        _periodOfValidityLabel = [UILabel new];
        _periodOfValidityLabel.font = WL_FONT(13);
        _periodOfValidityLabel.textColor = WL_COLOR_SUBTITLE;
        _periodOfValidityLabel.text = @"有效期：2017.5.10-2017.8.10";
    }
    
    return  _periodOfValidityLabel;
}


@end
