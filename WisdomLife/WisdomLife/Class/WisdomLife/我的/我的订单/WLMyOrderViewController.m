//
//  WLMyOrderViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/26.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLMyOrderViewController.h"
#import "WLMyOredrViewCell.h"

@interface WLMyOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myOrder;

@end

@implementation WLMyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _myOrder.rowHeight = WL_HEIGHT(141);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLMyOredrViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[WLMyOredrViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.details.tag = indexPath.row;
    [cell.details addTarget:self action:@selector(didDetails) forControlEvents:UIControlEventTouchUpInside];
    cell.evaluation.tag = indexPath.row;
    [cell.evaluation addTarget:self action:@selector(didEvaluation:) forControlEvents:UIControlEventTouchUpInside];
    return cell;

}

- (void)didDetails{
    

}
- (void)didEvaluation:(UIButton *)btn{
    WLMyOredrViewCell *cell = [btn superview];
   NSIndexPath *indexpath = [_myOrder indexPathForCell:cell];
    cell.evaluation.titleLabel.text = @"已评价";
    cell.evaluation.titleLabel.textColor = WL_COLOR_EVALUATION;
}

@end
