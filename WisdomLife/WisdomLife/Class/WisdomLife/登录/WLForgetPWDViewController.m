//
//  WLForgetPWDViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/8/27.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLForgetPWDViewController.h"
#import "WLUserInfoModel.h"
#import "NMUserInfoManager.h"
#import "WLModfiyPSWViewController.h"
#import "NMNavigationVC.h"
@interface WLForgetPWDViewController ()
@property (strong, nonatomic) IBOutlet UITextField *phoneNum;
@property (strong, nonatomic) IBOutlet UITextField *code;
@property (strong, nonatomic) IBOutlet UILabel *getCode;

@end

@implementation WLForgetPWDViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"忘记密码";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"get_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftItemClicked)];
    _getCode.layerCornerRadius = 35/2;
    
    WL_WEAKSELF
    [_getCode setTapActionWithBlock:^{
        WL_STRONGSELF
        [self getVerCode];
    }];
}

- (void)leftItemClicked{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - - 校验验证码
- (IBAction)nextStep:(id)sender {
    if (![_phoneNum.text isValidMobileNumber]) {
        [NMHUDManager showInfoWithText:@"请输入正确的手机号" dismissDelay:kHUDDismissDelay];
    }
    
    if (_code.text.length < 1) {
        [NMHUDManager showInfoWithText:@"请输入验证码" dismissDelay:kHUDDismissDelay];
    }
    
    [NMHUDManager showWithView:self.view text:kNMHUDDefaultText];
    [[NMNetworkManager defaultManager] postWithUrlString:WL_API_APPLY_CHECKCODE
                                            inParameters:@{@"checkCode" : _code.text,
                                                           @"moblNo" : _phoneNum.text,
                                                           @"captchaType" : @"31411002"}
                                                finished:^(NSURLResponse *response,
                                                           id responseObject,
                                                           NSError *error)
    {
        [NMHUDManager dismissWithView:self.view];
        if ([responseObject[@"status"] isEqual:@200]) {
            WLModfiyPSWViewController *modfiyPSW = [WLModfiyPSWViewController new];
            modfiyPSW.phoneNum = _phoneNum.text;
            [self presentViewController:[[NMNavigationVC new] initWithRootViewController:modfiyPSW] animated:YES completion:nil];
        }
    }];
    
}


#pragma mark - - 获取验证码

- (void)getVerCode{
    if (![_phoneNum.text isValidMobileNumber]) {
        [NMHUDManager showInfoWithText:@"请输入正确的手机号" dismissDelay:kHUDDismissDelay];
    }
    [NMHUDManager showWithView:self.view text:kNMHUDDefaultText];
    [[NMNetworkManager defaultManager] postWithUrlString:WL_API_APPLY_GETCODE
                                            inParameters:@{@"moblNo": _phoneNum.text,
                                                           @"type": @"update"}
                                                finished:^(NSURLResponse *response,
                                                           id responseObject,
                                                           NSError *error)
    {
        [NMHUDManager dismissWithView:self.view];
        if ([responseObject[@"status"] isEqual:@200]) {
            [NMHUDManager showSuccessWithText:@"获取成功，已发送至您的手机" dismissDelay:kHUDDismissDelay];
            [self.getCode startWithTime:59 title:@"获取验证码" countDownTitle:@"s" mainColor:[UIColor whiteColor] countColor:[UIColor lightGrayColor]];
        }
    }];

}


@end
