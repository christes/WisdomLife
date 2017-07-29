//
//  WLShoppingCartViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/24.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLShoppingCartViewController.h"
#import "WLShoppingCarViewCell.h"

@interface WLShoppingCartViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 全选按钮 */
@property (strong, nonatomic) IBOutlet UIButton *allSelect;
/** 金额 */
@property (strong, nonatomic) IBOutlet UILabel *money;
/** 金额符号 */
@property (strong, nonatomic) IBOutlet UILabel *moneySymbol;
/** 购物车tanview */
@property (strong, nonatomic) IBOutlet UITableView *shoppingCar;

@end

@implementation WLShoppingCartViewController
/** 点击全选按 */
- (IBAction)didAllSelected:(id)sender {
    _allSelect.selected = !_allSelect.selected;
//    [_allSelect setImage:[UIImage imageNamed:@"choiceshoppings"] forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _shoppingCar.rowHeight = WL_HEIGHT(150);
    _money.textColor = WL_COLOR_THEME;
    _moneySymbol.textColor = WL_COLOR_THEME;
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLShoppingCarViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell ==nil) {
        cell = [[WLShoppingCarViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
    }
    return cell;

}
- (void) didEditBtn:(UIButton *)button{
    WLLog(@"sac");


}



@end
