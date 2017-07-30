//
//  WLRegisteredViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/28.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLRegisteredViewController.h"
#import "WLLoginViewController.h"
@interface WLRegisteredViewController ()
@property (strong, nonatomic) IBOutlet UITextField *account;
@property (strong, nonatomic) IBOutlet UITextField *VerificationCode;
@property (strong, nonatomic) IBOutlet UILabel *haveAccount;
@property (strong, nonatomic) IBOutlet UITextField *pwd;
@property (strong, nonatomic) IBOutlet UIButton *registered;
@property (strong, nonatomic) IBOutlet UILabel *readAngAgree;
@property (strong, nonatomic) IBOutlet UIButton *login;
/** 帐号的左边视图 */
@property (nonatomic ,strong)UIView *accountLeftview;
/** 验证码的左边视图 */
@property (nonatomic ,strong)UIView *VerificationCodeLeftview;
/** 验证码的右边视图 */
@property (nonatomic ,strong)UIView *VerificationCodeRightview;
/** 密码的左边视图 */
@property (nonatomic ,strong)UIView *pwdLeftciew;

@end

@implementation WLRegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setInterface];
  
    [_account becomeFirstResponder];
}
- (IBAction)didLogin:(id)sender {
    [self presentViewController:[WLLoginViewController new] animated:YES completion:^{
        
    }];
}

- (void)setInterface{
    /** 设置leftview */
    _account.leftView = self.accountLeftview;
    _account.leftViewMode = UITextFieldViewModeAlways;
    
    _pwd.leftView = self.pwdLeftciew;
    _pwd.leftViewMode = UITextFieldViewModeAlways;
    
    _VerificationCode.leftView = self.VerificationCodeLeftview;
    _VerificationCode.leftViewMode = UITextFieldViewModeAlways;
    /** 设置rightview */
    _VerificationCode.rightView = self.VerificationCodeRightview;
    _VerificationCode.rightViewMode = UITextFieldViewModeAlways;
    /** 设置界面字体颜色 */
    _haveAccount.textColor = WL_COLOR_SUBTITLE;
    _login.titleLabel.textColor = WL_COLOR_THEME;
    _readAngAgree.textColor = WL_COLOR_SUBTITLE;
}
#pragma mark lazy load
-(UIView *)accountLeftview{
    if (!_accountLeftview) {
        _accountLeftview =  [[UIView alloc] init];
        _accountLeftview.size =CGSizeMake(50, 50);
        UIImageView *imageV =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mobile_phonelogin"]];
        imageV.center = _accountLeftview.center;
        [_accountLeftview addSubview:imageV];
    }
    return _accountLeftview;

}
-(UIView *)pwdLeftciew{
    if (!_pwdLeftciew) {
        
        _pwdLeftciew = [[UIView alloc] init];
        _pwdLeftciew.size =CGSizeMake(50, 50);
        UIImageView *imageVPwd =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password"]];
        imageVPwd.center = _pwdLeftciew.center;
        [_pwdLeftciew addSubview:imageVPwd];
    }
    return _pwdLeftciew;
}
-(UIView *)VerificationCodeLeftview{
    if (!_VerificationCodeLeftview) {
        _VerificationCodeLeftview = [[UIView alloc] init];
        _VerificationCodeLeftview.size =CGSizeMake(50, 50);
        UIImageView *imageVVerification =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"verification_code"]];
        imageVVerification.center = _VerificationCodeLeftview.center;
        [_VerificationCodeLeftview addSubview:imageVVerification];
    }
    return _VerificationCodeLeftview;
}
-(UIView *)VerificationCodeRightview{
    if (!_VerificationCodeRightview) {
        _VerificationCodeRightview = [UIView new];
        _VerificationCodeRightview.size = CGSizeMake(100, 31);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"button_small"] forState:UIControlStateNormal];
        [button setTitle:@"获取验证码" forState:UIControlStateNormal];
        button.titleLabel.font = WL_FONT(15);
        [_VerificationCodeRightview addSubview:button];
        button.frame = CGRectMake(5, 0, 90, 31);
        WLLog(@"%@,%@",NSStringFromCGPoint(_VerificationCodeRightview.center),NSStringFromCGPoint(button.center));
    }
    
    return _VerificationCodeRightview;
}

@end
