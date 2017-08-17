//
//  WLMyOredrViewCell.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/27.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLMyOredrViewCell.h"
@interface WLMyOredrViewCell()
/** 订单号 */
@property (nonatomic ,strong)UILabel *orderNumber;

/** 订单类型 */
@property (nonatomic ,strong)UILabel *orderType;
/** 订单日期 */
@property (nonatomic ,strong)UILabel *orderDate;
/** 订单金额 */
@property (nonatomic ,strong)UILabel *orderMoney;

/** 线 */
@property (nonatomic ,strong)UIView *line;

@end
@implementation WLMyOredrViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setAllSubviews];
        [self layout];
        
    }
    self.backgroundColor = [UIColor clearColor];
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"basrboardmyorder"]];
    return self;
}
#pragma mark addsubview
- (void)setAllSubviews{
    [self addSubview:self.orderNumber];
      [self addSubview:self.details];
      [self addSubview:self.orderType];
      [self addSubview:self.orderDate];
      [self addSubview:self.orderMoney];
      [self addSubview:self.evaluation];
      [self addSubview:self.line];
    
}
#pragma mark layout
- (void)layout{
    [_orderNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.top.mas_equalTo(self.mas_top).offset(15);
    }];
    [_details mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(3);
        make.top.mas_equalTo(self.mas_top);
        make.height.mas_equalTo(WL_HEIGHT(50));
        make.width.mas_equalTo(WL_WIDTH(100));
    }];
//    _details.frame = CGRectMake(265, 0.5, 100, 50);
    [_orderType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_line.mas_bottom).offset(10);
        make.left.mas_equalTo(self.mas_left).offset(10);
    }];
    [_orderDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_orderMoney.mas_bottom).offset(10);
        make.left.mas_equalTo(self.mas_left).offset(10);
    }];
    [_orderMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
         make.top.mas_equalTo(_orderType.mas_bottom).offset(10);
    }];
    [_evaluation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-20);
        make.height.mas_equalTo(WL_HEIGHT(23));
        make.width.mas_equalTo(WL_WIDTH(60));
    }];
//    _evaluation.frame = CGRectMake(285, 90, 60, 23);
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.top.mas_equalTo(self.mas_top).offset(40);
        make.height.mas_equalTo(WL_HEIGHT(0.5));
    }];


}

#pragma mark lazy load
-(UILabel *)orderNumber{
    if (!_orderNumber) {
        _orderNumber = [UILabel new];
        _orderNumber.font = WL_FONT(16);
        _orderNumber.textColor = WL_COLOR_TITLE;
        _orderNumber.text = @"订单号:";
    }
    return _orderNumber;
}
-(UIButton *)details{
    if (!_details) {
        _details = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _details.titleLabel.font = WL_FONT(13);
        _details.titleLabel.textColor = WL_COLOR_THEME;
        [_details setTitle: @"查看详情" forState:UIControlStateNormal] ;
    }
    return _details;
}
-(UILabel *)orderType{
    if (!_orderType) {
        _orderType = [UILabel new];
        _orderType.font = WL_FONT(13);
        _orderType.textColor = WL_COLOR_SUBTITLE;
        _orderType.text =@"订单类型";
    }
    return _orderType;
}


-(UILabel *)orderMoney{
    if (!_orderMoney) {
        _orderMoney = [UILabel new];
        _orderMoney.font = WL_FONT(13);
        _orderMoney.textColor = WL_COLOR_SUBTITLE;
        _orderMoney.text = @"订单金额";
    }
    return _orderMoney;
}
-(UILabel *)orderDate{
    if (!_orderDate) {
        _orderDate = [UILabel new];
        _orderDate.font = WL_FONT(13);
        _orderDate.textColor = WL_COLOR_SUBTITLE;
        _orderDate.text = @"订单日期：";
    }
    return _orderDate;
}
-(UIButton *)evaluation{
    if (!_evaluation) {
        _evaluation = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _evaluation.titleLabel.font = WL_FONT(13);
        _evaluation.titleLabel.textColor = WL_COLOR_GOEVALUATION;
        [_evaluation setTitle:@"去评价" forState:UIControlStateNormal];
        [_evaluation setBackgroundImage:[UIImage imageNamed:@"button_04myorder"] forState:UIControlStateNormal];
    }
    return _evaluation;
}
-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = WL_COLOR_LINE;
    }
    return _line;
}



@end
