//
//  WLLifeViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/22.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLLifeViewController.h"
#import "WLLifeCollectionViewCell.h"
#import "WLLifeCollectionViewCellModel.h"
#import "WLLifeFoodPreferenceView.h"

@interface WLLifeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic)  UICollectionView *topView;
/**  */
@property (nonatomic ,strong)UIView *bottomLine;
/**  */
@property (nonatomic ,strong)UIView *rightLine;
/**  */
@property (nonatomic ,strong)NSArray <WLLifeCollectionViewCellModel *>*modelArray;
/**  */
@property (nonatomic ,strong)UIImageView *bottomView;
@end

@implementation WLLifeViewController

static NSString *ID = @"cell";
-(UICollectionView *)topView{
    if ( _topView ==nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        CGFloat w = (WL_SCREEN_W - 20)/2;
        _topView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 10, WL_SCREEN_W-WL_WIDTH(20), WL_HEIGHT(225)) collectionViewLayout:layout];
        layout.itemSize = CGSizeMake(WL_WIDTH(177.5), WL_HEIGHT(112.5));
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _topView.backgroundColor = [UIColor clearColor];
        _topView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baseboard_01life"]];
        _topView.delegate = self;
        _topView.dataSource = self;
    }
    return _topView;
}
- (NSArray<WLLifeCollectionViewCellModel *> *)modelArray{
    if (!_modelArray) {
        NSArray *array = @[@{@"iconImageName":@"img_round_01",
                             @"bigTitleLable":@"品质团购",
                           @"smallTitleLable":@"每卷低质0.8元",
                        @"bigTitleLableColor":WL_RGBCOLOR(237, 117, 51)
                                 },
                           @{@"iconImageName":@"img_round_02",
                             @"bigTitleLable":@"限时秒杀",
                             @"smallTitleLable":@"9.9元限时秒杀",
                             @"bigTitleLableColor":WL_RGBCOLOR(84, 188, 208)
                             },
                           @{@"iconImageName":@"img_round_02",
                             @"bigTitleLable":@"今日免单",
                             @"smallTitleLable":@"今日洗车免费",
                             @"bigTitleLableColor":WL_RGBCOLOR(129, 54, 139)
                             },
                           @{@"iconImageName":@"img_round_04",
                             @"bigTitleLable":@"优质商家",
                             @"smallTitleLable":@"我们用心推荐",
                             @"bigTitleLableColor":WL_RGBCOLOR(207, 171, 113)
                             }
                           ];
        _modelArray = [WLLifeCollectionViewCellModel modelArrayWithDictArray:array];
    }
    return _modelArray;
}
- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [UIView new];
        _bottomLine.backgroundColor = WL_COLOR_LINE;
        
    }
    return _bottomLine;
}
-(UIView *)rightLine{
    if (!_rightLine) {
        _rightLine = [UIView new];
        _rightLine.backgroundColor = [UIColor redColor];
        
    }
    return _rightLine;
    
}
-(UIImageView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[WLLifeFoodPreferenceView alloc] init];
    }
    return _bottomView;
}
- (void)layout{
[_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(_topView.mas_left).offset(WL_WIDTH(5));
    make.right.mas_equalTo(_topView.mas_right).offset(WL_WIDTH(-5));
    make.height.mas_equalTo(WL_HEIGHT(0.5));
    make.centerX.mas_equalTo(_topView.mas_centerX);
    
}];
[_rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(_topView.mas_top).offset(WL_HEIGHT(5));
    make.centerY.mas_equalTo(_topView.mas_centerY);
    make.width.mas_equalTo(WL_WIDTH(0.5));
    make.bottom.mas_equalTo(_topView.mas_bottom).offset(WL_HEIGHT(-5));
}];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(WL_WIDTH(10));
        make.right.mas_equalTo(self.view).offset(WL_WIDTH(-10));
        make.top.mas_equalTo(_topView.mas_bottom).offset(WL_HEIGHT(10));
        make.height.mas_equalTo(WL_HEIGHT(301));
    
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.bottomView];
    [self.topView addSubview:self.bottomLine];
    [self.topView addSubview:self.rightLine];
    [self layout];
     [self.topView registerClass:[WLLifeCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
    
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WLLifeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (cell ==nil) {
        cell = [[WLLifeCollectionViewCell alloc] init];
    }
    cell.model = self.modelArray[indexPath.item];
    cell.bigTitleColor = @[WL_RGBCOLOR(237, 117, 51),WL_RGBCOLOR(84, 188, 208),WL_RGBCOLOR(129, 54, 139),WL_RGBCOLOR(207, 171, 113)];
    return cell;
}




@end
