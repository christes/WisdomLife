//
//  WLMineViewCell.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/23.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLMineViewCell.h"
#import "WLMineCellModel.h"
@interface WLMineViewCell ()
/** 图标 */
@property (nonatomic ,strong)UIImageView *iconImageView;
/** 标题 */
@property (nonatomic ,strong)UILabel *titleLabel;
/** 辅助视图 */
@property (nonatomic ,strong)UIImageView *accessoryImageView;
/** 分割线 */
@property (nonatomic ,strong)UIView *lineView;
@end


static const CGFloat leftMargin = 15;
@implementation WLMineViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpSubviews];
        [self setUpLayouts];
    }
    return self;
}


/**
 设置子视图
 */
- (void)setUpSubviews{
    [self addSubview:self.iconImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.accessoryImageView];
    [self addSubview:self.lineView];
}


/**
 设置约束
 */
- (void)setUpLayouts{
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftMargin);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImageView.mas_right).offset(WL_WIDTH(18));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [_accessoryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(WL_WIDTH(-15));
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(WL_WIDTH(7));
        make.right.mas_equalTo(WL_WIDTH(-7));
        make.height.mas_equalTo(0.5);
        make.bottom.mas_equalTo(0);
    }];
}

#pragma mark - - set

- (void)setModel:(WLMineCellModel *)model{
    _model = model;
    _iconImageView.image = [UIImage imageNamed:_model.iconImageName];
    _titleLabel.text = _model.title;
}


#pragma mark - - lazy load

- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = WL_FONT(16);
        _titleLabel.textColor = WL_COLOR_TITLE;
    }
    return _titleLabel;
}

- (UIImageView *)accessoryImageView{
    if (!_accessoryImageView) {
        _accessoryImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_inext"]];
    }
    return _accessoryImageView;
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = WL_COLOR_LINE;
    }
    return _lineView;
}

@end
