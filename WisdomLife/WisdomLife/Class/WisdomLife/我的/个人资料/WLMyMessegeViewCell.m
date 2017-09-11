//
//  WLMyMessegeViewCell.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/24.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLMyMessegeViewCell.h"
#import "WLMineViewController.h"
#import "WLMyMessegeModel.h"


@interface WLMyMessegeViewCell ()
/** 标题 */
@property (nonatomic ,strong)UILabel *title;
/** 头像 */
@property (nonatomic ,strong)UIImageView *imageV;
/** 子标题 */
@property (nonatomic ,strong)UILabel *subTitle;
/** 辅助视图 */
@property (nonatomic ,strong)UIImageView *accessoryImageView;
/** 分割线 */
@property (nonatomic ,strong)UIView *line;
@end
@implementation WLMyMessegeViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setAllSubviews];
        [self layoutSubviews];
    }
    return self;
}
/** 设置子视图 */
-(void)setAllSubviews{
    [self addSubview:self.title];
    [self addSubview:self.imageV];
    [self addSubview:self.subTitle];
    [self addSubview:self.accessoryImageView];
    [self addSubview:self.line];
}
/** 设置约束 */
- (void)layoutSubviews{
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(self.mas_centerY);
    } ];
    [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(self.accessoryImageView).offset(WL_WIDTH(-20));
    } ];
    [_subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(self.accessoryImageView).offset(WL_WIDTH(-20));
    } ];
    [_accessoryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo (WL_WIDTH(-20));
        make.centerY.mas_equalTo(self.mas_centerY);
        
    } ];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (WL_WIDTH(0));
        make.right.mas_equalTo(WL_WIDTH(0));
        make.height.mas_equalTo(WL_HEIGHT(0.5));
        make.bottom.mas_equalTo(WL_WIDTH(0));
    } ];
}
#pragma  mark setmodel
- (void)setModel:(WLMyMessegeModel *)model{
    _model = model;
    _title.text = model.titleLable;
    _imageV.image = [UIImage imageNamed:model.imageName];
    _subTitle.text = model.subtitleLable;
    
    
    if ([model.titleLable isEqualToString:@"手机号码"] || model.imageName.length) {
        _accessoryImageView.hidden = YES;
    } else{
        _accessoryImageView.hidden = NO;
    }
}
#pragma  mark lazy load
-(UILabel *)title{
    if (!_title) {
        _title = [UILabel new];
        _title.font = WL_FONT(16);
        _title.textColor = WL_COLOR_TITLE;
    }
    return _title;

}
-(UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [[UIImageView alloc] init];
    }
    return _imageV;
}
-(UILabel *)subTitle{
    if (!_subTitle) {
        _subTitle = [UILabel new];
        _subTitle.font = WL_FONT(16);
        _subTitle.textColor = WL_COLOR_TITLE;
    }
    return  _subTitle;
}
-(UIImageView *)accessoryImageView{
    if (!_accessoryImageView) {
        _accessoryImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next"]];
        
    }
    return _accessoryImageView;

}
-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = WL_COLOR_LINE;
    }
    return _line;

}
@end
