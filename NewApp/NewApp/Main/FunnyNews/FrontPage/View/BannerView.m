//
//  BannerView.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/18.
//

#import "BannerView.h"

@implementation BannerView

//- (instancetype)init {
//    return [self initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth)];
//}

/**重写initWithFrame，应该用initWithFrame*/
- (instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    /**行0间距*/
    layout.minimumLineSpacing = 0;
    /**列0间距*/
    layout.minimumInteritemSpacing = 0;
    /**四周0*/
    layout.sectionInset = UIEdgeInsetsZero;
    /**方向右*/
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [self initWithFrame:frame collectionViewLayout:layout];;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
