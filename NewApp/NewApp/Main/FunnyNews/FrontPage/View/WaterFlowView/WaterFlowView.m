//
//  WaterFlowView.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/17.
//

#import "WaterFlowView.h"
#import "WaterFlowLayout.h"
#import "WaterFlowCell.h"

@interface WaterFlowView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation WaterFlowView

//重写init
- (instancetype)init {
    return [self initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
}

//重写initWithFrame
- (instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10; // 水平方向的间距
    layout.minimumInteritemSpacing = 10;// 垂直方向的间距
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        //设置背景颜色（默认黑色）
        self.backgroundColor = [UIColor whiteColor];
        [self registerClass:[WaterFlowCell class] forCellWithReuseIdentifier:@"cell"];
    }
    
    return self;
}

//重写initWithFrame:collectionViewLayout
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewFlowLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor systemPinkColor];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;//不显示滚动条
//        self.delegate = self;
//        self.dataSource = self;
        
        self.clipsToBounds = NO;
        self.pagingEnabled = YES;//开启分页
        self.bounces = NO;//弹簧效果

    }
    return self;
}


#pragma mark- <UICollectionViewDataSource>

//展示的UICollectionView的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

//定义展示的section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    WaterFlowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[WaterFlowCell alloc] init];
        cell.titleLab.backgroundColor = [UIColor orangeColor];
        cell.titleLab.text = @"teest-----";
    }
    return cell;
}

#pragma mark- <UICollectionViewDelegateFlowLayout>
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(96, 100);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


#pragma mark- <UICollectionViewDelegate>

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
}


//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
