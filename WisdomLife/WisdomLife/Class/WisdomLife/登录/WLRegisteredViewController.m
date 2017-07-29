//
//  WLRegisteredViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/28.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLRegisteredViewController.h"

@interface WLRegisteredViewController ()
@property (strong, nonatomic) IBOutlet UITextField *account;
@property (strong, nonatomic) IBOutlet UITextField *VerificationCode;
@property (strong, nonatomic) IBOutlet UILabel *haveAccount;
@property (strong, nonatomic) IBOutlet UITextField *pwd;
@property (strong, nonatomic) IBOutlet UIButton *registered;
@property (strong, nonatomic) IBOutlet UILabel *readAngAgree;
@property (strong, nonatomic) IBOutlet UIButton *login;

@end

@implementation WLRegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)setInterface{
    /** 设置leftview */
    UIImageView *imageV =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mobile_phonelogin"]];
    UIView *view = [[UIView alloc] init];
    view.size =CGSizeMake(50, 50);
    [view addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left).offset(20);
        make.centerY.mas_equalTo(view.mas_centerY);
    }];
    view.backgroundColor = [UIColor clearColor];
    _account.leftView = view;
    _account.leftViewMode = UITextFieldViewModeAlways;
    /** 设置leftview */
    UIImageView *imageVPwd =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password"]];
    UIView *viewPwd = [[UIView alloc] init];
    view.size =CGSizeMake(50, 50);
    [viewPwd addSubview:imageVPwd];
    [imageVPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(viewPwd.mas_left).offset(20);
        make.centerY.mas_equalTo(viewPwd.mas_centerY);
    }];
    viewPwd.backgroundColor = [UIColor clearColor];
    _pwd.leftView = viewPwd;
    _pwd.leftViewMode = UITextFieldViewModeAlways;
    /** 设置rightview */
    UIImageView *imageVVerification =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"invisible"]];
    UIView *Verification = [[UIView alloc] init];
    Verification.size =CGSizeMake(50, 50);
    [Verification addSubview:imageVVerification];
    [imageVVerification mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(Verification.mas_right).offset(-13);
        make.centerY.mas_equalTo(Verification.mas_centerY);
    }];
    Verification.backgroundColor = [UIColor clearColor];
    _pwd.leftView = Verification;
    _pwd.leftViewMode = UITextFieldViewModeAlways;
    /** 设置界面字体颜色 */
    _haveAccount.textColor = WL_COLOR_SUBTITLE;
    _login.titleLabel.textColor = WL_COLOR_THEME;
    _readAngAgree.textColor = WL_COLOR_SUBTITLE;
}


@end
