//
//  WLMessageForDetailsViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/8/19.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLMessageForDetailsViewController.h"
#import "WLDetailMessageCell.h"
@interface WLMessageForDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

static NSString *dequeueCell = @"MessageDetailCell";
@implementation WLMessageForDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息详情";
    [self.tableView registerNib:[UINib nibWithNibName:@"WLDetailMessageCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:dequeueCell];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WLDetailMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:dequeueCell forIndexPath:indexPath];
    return cell;
    
}

//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//}

@end
