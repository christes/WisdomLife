//
//  WLShoppingCarViewCell.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/26.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLShoppingCarViewCell.h"

@interface WLShoppingCarViewCell()
/** 选择图标（小圆圈） */
@property (nonatomic ,strong)UIButton *imageSelectV;
/** 商家  */
@property (nonatomic ,strong)UILabel *dealershipLabel;
/** 编辑 */
@property (nonatomic ,strong) UIButton *edit;

/** 图片 */
@property (nonatomic ,strong)UIImageView *bigImageV;
/** 套餐类型 */
@property (nonatomic ,strong)UILabel *type;
/** 金额 */
@property (nonatomic ,strong)UILabel *money;
/** 数量 */
@property (nonatomic ,strong)UILabel *numberOf;
/** 线 */
@property (nonatomic ,strong)UIView *line;


@end

@implementation WLShoppingCarViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
   
        [self setAllSubviews];
        [self layout];
    }
         self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baseboardshoppingcar"]];
    self.backgroundColor = [UIColor clearColor];
    return self;
}

/** 添加子视图 */
- (void)setAllSubviews{
    [self addSubview:self.imageSelectV];
    [self addSubview:self.dealershipLabel];
    [self addSubview:self.edit];
    [self addSubview:self.bigImageV];
    [self addSubview:self.type];
    [self addSubview:self.money];
    [self addSubview:self.numberOf];
    [self addSubview:self.line];
}
/** 约束 */
- (void) layout{
    [_imageSelectV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.top.mas_equalTo(self).offset(6);
        make.width.mas_equalTo(WL_WIDTH(33));
        make.height.mas_equalTo(WL_HEIGHT(33));
    }];
    [_dealershipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_imageSelectV.mas_right).offset(11);
        make.top.mas_equalTo(self).offset(14);
    }];
    [_edit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-11);
        make.top.mas_equalTo(self).offset(-5);
        make.width.mas_equalTo(WL_WIDTH(50));
        make.height.mas_equalTo(WL_HEIGHT(60));
    }];
    [_bigImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(20);
        make.top.mas_equalTo(self).offset(45);
        make.width.mas_equalTo(WL_WIDTH(100));
        make.height.mas_equalTo(WL_HEIGHT(75));
    }];
    [_type mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_bigImageV.mas_right).offset(17);
        make.top.mas_equalTo(self).offset(55);
    }];
    [_money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_bigImageV.mas_right).offset(17);
        make.bottom.mas_equalTo(self).offset(-20);
    }];
    [_numberOf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-15);
        make.bottom.mas_equalTo(self).offset(-15);
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.top.mas_equalTo(self).offset(40);
        make.height.mas_equalTo(WL_HEIGHT(0.5));
    }];
}
#pragma mark lazy load

-( UIButton*)imageSelectV{
    if (!_imageSelectV) {
        _imageSelectV = [UIButton buttonWithType:UIButtonTypeCustom];
        [_imageSelectV setImage:[UIImage imageNamed:@"choiceshoppings"] forState:UIControlStateSelected];
        [_imageSelectV setImage:[UIImage imageNamed:@"choiceshopping" ]forState:UIControlStateNormal];
    }
    return _imageSelectV;
}

-(UILabel *)dealershipLabel{
    if (!_dealershipLabel) {
        _dealershipLabel = [UILabel new];
        _dealershipLabel.text = @"洗刷刷洗车行";
        _dealershipLabel.font = WL_FONT(16);
        _dealershipLabel.textColor = WL_COLOR_TITLE;
    }
    return _dealershipLabel;
}
-(UIButton *)edit{
    if (!_edit) {
        _edit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _edit.titleLabel.font = WL_FONT(13);
        _edit.titleLabel.textColor = WL_COLOR_SUBTITLE;
        [_edit setTitle:@"编辑" forState:UIControlStateNormal];
            }
    return _edit;
}
-(UIImageView *)bigImageV{
    if (!_bigImageV) {
        _bigImageV = [[UIImageView alloc] init];
    }
    return _bigImageV;

}
-(UILabel *)type{
    if (!_type) {
        _type = [UILabel new];
        _type.text = @"汽车美容套餐";
        _type.font = WL_FONT(16);
        _type.textColor = WL_COLOR_TITLE;

    }
    return _type;
}
-(UILabel *)money{
    if (!_money) {
        _money = [UILabel new];
        _money.text = @"¥38";
        _money.font = WL_FONT(20);
        _money.textColor = WL_COLOR_THEME;
    }
    return _money;
}
-(UILabel *)numberOf{
    if (!_numberOf) {
        _numberOf = [UILabel new];
        _numberOf.text = @"×1";
        _numberOf.font = WL_FONT(16);
        _numberOf.textColor = WL_COLOR_SUBTITLE;
    }
    return _numberOf;

}
-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = WL_COLOR_LINE;
    }
    return _line;
}
@end
