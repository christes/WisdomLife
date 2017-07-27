//
//  WLMyWalletViewCell.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/26.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLMyWalletViewCell.h"
#import "WLMyWalletModel.h"

@interface WLMyWalletViewCell ()

/** 背景图片 */
@property (nonatomic ,strong)UIImageView *backgroundImageV;
/** 日期 */
@property (nonatomic ,strong)UILabel *date;


/** 商家 */
@property (nonatomic ,strong)UILabel *dealershipLabel;
/** 消费类型 */
@property (nonatomic ,strong)UILabel *type;


@end

@implementation WLMyWalletViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setAllSubviews];
        [self layout];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
#pragma mark addsubviews
-  (void)setAllSubviews{
    [self addSubview:self.backgroundImageV];
      [self addSubview:self.date];
      [self addSubview:self.circleImageV];
      [self addSubview:self.topLine];
      [self addSubview:self.bottomLine];
      [self addSubview:self.dealershipLabel];
      [self addSubview:self.type];
      [self addSubview:self.money];
}
#pragma mark layoutSubviews
- (void)layout{
    [_backgroundImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(WL_WIDTH(-15));
        make.bottom.mas_equalTo(self.mas_bottom).offset(WL_HEIGHT(-5));
    }];
    [_date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(self.mas_left).offset(WL_WIDTH(15));
    }];
    [_circleImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_backgroundImageV.mas_left).offset(WL_WIDTH(-6));
        make.centerY.mas_equalTo(self.mas_centerY).offset(2);
    }];
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_circleImageV.mas_centerX);
        make.height.mas_equalTo(26.5);
        make.top.mas_equalTo(self.mas_top);
        make.width.mas_equalTo(WL_WIDTH(4));
    }];
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_circleImageV.mas_centerX);
        make.height.mas_equalTo(31.5);
        make.bottom.mas_equalTo(self);
        make.width.mas_equalTo(WL_WIDTH(4));
    }];
    [_dealershipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_backgroundImageV.mas_left).offset(12);
        make.top.mas_equalTo(_backgroundImageV.mas_top).offset(WL_HEIGHT(10));
        
    }];
    [_money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_backgroundImageV.mas_right).offset(WL_WIDTH(-15));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    [_type mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_backgroundImageV.mas_left).offset(WL_WIDTH(12));
        make.top.mas_equalTo(_dealershipLabel.mas_bottom).offset(WL_HEIGHT(5));
    }];
}
#pragma mark 设置模型
-(void)setModel:(WLMyWalletModel *)model{
    _model = model;
    _date.text = _model.date;
    _dealershipLabel.text = _model.dealership;
    _type.text = _model.type;
    _money.text = _model.money;
}

#pragma mark lazy load
- (UIImageView *)backgroundImageV{
    if (!_backgroundImageV) {
        _backgroundImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baseboard_wallet-"]];
    }
    return _backgroundImageV;
}
-(UILabel *)date{
    if (!_date) {
        _date = [UILabel new];
        _date.font = WL_FONT(13);
        _date.textColor = WL_COLOR_DATE;
    }
    return _date;
}
- (UIImageView *)circleImageV
{
    if (!_circleImageV) {
        _circleImageV = [[UIImageView alloc] init];
          }
    return _circleImageV;
}

-(UIView *)topLine{
    if (!_topLine) {
        _topLine = [UIView new];
        _topLine.backgroundColor = WL_COLOR_TOPANDBOTTOMLINE;
    }
    return _topLine;
}

-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [UIView new];
        _bottomLine.backgroundColor = WL_COLOR_TOPANDBOTTOMLINE;
    }
    return _bottomLine;
}
-(UILabel *)dealershipLabel{
    if (!_dealershipLabel) {
        _dealershipLabel = [UILabel new];
        _dealershipLabel.font = WL_FONT(16);
        _dealershipLabel.textColor = WL_COLOR_TITLE;
    }
    return _dealershipLabel;
}
-(UILabel *)money{
    if (!_money) {
        _money = [UILabel new];
        _money.font = WL_FONT(19);
    }
    return _money;
}
-(UILabel *)type{
    if (!_type) {
        _type = [UILabel new];
        _type.font = WL_FONT(13);
        _type.textColor = WL_COLOR_SUBTITLE;
    }
    return _type;
}

@end
