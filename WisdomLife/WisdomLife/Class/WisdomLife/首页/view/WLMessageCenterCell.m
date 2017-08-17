//
//  WLMessageCenterCell.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/8/4.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLMessageCenterCell.h"
#import "WLMessageCenterModel.h"
@interface WLMessageCenterCell ()
/** 图片 */
@property (nonatomic ,strong)UIImageView *iconImageView;
/** 消息类型  */
@property (nonatomic ,strong)UILabel *messageType;
/** 消息内容 */
@property (nonatomic ,strong)UILabel *messageContent;
/** 日期 */
@property (nonatomic ,strong)UILabel *date;
/** 时间 */
@property (nonatomic ,strong)UILabel *time;
/** 辅助视图 */
@property (nonatomic ,strong)UIImageView *accessoryImageView;
/** 分割线 */
@property (nonatomic ,strong)UIView *line;
@end


@implementation WLMessageCenterCell
/** 初始化 */

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSubviews];
        [self layout];
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baseboardmessage"]];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
/** 设置模型 */
-(void)setModel:(WLMessageCenterModel *)model{
    _model = model;
    _iconImageView.image = [UIImage imageNamed:model.iconImageName];
    _messageType.text = model.messageType;
    _messageContent.text = model.messageContent;
    _date.text = model.date;
    _time.text = model.time;
}
/** 添加子视图 */
- (void)setSubviews{
    [self addSubview:self.iconImageView];
     [self addSubview:self.messageContent];
     [self addSubview:self.messageType];
     [self addSubview:self.date];
     [self addSubview:self.time];
     [self addSubview:self.line];
     [self addSubview:self.accessoryImageView];
}
/** 设置约束 */
- (void)layout{
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(WL_WIDTH(10));
//        make.top.mas_equalTo(self).offset(WL_HEIGHT(11));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    [_messageContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImageView.mas_right).offset(WL_WIDTH(10));
          make.top.mas_equalTo(_messageType.mas_bottom).offset(WL_HEIGHT(5));
        make.right.mas_equalTo(self).offset(WL_WIDTH(-25));
    }];

    [_messageType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImageView.mas_right).offset(WL_WIDTH(10));
        make.top.mas_equalTo(self).offset(WL_HEIGHT(11));
    }];

    [_date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImageView.mas_right).offset(WL_WIDTH(10));
        make.top.mas_equalTo(_messageContent.mas_bottom).offset(WL_HEIGHT(7));
    }];

    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_date.mas_right).offset(WL_WIDTH(15));
        make.top.mas_equalTo(_messageContent.mas_bottom).offset(WL_HEIGHT(7));
    }];

    [_accessoryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(WL_WIDTH(-10));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];

    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(WL_HEIGHT(0.5));
    }];

}



#pragma mark lazy load
-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}
-(UILabel *)messageType{
    if (!_messageType) {
        _messageType = [UILabel new];
        _messageType.font = WL_FONT(15);
        _messageType.textColor = WL_COLOR_TITLE;
    }
    return  _messageType;
}
-(UILabel *)messageContent{
    if (!_messageContent) {
        _messageContent = [UILabel new];
        _messageContent.font = WL_FONT(13);
        _messageContent.textColor = WL_COLOR_SUBTITLE;
    }
    return  _messageContent;

}
-(UILabel *)date{
    if (!_date) {
        _date = [UILabel new];
        _date.font = WL_FONT(11);
        _date.textColor = WL_COLOR_SUBTITLE;
    }
    return _date;
}
-(UILabel *)time{
    if (!_time) {
        _time = [UILabel new];
        _time.font = WL_FONT(11);
        _time.textColor = WL_COLOR_SUBTITLE;
    }
    return _time;
}
-(UIImageView *)accessoryImageView{
    if (!_accessoryImageView) {
        _accessoryImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nextmessage"]];
    }
    return _accessoryImageView;
}
-(UIView *)line{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = WL_COLOR_LINE;
    }
    return _line;
}

@end
