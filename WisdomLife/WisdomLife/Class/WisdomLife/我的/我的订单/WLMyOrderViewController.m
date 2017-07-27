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
    return cell;

}



@end
