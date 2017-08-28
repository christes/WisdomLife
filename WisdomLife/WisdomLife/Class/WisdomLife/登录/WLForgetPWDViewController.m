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
@interface WLForgetPWDViewController ()
@property (strong, nonatomic) IBOutlet UIView *bgView;

@property (strong, nonatomic) IBOutlet UITextField *originPWD;
@property (strong, nonatomic) IBOutlet UITextField *newlyPWD;
@property (strong, nonatomic) IBOutlet UITextField *surePWD;
@property (strong, nonatomic) IBOutlet UITextField *phoneNum;

@end

@implementation WLForgetPWDViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setUpRightItemWithImageName:nil title:@"确认" selectedTitle:nil titleColor:[UIColor whiteColor] target:self action:@selector(sureButtonClick)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sureButtonClick{
    NSDictionary *parameters = @{@"moblNo" : [[NMUserInfoManager sharedManager] currentUserInfo].moblNo,
                                 @"passWord" : _originPWD.text,
                                 @"pwd" : _newlyPWD.text,
                                 @"type" : @"update"};
    NSString *jsonString = [NSString jsonWithObject:parameters];
    [[NMNetworkManager defaultManager] postWithUrlString:WL_API_APPLY_CHANGEPWD
                                            inParameters:@{@"userInfo":jsonString}
                                                finished:^(NSURLResponse *response,
                                                           id responseObject,
                                                           NSError *error) {
                                                    
                                                }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
