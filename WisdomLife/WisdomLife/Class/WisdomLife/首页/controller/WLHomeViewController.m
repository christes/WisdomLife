//
//  WLHomeViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/22.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLHomeViewController.h"
#import "WLPageView.h"
#import "WLBigView.h"
#import "WLBigModel.h"
#import "WLShowView.h"
#import "WLMessageCenterViewController.h"

@interface WLHomeViewController ()
/**  */
@property (nonatomic ,strong)UIImageView *backgroungImageV;
/** 模型数组 */
@property (nonatomic ,strong)NSArray<WLBigModel*> *modelArray;



@end

@implementation WLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setPageview];
    [self.view addSubview:self.backgroungImageV];
    [self setTitleView];
    [self setBigImageV];
    WLShowView *showView = [[WLShowView alloc] init];
    showView.frame = CGRectMake(WL_WIDTH(10), WL_HEIGHT(255), WL_SCREEN_W - WL_WIDTH(20) , WL_HEIGHT(197.5));
    [self.view addSubview:showView];
    
    [self addBtn];
    [self addConnectImage];
 
}
#pragma mark lazy load
-(NSArray<WLBigModel *> *)modelArray{
    if (!_modelArray) {
        NSArray *array = @[@{@"imageName":@"icon_01",
                             @"labelName":@"美食"},
                           @{@"imageName":@"icon_02",
                             @"labelName":@"丽人"},
                           @{@"imageName":@"icon_03",
                             @"labelName":@"生活服务"},
                           @{@"imageName":@"icon_04",
                             @"labelName":@"快递"}
                           ];
        _modelArray = [WLBigModel modelArrayWithDictArray:array];
    }
    return _modelArray;
}
-(UIImageView *)backgroungImageV{
    if (!_backgroungImageV) {
        _backgroungImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baseboard_01home"]];
        _backgroungImageV.frame = CGRectMake(WL_WIDTH(0), WL_HEIGHT(160), WL_SCREEN_W, WL_HEIGHT(85.5));
    }
    return _backgroungImageV;
}

/** 添加bigview */
- (void)setBigImageV{
    CGFloat width = 60;
    CGFloat space = (WL_SCREEN_W - 27*2 - 4*width)/3;
    CGFloat heightBackgroundImageV = _backgroungImageV.height;
    CGFloat height = 80;
    for (int i = 0; i<self.modelArray.count; i++) {
        WLBigView *big = [[WLBigView alloc] init];
        big.frame = CGRectMake(i*(space+width)+27, WL_HEIGHT(heightBackgroundImageV - height), WL_WIDTH(width), WL_HEIGHT(height));
        [self.backgroungImageV addSubview:big];
        big.model = self.modelArray[i];
    }
    

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
    label.text = @"搜索";
    label.font = WL_FONT(14);
    label.textColor = [UIColor whiteColor];
//    label.origin = CGPointMake(30, 0);
    label.frame = CGRectMake(WL_WIDTH(35), 3, WL_WIDTH(50), WL_HEIGHT(40));
    label.centerY = view.centerY;
    [view addSubview:imageV];
    [view addSubview:imageV2];
    [view addSubview:label];
    self.navigationItem.titleView = view;
    UIImage *image = [UIImage imageNamed:@"informationhome"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(didInformaion)];
    UIImageView *imageLeft = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"locationhome"]];
    UILabel *labelLeft = [UILabel new];
    labelLeft.text = @"绵阳";
    labelLeft.font = WL_FONT(14);
    labelLeft.frame = CGRectMake(0, 0, WL_WIDTH(30), WL_WIDTH(30));
    labelLeft.textColor = [UIColor whiteColor];
    UIBarButtonItem *barImage = [[UIBarButtonItem alloc] initWithCustomView:imageLeft];
    UIBarButtonItem *barLabel = [[UIBarButtonItem alloc] initWithCustomView:labelLeft];
    
    self.navigationItem.leftBarButtonItems = @[barImage,barLabel];

}
- (void)didInformaion{
    [self.navigationController pushViewController:[[WLMessageCenterViewController alloc] init] animated:YES];

}

/** 设置pageview */
- (void)setPageview{
    WLPageView *pageView = [WLPageView pageView];
    pageView.imageNames = @[@"banner1",@"banner1",@"banner1",@"banner1"];
    pageView.currentColor = [UIColor grayColor];
    pageView.otherColor = [UIColor whiteColor];
    [self.view addSubview:pageView];
    [pageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
        make.height.mas_equalTo(WL_HEIGHT(252));
    }];
}


- (void)addBtn{
    UIButton *scan = [UIButton buttonWithType:UIButtonTypeCustom];
    [scan setImage:[UIImage imageNamed:@"riich_scan"] forState:UIControlStateNormal];
    scan.frame = CGRectMake(WL_WIDTH(27), WL_HEIGHT(450), WL_WIDTH(160), WL_HEIGHT(100));
    [self.view addSubview:scan];
//    [scan mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view).offset(WL_WIDTH(27));
//        make.bottom.mas_equalTo(self.view).offset(WL_HEIGHT(-10));
//        make.width.mas_equalTo(WL_WIDTH(160));
//        make.height.mas_equalTo(WL_HEIGHT(100));
//    }];
    UIButton *payment = [UIButton buttonWithType:UIButtonTypeCustom];
    [payment setImage:[UIImage imageNamed:@"payment_code"] forState:UIControlStateNormal];
    payment.frame = CGRectMake(WL_WIDTH(200), WL_HEIGHT(450), WL_WIDTH(160), WL_HEIGHT(100));
    [self.view addSubview:payment];
//    [payment mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(scan.mas_right).offset(WL_WIDTH(45));
//        make.bottom.mas_equalTo(self).offset(WL_HEIGHT(-10));
//        make.width.mas_equalTo(WL_WIDTH(160));
//        make.height.mas_equalTo(WL_HEIGHT(100));
//    }];

}
/** 添加联系图片 */
- (void)addConnectImage{
    UIImageView *ConnectImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"connect"]];
    ConnectImageV.frame = CGRectMake(WL_WIDTH(88), WL_HEIGHT(230), WL_WIDTH(197.5), WL_HEIGHT(47.5));
    [self.view addSubview:ConnectImageV];
}


@end
