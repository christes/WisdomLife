//
//  WLCollectionViewController.m
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/22.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLCollectionViewController.h"
#import "WLCollectionViewCell.h"

@interface WLCollectionViewController ()<UIScrollViewDelegate>
@property (nonatomic ,strong)UIPageControl *pageControl;
/** 进入App */
@property(nonatomic,strong) UIButton *startBtn;
@end

@implementation WLCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
-(instancetype)init{
    // 配置Layout
    UICollectionViewFlowLayout *layout  = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    return  [super initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 配置控制器特性
    [self configureControllerAppearance];
    
    // 注册Cell
    [self.collectionView registerClass:[WLCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // 添加子视图
    [self.view addSubview:self.pageControl];
    [self.view addSubview:self.startBtn ];
    
    // 布局
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(WL_HEIGHT(-27));
        make.size.mas_equalTo(CGSizeMake(WL_WIDTH(150), WL_HEIGHT(18)));
    }];
    [_startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(WL_HEIGHT(-27));
        make.size.mas_equalTo(CGSizeMake(WL_WIDTH(300), WL_HEIGHT(50)));
    }];
}


/**
    配置控制器特性
 */
- (void)configureControllerAppearance{
    self.view.backgroundColor = [UIColor redColor];
    self.collectionView.backgroundColor = [UIColor greenColor];
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSString *imageName = _imageArray[indexPath.row];
    cell.image = [UIImage imageNamed:imageName];
    
    return cell;
}

#pragma mark - - set
- (void)setImageArray:(NSArray<NSString *> *)imageArray{
    _imageArray = imageArray;
    self.pageControl.numberOfPages = _imageArray.count;
}

- (void)setCurrentPageControlColor:(UIColor *)currentPageControlColor{
    _currentPageControlColor = currentPageControlColor;
    self.pageControl.currentPageIndicatorTintColor = _currentPageControlColor;
}

- (void)setOtherPageControlColor:(UIColor *)otherPageControlColor{
    _otherPageControlColor = otherPageControlColor;
    self.pageControl.pageIndicatorTintColor = otherPageControlColor;
}

- (void)setCurrentPageControlImage:(UIImage *)currentPageControlImage{
    _currentPageControlImage = currentPageControlImage;
    [self.pageControl setValue:_currentPageControlImage forKeyPath:@"currentPageImage"];
}

- (void)setOtherPageControlImage:(UIImage *)otherPageControlImage{
    _otherPageControlImage = otherPageControlImage;
    [self.pageControl setValue:_otherPageControlImage forKeyPath:@"pageImage"];
}

#pragma mark - - lazy load

- (UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [UIPageControl new];
        _pageControl.currentPage = 0;
    }
    return _pageControl;
}
- (UIButton *)startBtn{
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"border-"]  forState:UIControlStateNormal];
        [_startBtn setTitle:@"立即体验" forState:UIControlStateNormal];
        _startBtn.hidden = YES;
          [_startBtn addTarget:self action:@selector(didStartBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return  _startBtn;
}

#pragma mark - - Click Event
- (void)didStartBtn{
    CATransition *anim = [CATransition animation];
    anim.duration = 0.5;
    anim.type = @"rippleffect";
    [ [UIApplication sharedApplication].keyWindow.layer addAnimation:anim forKey:nil];
    !_buttonClickCallBackBlock ? : _buttonClickCallBackBlock();
}

#pragma mark - - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger pageNumber = offsetX/WL_SCREEN_W;
    _pageControl.currentPage = pageNumber;
    _pageControl.hidden = pageNumber == _imageArray.count - 1;
    _startBtn.hidden = !(pageNumber == _imageArray.count - 1);
  
}
@end
