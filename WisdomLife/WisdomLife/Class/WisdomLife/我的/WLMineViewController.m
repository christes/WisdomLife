//
//  WLMineViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/23.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLMineViewController.h"
#import "WLMineCellModel.h"
#import "WLMineViewCell.h"
#import "WLMyMessageViewController.h"
#import "WLMyWalletViewController.h"
#import "WLShoppingCartViewController.h"
#import "WLMyOrderViewController.h"
#import "WLCardController.h"
@interface WLMineViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mine;
@property (weak, nonatomic) IBOutlet UILabel *phoneNum;

@property (weak, nonatomic) IBOutlet UIImageView *edit;
/** 数组模型 */
@property (nonatomic ,strong)NSArray <WLMineCellModel *> *modelArray;
/** 跳转控制器数组 */
@property (nonatomic ,strong)NSArray *controllerArray;
@end

@implementation WLMineViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mine.rowHeight = WL_HEIGHT(60);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLMineViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[WLMineViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.model = self.modelArray[indexPath.row];
    return  cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        UIViewController *VC = (UIViewController *)[NSClassFromString(self.controllerArray[indexPath.row]) new];
    if (indexPath.row == 2) {
        
        VC.title = @"我的卡包";
    }else{
        VC.title = self.modelArray[indexPath.row].title;
    }
    
    VC.hidesBottomBarWhenPushed = YES;
      [self.navigationController pushViewController:VC animated:YES];
//    if (indexPath.row ==0) {
//    WLMyMessageViewController *myMessage = [[WLMyMessageViewController alloc] init];
//    myMessage.title = self.modelArray[indexPath.row].title;
//    [self.navigationController pushViewController:myMessage animated:YES];
//    }
//    else if (indexPath.row ==1){
//        WLMyWalletViewController *myWallet = [[WLMyWalletViewController alloc] init];
//        myWallet.title = self.modelArray[indexPath.row].title;
//        [self.navigationController pushViewController:myWallet animated:YES];
//    }
//    else if (indexPath.row ==2){
//        WLCardController *card = [[WLCardController alloc] init];
//        card.title = self.modelArray[indexPath.row].title;
//        [self.navigationController pushViewController:card animated:YES];
//    }
//    else if (indexPath.row ==3){
//        WLMyOrderViewController *myOrder = [[WLMyOrderViewController alloc] init];
//        myOrder.title = self.modelArray[indexPath.row].title;
//        [self.navigationController pushViewController:myOrder animated:YES];
//    }
//    else  {
//        WLShoppingCartViewController *shopping = [[WLShoppingCartViewController alloc] init];
//        shopping.title = self.modelArray[indexPath.row].title;
//        [self.navigationController pushViewController:shopping animated:YES];
//    }
}
//- (void)pushToViewcontroller:(UIViewController *)controller didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    controller.title = self.modelArray[indexPath.row].title;
//    [self.navigationController pushViewController:controller animated:YES];
//}

#pragma mark - - lazy load

- (NSArray<WLMineCellModel *> *)modelArray{
    if (!_modelArray) {
        
        NSArray *array = @[@{@"iconImageName" : @"mine_ipersonal_data",
                         @"title" : @"个人资料"},
                       @{@"iconImageName" : @"mine_iwallet",
                         @"title" : @"我的钱包"},
                       @{@"iconImageName" : @"mine_icoupon",
                         @"title" : @"卡包"},
                       @{@"iconImageName" : @"mine_iindent",
                         @"title" : @"我的订单"},
                       @{@"iconImageName" : @"mine_ishopping_cart",
                         @"title" : @"购物车"}];
        _modelArray = [WLMineCellModel modelArrayWithDictArray:array];
    }
    return _modelArray;
}
-(NSArray *)controllerArray{
    if (!_controllerArray) {
        _controllerArray = @[@"WLMyMessageViewController",
                             @"WLMyWalletViewController",
                             @"WLCardController",
                             @"WLMyOrderViewController",
                             @"WLShoppingCartViewController"];
    }
    return _controllerArray;

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
