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

//重写initWithFrame
- (instancetype)initWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10; // 水平方向的间距
    layout.minimumInteritemSpacing = 10;// 垂直方向的间距
//    layout.itemSize = CGSizeMake(150, 200);//item大小
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;//垂直滚动
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor systemBlueColor];//背景颜色
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;//不显示滚动条
        
        self.clipsToBounds = NO;
        self.pagingEnabled = YES;//开启分页
        self.bounces = NO;//弹簧效果
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        //注册
//        [self registerClass:[WaterFlowCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

//重写initWithFrame:collectionViewLayout
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewFlowLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        layout.minimumLineSpacing = 10; // 水平方向的间距
        layout.minimumInteritemSpacing = 10;// 垂直方向的间距
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;//垂直滚动
        
        self.backgroundColor = [UIColor systemBlueColor];//背景颜色
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;//不显示滚动条
//        self.clipsToBounds = NO;
//        self.pagingEnabled = YES;//开启分页
        self.bounces = NO;//弹簧效果
        
//        [self registerClass:[WaterFlowCell class] forCellWithReuseIdentifier:@"cell"];
//        self.delegate = self;
//        self.dataSource = self;
        
    }
    
    return self;
}


#pragma mark- <UICollectionViewDataSource>

//展示的item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 50;
}

//每个item展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    WaterFlowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[WaterFlowCell alloc] initWithCell];
        cell.titleLab.backgroundColor = [UIColor orangeColor];
        cell.titleLab.text = @"teest-----";
        
        cell.layer.cornerRadius = 5.0;
        cell.layer.masksToBounds = YES;
        cell.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

//item大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  
//  UIImage *image = self.imgArr[indexPath.item];
//  float height = [self imgHeight:image.size.height width:image.size.width];
  
//  return CGSizeMake(100, height);
    return CGSizeMake(100, 200);
  
}


//图片大小修改
-(float)imgHeight:(float)height width:(float)width{
//   高度/宽度 = 压缩后高度/压缩后宽度（100）
  float newHeight = height / width * 100;
  return newHeight;
}

//edgeInsets
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
  UIEdgeInsets edgeInsets = {5,5,5,5};
  return edgeInsets;
}

//#pragma mark- <UICollectionViewDelegateFlowLayout>
//定义每个UICollectionView 的大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake(96, 100);
//}

//定义每个UICollectionView 的 margin
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(5, 5, 5, 5);
//}


//#pragma mark- <UICollectionViewDelegate>

//UICollectionView被选中时调用的方法
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor whiteColor];
//}

//返回这个UICollectionView是否可以被选择
//-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
