//
//  WLLoginViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/23.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLLoginViewController.h"
#import "WLRegisteredViewController.h"

@interface WLLoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *account;
@property (strong, nonatomic) IBOutlet UITextField *pwd;
@property (strong, nonatomic) IBOutlet UILabel *noAccount;
@property (strong, nonatomic) IBOutlet UIButton *registered;
@property (strong, nonatomic) IBOutlet UIButton *ForgotPwd;

@end

@implementation WLLoginViewController
- (IBAction)didRegistered:(id)sender {
    [self presentViewController:[WLRegisteredViewController new] animated:YES completion:^{
        WLLog(@"sas");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setInterface];
    
}
- (void)setInterface{
     /** 设置leftview */
    [_account becomeFirstResponder];
    
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
    viewPwd.size =CGSizeMake(50, 50);
    [viewPwd addSubview:imageVPwd];
    [imageVPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(viewPwd.mas_left).offset(20);
        make.centerY.mas_equalTo(viewPwd.mas_centerY);
    }];
    viewPwd.backgroundColor = [UIColor clearColor];
    _pwd.leftView = viewPwd;
    _pwd.leftViewMode = UITextFieldViewModeAlways;
    /** 设置rightview */
    UIImageView *imageVPwdRight =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"invisible"]];
    UIView *Right = [[UIView alloc] init];
    Right.size =CGSizeMake(50, 50);
    [Right addSubview:imageVPwdRight];
    [imageVPwdRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(Right.mas_right).offset(-13);
        make.centerY.mas_equalTo(Right.mas_centerY);
    }];
    Right.backgroundColor = [UIColor clearColor];
    _pwd.rightView = Right;
    _pwd.rightViewMode = UITextFieldViewModeAlways;
    /** 设置界面字体颜色 */
    _noAccount.textColor = WL_COLOR_SUBTITLE;
    _registered.titleLabel.textColor = WL_COLOR_THEME;
    _ForgotPwd.titleLabel.textColor = WL_COLOR_THEME;
}





@end
