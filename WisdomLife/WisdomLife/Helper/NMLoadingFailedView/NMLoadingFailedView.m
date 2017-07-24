//
//  NMLoadingFailedView.m
//  NMWalletAPP
//
//  Created by boundlessocean on 2017/3/9.
//  Copyright © 2017年 coffee. All rights reserved.
//

#import "NMLoadingFailedView.h"
@interface NMLoadingFailedView()
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *leftLabel;
@property (nonatomic, strong)UILabel *rightLabel;
@property (nonatomic, strong)UILabel *descriptLabel;
@property (nonatomic, strong)UILabel *moreDescriptLabel;
@property (nonatomic, strong)UIButton *sureButton;

@end

@implementation NMLoadingFailedView

- (instancetype)init{
    if (self = [super init]) {
        [self initSubviews];
        [self initLayout];
        self.backgroundColor = WL_COLOR_BACKG;
        
        WL_WEAKSELF
        [_sureButton bl_handleWithBlock:^(id sender) {
            WL_STRONGSELF
            !self.actionBlock ? : self.actionBlock();
        } controlEvent:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)initSubviews{
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.leftLabel];
    [self addSubview:self.rightLabel];
    [self addSubview:self.descriptLabel];
    [self addSubview:self.sureButton];
    [self addSubview:self.moreDescriptLabel];
}

- (void)initLayout{
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(WL_HEIGHT(90));
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(_imageView.mas_bottom).offset(WL_HEIGHT(25));
    }];
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_rightLabel.mas_left);
        make.centerY.mas_equalTo(_rightLabel.mas_centerY);
    }];
    [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).offset(WL_WIDTH(18));
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(WL_HEIGHT(25));
        make.size.mas_equalTo(CGSizeMake(WL_WIDTH(220), WL_HEIGHT(30)));
    }];
    [_descriptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(WL_HEIGHT(25));
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    [_moreDescriptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_rightLabel.mas_bottom).offset(WL_HEIGHT(25));
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_rightLabel.mas_bottom).offset(WL_HEIGHT(25));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(WL_SCREEN_W - 30, WL_HEIGHT(40)));
    }];
    
}

#pragma mark - - set

- (void)setType:(NMNoDataViewType)type{
    _type = type;
    switch (type) {
        case NMNoDataViewTypeRefresh:
            [self setRefreshData];
            break;
        case NMNoDataViewTypeAuditing:
            [self setAuditingData];
            break;
        case NMNoDataViewTypeAuditingFailure:
            [self setAuditingFailureData];
            break;
        case NMNoDataViewTypeAuditingServiceException:
            [self setAuditingServiceExceptionData];
            break;
        case NMNoDataViewTypeCanNotRepayment:
            [self setCanNotRepaymentData];
        default:
            break;
    }
}

- (void)setRefreshData{
    _imageView.image =[UIImage imageNamed:@"refresh"];
    _titleLabel.text = @"页面加载失败，点击屏幕刷新";
    _titleLabel.textColor = WL_COLOR_PLACEHOLDER;
    _descriptLabel.hidden = YES;
    
    [self updateImageViewConstraints];
    
    WL_WEAKSELF
    if (_type == NMNoDataViewTypeRefresh) {
        [self setTapActionWithBlock:^{
            WL_STRONGSELF
            !self.actionBlock ? : self.actionBlock();
        }];
    }
}

- (void)setAuditingData{
    _imageView.image = [UIImage imageNamed:@"audit"];
    _titleLabel.text = @"你的申请正在审核中...";
    _descriptLabel.text = @"我们将在5分钟内返回审核结果，请耐心等待";
}

- (void)setAuditingFailureData{
    _imageView.image = [UIImage imageNamed:@"information"];
    _titleLabel.text = @"你的审核未通过";
    _leftLabel.text = @"原因：";
    _rightLabel.text = @"   信息有误";
    _moreDescriptLabel.text = @"短期内申请无效，请在1个月后再次申请。";
    _leftLabel.hidden = NO;
    _rightLabel.hidden = NO;
    _descriptLabel.hidden = YES;
    _moreDescriptLabel.hidden = NO;
}

- (void)setAuditingServiceExceptionData{
    _imageView.image = [UIImage imageNamed:@"servers"];
    _titleLabel.text = @"你的审核未通过";
    _leftLabel.text = @"原因：";
    _rightLabel.text = @"   系统开小差了";
    [_sureButton setTitle:@"重新认证" forState:UIControlStateNormal];
    _leftLabel.hidden = NO;
    _rightLabel.hidden = NO;
    _descriptLabel.hidden = YES;
    _sureButton.hidden = NO;
}

- (void)setCanNotRepaymentData{
    _imageView.image = [UIImage imageNamed:@"payment-noRecord"];
    _titleLabel.text = @"暂无还款金额";
    _titleLabel.textColor = WL_COLOR_SUBTITLE;
    [self updateImageViewConstraints];
}

- (void)updateImageViewConstraints{
    [_imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(WL_HEIGHT(150));
    }];
}

#pragma mark - - lazy load

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = WL_FONT(15);
        _titleLabel.textColor = WL_COLOR_TITLE;
    }
    return _titleLabel;
}

- (UILabel *)leftLabel{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.textColor = WL_COLOR_TITLE;
        _leftLabel.font = WL_FONT(15);
        _leftLabel.hidden = YES;
    }
    return _leftLabel;
}


- (UILabel *)rightLabel{
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.textColor = WL_COLOR_THEME;
        _rightLabel.backgroundColor = WL_HEXCOLOR(0xfdf4f3);
        _rightLabel.layerCornerRadius = WL_HEIGHT(9);
        _rightLabel.font = WL_FONT(15);
        _rightLabel.hidden = YES;
    }
    return _rightLabel;
}


- (UILabel *)descriptLabel{
    if (!_descriptLabel) {
        _descriptLabel = [[UILabel alloc] init];
        _descriptLabel.textColor = WL_COLOR_PLACEHOLDER;
        _descriptLabel.font = WL_FONT(15);
    }
    return _descriptLabel;
}

- (UIButton *)sureButton{
    if (!_sureButton) {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureButton.backgroundColor = WL_COLOR_THEME;
        _sureButton.layerCornerRadius = WL_HEIGHT(20);
        _sureButton.titleLabel.font = WL_FONT(18);
        [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _sureButton.hidden = YES;
    }
    return _sureButton;
}

- (UILabel *)moreDescriptLabel{
    if (!_moreDescriptLabel) {
        _moreDescriptLabel = [[UILabel alloc] init];
        _moreDescriptLabel.textColor = WL_COLOR_TITLE;
        _moreDescriptLabel.font = WL_FONT(15);
        _moreDescriptLabel.hidden = YES;
    }
    return _moreDescriptLabel;
}

@end
