//
//  WLModfiyPSWViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/9/10.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLModfiyPSWViewController.h"
#import "WLUserInfoModel.h"
@interface WLModfiyPSWViewController ()
//@property (strong, nonatomic) IBOutlet UITextField *originPSW;
@property (strong, nonatomic) IBOutlet UITextField *newlyPSW;
@property (strong, nonatomic) IBOutlet UITextField *configruePSW;
@end

@implementation WLModfiyPSWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改密码";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"get_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftItemClicked)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(sureButtonClick)];

}

- (void)leftItemClicked{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)sureButtonClick{
    
    if (_phoneNum.length < 1) {
        [NMHUDManager showInfoWithText:@"请返回输入手机号" dismissDelay:kHUDDismissDelay];
    } else if (_newlyPSW.text.length < 1) {
        [NMHUDManager showInfoWithText:@"请输入新密码" dismissDelay:kHUDDismissDelay];
    } else if (_configruePSW.text.length < 1){
        [NMHUDManager showInfoWithText:@"请确认密码" dismissDelay:kHUDDismissDelay];
    }
    
    NSDictionary *parameters = @{@"moblNo" : _phoneNum,
                                 @"passWord" : _newlyPSW.text,
                                 @"pwd" : _configruePSW.text,
                                 @"type" : @"update"};
    NSString *jsonString = [NSString jsonWithObject:parameters];
    [NMHUDManager showWithText:@"加载中..."];
    [[NMNetworkManager defaultManager] postWithUrlString:WL_API_APPLY_CHANGEPWD
                                            inParameters:@{@"userInfo":jsonString}
                                                finished:^(NSURLResponse *response,
                                                           id responseObject,
                                                           NSError *error)
     {
         [NMHUDManager dismiss];
         if ([responseObject[@"status"] isEqual:@200]) {
             [NMHUDManager showSuccessWithText:@"修改成功" dismissDelay:kHUDDismissDelay];
             [[NMUserInfoManager sharedManager] currentUserInfo].pwd = _newlyPSW.text;
         }
     }];
    
    [self dismissViewControllerAnimated:YES completion:^{
        [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
    }];
}

@end
