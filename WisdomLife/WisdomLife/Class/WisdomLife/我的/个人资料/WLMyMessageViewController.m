//
//  WLMyMessageViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/24.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLMyMessageViewController.h"
#import "WLMyMessegeModel.h"
#import "WLMyMessegeViewCell.h"

@interface WLMyMessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIButton *outLoginBtn;
@property (strong, nonatomic) IBOutlet UITableView *myMessege;
/**  */
@property (nonatomic ,strong)NSArray <WLMyMessegeModel*> *modelArray;


@end

@implementation WLMyMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row ==0) {
        self.myMessege.rowHeight = 75;
    }else{
        self.myMessege.rowHeight = 55;
    }
    WLMyMessegeViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell ==nil) {
        cell = [[WLMyMessegeViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.model = self.modelArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    


}

#pragma mark lazy load
-(NSArray<WLMyMessegeModel *> *)modelArray{
    if (!_modelArray) {
        NSArray *array = @[@{@"titleLable":@"头像",
                             @"imageName":@"head_portrait"},
                           @{@"titleLable":@"昵称",
                             @"subtitleLable":@"王晓明",
                             },
                           @{@"titleLable":@"手机号码",
                             @"subtitleLable":@"12344",
                             },
                           @{@"titleLable":@"密码",
                             @"subtitleLable":@"修改",
                             }
                           ];
        _modelArray = [WLMyMessegeModel modelArrayWithDictArray:array];
    }
    return  _modelArray;
}
@end
