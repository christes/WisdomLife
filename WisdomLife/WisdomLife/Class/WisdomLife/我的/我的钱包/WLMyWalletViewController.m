//
//  WLMyWalletViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/24.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLMyWalletViewController.h"
#import "WLMyWalletViewCell.h"
#import "WLMyWalletModel.h"

@interface WLMyWalletViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myWallet;
/** 模型数组 */
@property (nonatomic ,strong)NSArray <WLMyWalletModel *> *modelArray;
@end

@implementation WLMyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _myWallet.rowHeight = WL_HEIGHT(73);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLMyWalletViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier :@"cell"];
    if (cell == nil) {
        cell = [[WLMyWalletViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        if (indexPath.row == 0) {
            cell.topLine.hidden = YES;
        }
        else if (indexPath.row ==4)
            cell.bottomLine.hidden= YES;
    }
    cell.model = self.modelArray[indexPath.row];
    if ([cell.model.money containsString:@"+" ]) {
        cell.money.textColor = WL_COLOR_MONEY;
        cell.circleImageV.image = [UIImage imageNamed:@"round_02"];
        
    }else{
        cell.money.textColor = WL_COLOR_THEME;
        cell.circleImageV.image = [UIImage imageNamed:@"round_01"];

    }
    return cell;
}
#pragma mark lazy load
-(NSArray<WLMyWalletModel *> *)modelArray{
    if (!_modelArray) {
        NSArray *array = @[@{@"date":@"06/16",
                       @"dealership":@"洗刷刷洗车行",
                             @"type":@"汽车精洗美容套餐",
                            @"money":@"-38.00"},
                           @{@"date":@"06/13",
                             @"dealership":@"平台赠送",
                             @"type":@"平台会员消费赠送通币",
                             @"money":@"+15.00"},
                           @{@"date":@"05/24",
                             @"dealership":@"洗刷刷洗车行",
                             @"type":@"汽车精洗美容套餐",
                             @"money":@"-38.00"},
                           @{@"date":@"05/13",
                             @"dealership":@"平台赠送",
                             @"type":@"平台会员积分兑换金额",
                             @"money":@"+15.00"},
                           @{@"date":@"05/24",
                             @"dealership":@"洗刷刷洗车行",
                             @"type":@"汽车精洗美容套餐",
                             @"money":@"-38.00"}
                           ];
        _modelArray = [WLMyWalletModel modelArrayWithDictArray:array];
    }
    return _modelArray;

}



@end
