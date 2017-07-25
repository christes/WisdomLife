//
//  WLCardController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/25.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLCardController.h"
#import "WLCardCell.h"

@interface WLCardController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *cardTabview;

@end

@implementation WLCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cardTabview.rowHeight = WL_HEIGHT(103);
    // Do any additional setup after loading the view from its nib.
//    _cardTabview.sectionHeaderHeight = 0;

}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//
//    return 5;
//
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 4;

}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    if (section ==0) {
//        return 0.1;
//    }else{
//        return 0.1
//        ;
//    }
//
////}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section:(NSInteger)section{
//    return 0.1;
//
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLCardCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    
    
    if (cell == nil) {
        cell = [[WLCardCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
    }
    
    return  cell;

}

@end
