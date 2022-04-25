//
//  WaterFlowView.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/17.
//

#import "WaterFlowView.h"
#import "WaterFlowLayout.h"
#import "WaterFlowCell.h"

static NSString *CellIdentifier = @"Cell";
@interface WaterFlowView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation WaterFlowView

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
        self.clipsToBounds = NO;
        self.pagingEnabled = YES;//开启分页
        self.bounces = NO;//弹簧效果

        self.delegate = self;
        self.dataSource = self;
        
    }
    
    return self;
}


#pragma mark- <UICollectionViewDataSource>
//左右间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}

//上下间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 50;
}


//设置{上, 左, 下, 右}边界缩进
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(10, 30, 30, 30);
}

//列数:2
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    float cellWidth = screenWidth / 3.0;
    //  UIImage *image = self.imgArr[indexPath.item];
        //根据图片数组image设置大小
    //  float height = [self imgHeight:image.size.height width:image.size.width];
    float height = 200;
    CGSize size = CGSizeMake(cellWidth, height);
    return size;
}

//图片大小修改
-(float)imgHeight:(float)height width:(float)width{
    //高度/宽度 = 压缩后高度/压缩后宽度（100）
  float newHeight = height / width * 100;
  return newHeight;
}

#pragma mark- <UICollectionViewDelegate>

//展示的item(cell)的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 50;
}

//每个item(cell)展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    WaterFlowCell *cell = [WaterFlowCell CreateReusableCell:collectionView cellForItemAtIndexPath:indexPath];
    
//    if (indexPath.section == 0) {
//        cell.backgroundColor = [UIColor orangeColor];
//        cell.layer.cornerRadius = 10.0;
//        cell.layer.masksToBounds = YES;
//        }
    
//    if (!cell) {
//        cell = [[WaterFlowCell alloc] initWithCell];
//        cell.backgroundColor = [UIColor redColor];
//
//        cell.layer.cornerRadius = 5.0;
//        cell.layer.masksToBounds = YES;
//    }
    return cell;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
