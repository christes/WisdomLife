//
//  WLRegisteredViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/28.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLRegisteredViewController.h"
#import "WLLoginViewController.h"
#import "NMTabBarVC.h"
#import "NMUserInfoManager.h"
#import "WLUserInfoModel.h"
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
/** 获取验证码 */
@property (nonatomic ,strong)UILabel *getverificationCode;
@end

@implementation WLRegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setInterface];
    
    WL_WEAKSELF
    [self.getverificationCode setTapActionWithBlock:^{
        WL_STRONGSELF
        [self getCode];
    }];

}
// 获取验证码
- (void)getCode{
    if (![_account.text isValidMobileNumber]) {
        [NMHUDManager showInfoWithText:@"请输入正确的手机号" dismissDelay:kHUDDismissDelay];
    }
    
    [[NMNetworkManager defaultManager] postWithUrlString:WL_API_APPLY_GETCODE
                                            inParameters:@{@"moblNo": _account.text,
                                                           @"type": @"insert"}
                                                finished:^(NSURLResponse *response,
                                                           id responseObject,
                                                           NSError *error) {
                                                    if ([responseObject[@"status"] isEqual:@200]) {
                                                        [NMHUDManager showWithView:self.view text:@"发送成功"];
                                                         [self.getverificationCode startWithTime:59 title:@"获取验证码" countDownTitle:@"s" mainColor:[UIColor whiteColor] countColor:[UIColor lightGrayColor]];
                                                    }
                                                }];
}

// 校验验证码
- (IBAction)applyAccount:(id)sender{
    if (_VerificationCode.text.length == 0) {
        [NMHUDManager showInfoWithText:@"请输入正确的验证码" dismissDelay:kHUDDismissDelay];
    }
    [[NMNetworkManager defaultManager] postWithUrlString:WL_API_APPLY_CHECKCODE
                                            inParameters:@{@"checkCode" : _VerificationCode.text,
                                                           @"moblNo" : _account.text,
                                                           @"captchaType" : @"31411001"}
                                                finished:^(NSURLResponse *response,
                                                           id responseObject,
                                                           NSError *error) {
                                                    if ([responseObject[@"status"] isEqual:@200]) {
                                                        [self addUser];
                                                    }
                                                }];
}

// 注册
- (void)addUser{
    if (![_account.text isValidMobileNumber]) {
        [NMHUDManager showInfoWithText:@"请输入正确的手机号" dismissDelay:kHUDDismissDelay];
    } else if (_pwd.text.length < 6){
        [NMHUDManager showInfoWithText:@"请输入6位数以上的密码" dismissDelay:kHUDDismissDelay];
    }
    
    
    
    NSDictionary *prameters = @{@"moblNo" : _account.text,
                                @"passWord" : _pwd.text,
                                @"source" : @"iOS"};
    
    NSString *jsonString = [NSString jsonWithObject:prameters];
    [[NMNetworkManager defaultManager] postWithUrlString:WL_API_APPLY_ADDUSER
                                            inParameters:@{@"userInfo" : jsonString}
                                                finished:^(NSURLResponse *response,
                                                           id responseObject,
                                                           NSError *error) {
                                                    WLLog(@"%@",responseObject);
                                                    WLUserInfoModel *model = [WLUserInfoModel modelWithDictionary:responseObject[@"out"]];
                                                    [[NMUserInfoManager sharedManager] didLoginInWithUserInfo:model];
                                                    [self dismissViewControllerAnimated:NO completion:nil];
                                                    [self dismissViewControllerAnimated:NO completion:nil];
                                                }];
}

// 登录
- (IBAction)loginClick:(id)sender {
    
    [self presentViewController:[WLLoginViewController new] animated:YES completion:^{}];
}


- (IBAction)protoclAction:(UIButton *)sender {
    sender.selected = !sender.selected;
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



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
        [_VerificationCodeRightview addSubview:button];
        [_VerificationCodeRightview addSubview:self.getverificationCode];
        button.frame = CGRectMake(5, 0, 90, 31);
    }
    
    return _VerificationCodeRightview;
}

- (UILabel *)getverificationCode{
    if (!_getverificationCode) {
        _getverificationCode = [[UILabel alloc] init];
        _getverificationCode.font = WL_FONT(13);
        _getverificationCode.text = @"获取验证码";
        _getverificationCode.textAlignment = NSTextAlignmentCenter;
        _getverificationCode.textColor = [UIColor whiteColor];
        _getverificationCode.frame = CGRectMake(5, 0, 90, 31);
    }
    return _getverificationCode;
}

@end
