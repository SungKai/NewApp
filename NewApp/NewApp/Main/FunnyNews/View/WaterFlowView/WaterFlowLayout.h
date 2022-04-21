//
//  WaterFlowLayout.h
//  瀑布流demo
//
//  Created by 小艾同学 on 2022/4/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class  WaterFlowLayout;
@protocol WaterFlowLayoutDelegate <NSObject>

//使用delegate取得每一个cell的高度
- (CGFloat)waterFlow:(WaterFlowLayout *)layout heightForCellAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface WaterFlowLayout : UICollectionViewLayout

//声明协议
@property (nonatomic, weak)id <WaterFlowLayoutDelegate> delegate;
//确定列数
@property (nonatomic, assign) NSInteger colum;
//确定内边距
@property (nonatomic, assign) UIEdgeInsets insetSpace;
//确定每个cell之间的距离
@property (nonatomic, assign) NSInteger distance;

@end

NS_ASSUME_NONNULL_END
