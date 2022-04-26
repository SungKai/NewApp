//
//  WaterFlowCell.h
//  NewApp
//
//  Created by 小艾同学 on 2022/4/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WaterFlowCell : UICollectionViewCell

/// 新闻标题
@property (nonatomic, strong) UILabel *titleLab;

/// 描述
@property (nonatomic, strong) UILabel *hintLab;

/// 图片
@property (nonatomic, strong) UIImageView *imgView;


- (instancetype)initWithCell;
//数据
- (WaterFlowCell *)cellWithInformation:(WaterFlowCell *)cell WithTitleText:(NSString *)titleText WithHintText:(NSString *)hintText WithImageURL:(NSString *)imageURL;
//复用
+ (WaterFlowCell *)CreateReusableCell:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
