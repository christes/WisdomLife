//
//  WLLoginViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/23.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLLoginViewController.h"
#import "WLRegisteredViewController.h"
#import "WLForgetPWDViewController.h"
#import "NMNavigationVC.h"
#import "NMTabBarVC.h"
#import "NMFileCacheManager.h"
#import "WLUserInfoModel.h"
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

- (void)loginButtonClickedCallBack{
//    if (_phoneNumer.length != 11) {
//        [xxx  showMessage:@"请输入正确手机号"];
//    }
//    
//    [netWorkManger postRequestURL:loginURL xxxx  filinish{
//        [xxx  showMessage:@"登录成功"];
//    } fail{
//        [xxx  showMessage:@"登录失败"];
//    }]
}

- (IBAction)forgetPassWord:(id)sender {
    [self presentViewController:[[NMNavigationVC new]initWithRootViewController:[WLForgetPWDViewController new]] animated:YES completion:nil];
}

- (IBAction)loginClick:(id)sender {
    if (![_account.text isValidMobileNumber] || _pwd.text.length < 5) {
        [NMHUDManager showInfoWithText:@"请输入正确的手机号和密码" dismissDelay:kHUDDismissDelay];
    }
    [NMHUDManager showWithView:self.view text:kNMHUDDefaultText];
    [[NMNetworkManager defaultManager] postWithUrlString:WL_API_APPLY_Login
                                            inParameters:@{@"moblNo" : _account.text,
                                                           @"password" : _pwd.text}
                                                finished:^(NSURLResponse *response,
                                                           id responseObject,
                                                           NSError *error)
    {
        [NMHUDManager dismissWithView:self.view];
        if ([responseObject[@"status"] isEqual:@200]) {
            [NMHUDManager showSuccessWithText:@"登录成功" dismissDelay:kHUDDismissDelay];
            WLUserInfoModel *model = [WLUserInfoModel modelWithDictionary:responseObject[@"out"][@"value"]];
            model.pwd = _pwd.text;
            [[NMUserInfoManager sharedManager] didLoginInWithUserInfo:model];
            
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject[@"out"][@"value"] options:0 error:nil];
            NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            [NMUserInfoManager sharedManager].userJson = jsonString;
            
            [UIApplication sharedApplication].keyWindow.rootViewController = [NMTabBarVC new];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


@end
