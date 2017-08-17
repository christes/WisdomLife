//
//  WLShowView.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/8/3.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLShowView.h"

@interface WLShowView()
/**  */
@property (nonatomic ,strong)UILabel *hello;
/**  */
@property (nonatomic ,strong)UIView *line;
/**  */
@property (nonatomic ,strong)UIView *line2;
/**  */
@property (nonatomic ,strong)UIImageView *imageV;
/**  */
@property (nonatomic ,strong)UILabel *type;
/**  */
@property (nonatomic ,strong)UILabel *date;

/**  */
@property (nonatomic ,strong)UILabel *heji;
/**  */
@property (nonatomic ,strong)UILabel *money;
/**  */
@property (nonatomic ,strong)UILabel *yuan;
/**  */
@property (nonatomic ,strong)UILabel *time;
/**  */
//@property (nonatomic ,strong)UIImageView *backgroungV;

@end
@implementation WLShowView
- (instancetype)init{
    self= [super init];
    if (self) {
        [self setSubviews];
        [self layout];
        self.image =  [UIImage imageNamed:@"baseboard_02home"];
        
    }
    return  self;
}
/** 设置子控件 */
- (void)setSubviews{
//    [self addSubview:self.backgroungV];
    [self addSubview:self.hello];
    [self addSubview:self.line];
    [self addSubview:self.line2];
    [self addSubview:self.imageV];
    [self addSubview:self.type];
    [self addSubview:self.date];
    [self addSubview:self.evaluation];
    [self addSubview:self.buyAgain];
    [self addSubview:self.heji];
    [self addSubview:self.money];
    [self addSubview:self.yuan];
    [self addSubview:self.time];
    
}
/** 布局 */
- (void)layout{
//    [_backgroungV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self).offset(5);
//        make.top.mas_equalTo(self);
//    }];
    [_hello mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(WL_WIDTH(10));
        make.top.mas_equalTo(self).offset(WL_HEIGHT(33));
    }];
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self).offset(WL_HEIGHT(-52.5));
        make.left.mas_equalTo(self).offset(WL_WIDTH(5));
        make.right.mas_equalTo(self).offset(WL_WIDTH(-5));
        make.height.mas_equalTo(WL_HEIGHT(0.5));
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(WL_HEIGHT(67));
        make.left.mas_equalTo(self).offset(WL_WIDTH(5));
        make.right.mas_equalTo(self).offset(WL_WIDTH(-5));
        make.height.mas_equalTo(WL_HEIGHT(0.5));
    }];
    [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(WL_WIDTH(10));
//        make.width.mas_equalTo(WL_WIDTH(80));
//        make.height.mas_equalTo(WL_HEIGHT(50));
        make.top.mas_equalTo(self).offset(WL_HEIGHT(80));
    }];
    [_type mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_imageV.mas_right).offset(WL_WIDTH(15));
        make.top.mas_equalTo(self).offset(WL_HEIGHT(80));
        make.right.mas_equalTo(self).offset(WL_WIDTH(-10));
    }];
    [_date mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.mas_equalTo(_imageV.mas_right).offset(WL_WIDTH(15));
        make.top.mas_equalTo(_type.mas_bottom).offset(WL_HEIGHT(10));
    }];
    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_date.mas_right).offset(WL_WIDTH(15));
        make.top.mas_equalTo(_type.mas_bottom).offset(WL_HEIGHT(10));
    }];
    [_evaluation mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.mas_equalTo(self).offset(WL_WIDTH(10));
        make.width.mas_equalTo(WL_WIDTH(60));
        make.height.mas_equalTo(WL_HEIGHT(20));
        make.bottom.mas_equalTo(self).offset(WL_HEIGHT(-20));
        
    }];
    [_buyAgain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_evaluation.mas_right).offset(WL_WIDTH(14));
        make.width.mas_equalTo(WL_WIDTH(60));
        make.height.mas_equalTo(WL_HEIGHT(20));
        make.bottom.mas_equalTo(self).offset(WL_HEIGHT(-20));
    }];
    [_heji mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.mas_equalTo(self).offset(WL_HEIGHT(-20));
        make.right.mas_equalTo(_money.mas_left).offset(-10);
    }];
    [_money mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.mas_equalTo(self).offset(WL_HEIGHT(-20));
        make.right.mas_equalTo(_yuan.mas_left).offset(WL_WIDTH(-10));
    }];
    [_yuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(WL_WIDTH(-10));
       make.bottom.mas_equalTo(self).offset(WL_HEIGHT(-20));
    }];


}
#pragma mark lazy load
-(UILabel *)hello{
    if (!_hello) {
        _hello = [UILabel new];
        _hello.font = WL_FONT(20);
        _hello.textColor =WL_COLOR_THEME;
        _hello.text = @"您好，李先生";
        
    }
    return _hello;
}
-(UIView *)line{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = WL_COLOR_LINE;
    }

    return _line;
}
-(UIView *)line2{
    if (!_line2) {
        _line2 = [UIView new];
        _line2.backgroundColor = WL_COLOR_LINE;
    }
    
    return _line2;
}
-(UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [[UIImageView alloc] init];
        _imageV.image = [UIImage imageNamed:@"imghome"];
        
    }
    return _imageV;
}
-(UILabel *)type{
    if (!_type) {
        _type = [UILabel new];
        _type.font = WL_FONT(15);
        _type.textColor = WL_COLOR_TITLE;
        _type.text = @"洗刷刷洗车美容连锁店洗车及抛光打蜡套餐";
        _type.numberOfLines = 0;
    }
    return _type;
}
-(UILabel *)date{
    if (!_date) {
        _date = [UILabel new];
        _date.font = WL_FONT(11);
        _date.textColor = WL_COLOR_SUBTITLE;
        _date.text = @"2015.08.09";
    }
    return _date;

}
-(UIButton *)evaluation{
    if (!_evaluation) {
        _evaluation = [UIButton buttonWithType:UIButtonTypeCustom];
        _evaluation.titleLabel.font = WL_FONT(13);
        _evaluation.titleLabel.textColor = WL_COLOR_SUBTITLE;
        [_evaluation setTitle:@"去评价" forState:UIControlStateNormal];
        
        [_evaluation setImage:[UIImage imageNamed:@"button_01home"] forState:UIControlStateNormal];
    }
    return _evaluation;
}
-(UIButton *)buyAgain{
    if (!_buyAgain) {
        _buyAgain = [UIButton buttonWithType:UIButtonTypeCustom];
        _buyAgain.titleLabel.font = WL_FONT(13);
        _buyAgain.titleLabel.textColor = WL_COLOR_THEME;
        [_buyAgain setTitle:@"再次购买" forState:UIControlStateNormal];
        [_buyAgain setImage:[UIImage imageNamed:@"button_02home"] forState:UIControlStateNormal];
        
    }
    return _buyAgain;
}
-(UILabel *)heji{
    if (!_heji) {
        _heji = [UILabel new];
        _heji.font = WL_FONT(15);
        _heji.textColor = WL_COLOR_TITLE;
        _heji.text =@"共计:";
    }
    return _heji;

}
-(UILabel *)money{
    if (!_money) {
        _money = [UILabel new];
        _money.font = WL_FONT(20);
        _money.textColor = WL_COLOR_THEME;
        _money.text = @"38.00";
    }
    return _money;
}
-(UILabel *)yuan{
    if (!_yuan) {
        _yuan = [UILabel new];
        _yuan.font = WL_FONT(15);
        _yuan.textColor = WL_COLOR_TITLE;
        _yuan.text = @"元";
    }
    return _yuan;
}
-(UILabel *)time{
    if (!_time) {
        _time = [UILabel new];
        _time.font = WL_FONT(11);
        _time.textColor = WL_COLOR_SUBTITLE;
        _time.text = @"10:30:59";
    }
    return _time;
}
//- (UIImageView *)backgroungV{
//    if (!_backgroungV) {
//        _backgroungV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baseboard_02home"]];
//    }
//    return _backgroungV;
//}
@end
