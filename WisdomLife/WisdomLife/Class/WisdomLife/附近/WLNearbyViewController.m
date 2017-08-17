//
//  WLearbyViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/22.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLNearbyViewController.h"

@interface WLNearbyViewController ()

@end

@implementation WLNearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 设置导航栏 */
    [self setTitleView];
}

/** 设置导航栏 */
- (void) setTitleView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WL_SCREEN_W - WL_WIDTH(150) , 27)];
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_box"]];
    imageV.frame = CGRectMake(0, 0, WL_SCREEN_W - WL_WIDTH(150) , 27);
    UIImageView *imageV2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchhome"]];
    imageV2.x = WL_WIDTH(10);
    imageV2.centerY = view.centerY;
    UILabel *label = [[UILabel alloc] init];
    label.text = @"搜附近的美食";
    label.font = WL_FONT(14);
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(WL_WIDTH(35), 3, WL_WIDTH(100), WL_HEIGHT(40));
    label.centerY = view.centerY;
    [view addSubview:imageV];
    [view addSubview:imageV2];
    [view addSubview:label];
    self.navigationItem.titleView = view;
    UIImageView *imageLeft = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"locationhome"]];
    UILabel *labelLeft = [UILabel new];
    labelLeft.text = @"益州大道";
    labelLeft.font = WL_FONT(14);
    labelLeft.frame = CGRectMake(0, 0, WL_WIDTH(60), WL_WIDTH(30));
    labelLeft.textColor = [UIColor whiteColor];
    UIImageView *imageLeft2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page_downnearby"]];
    UIBarButtonItem *barImage = [[UIBarButtonItem alloc] initWithCustomView:imageLeft];
    UIBarButtonItem *barLabel = [[UIBarButtonItem alloc] initWithCustomView:labelLeft];
    UIBarButtonItem *barImage2 =  [[UIBarButtonItem alloc] initWithCustomView:imageLeft2];
    self.navigationItem.leftBarButtonItems = @[barImage,barLabel,barImage2];
}

@end
