//
//  WLMeModfiyNameViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/9/10.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLMeModfiyNameViewController.h"

@interface WLMeModfiyNameViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userName;

@end

@implementation WLMeModfiyNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改昵称";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(sureButtonClick)];
}

- (void)sureButtonClick{
    if (_userName.text.length < 1) {
        [NMHUDManager showInfoWithText:@"请输入昵称" dismissDelay:kHUDDismissDelay];
    }
    [NMHUDManager showWithView:self.view text:kNMHUDDefaultText];
    [[NMNetworkManager defaultManager] postWithUrlString:WL_API_CENTER_MODFIYNAME
                                            inParameters:@{@"userName" : _userName.text}
                                                finished:^(NSURLResponse *response,
                                                           id responseObject,
                                                           NSError *error)
    {
        [NMHUDManager dismissWithView:self.view];
        if ([responseObject[@"status"] isEqual:@200]) {
            [NMHUDManager showSuccessWithText:@"修改成功" dismissDelay:kHUDDismissDelay];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
    
}

@end
