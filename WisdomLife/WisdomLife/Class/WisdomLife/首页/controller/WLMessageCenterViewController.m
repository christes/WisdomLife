//
//  WLMessageCenterViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/8/4.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLMessageCenterViewController.h"
#import "WLMessageCenterModel.h"
#import "WLMessageCenterCell.h"

@interface WLMessageCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *messageCenter;
/**  */
@property (nonatomic ,strong)NSArray<WLMessageCenterModel*> *modelArray;

@end

@implementation WLMessageCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =@"消息中心";
    _messageCenter.rowHeight = WL_HEIGHT(75);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLMessageCenterCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[WLMessageCenterCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.model = self.modelArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

}

#pragma mark lazy load
-(NSArray<WLMessageCenterModel *> *)modelArray{
    if (!_modelArray) {
        NSArray *array = @[@{@"iconImageName":@"inform",
                               @"messageType":@"通知消息",
                            @"messageContent":@"消息内容爱女集卡女举健康啊女能看见今晚开始",
                                      @"date":@"2015-02-9",
                                      @"time":@"10:30"
                             },
                           @{@"iconImageName":@"set_up",
                               @"messageType":@"系统消息",
                            @"messageContent":@"消息内容爱女集卡女举健康啊女能看见今晚开始",
                                      @"date":@"2015-02-9",
                                      @"time":@"10:30"
                             }
                           ];
        _modelArray = [WLMessageCenterModel modelArrayWithDictArray:array];
    }
    return _modelArray;

}

@end
