//
//  WaterFlowView.h
//  NewApp
//
//  Created by 小艾同学 on 2022/4/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WaterFlowViewDelegate <NSObject>

@end


@interface WaterFlowView : UICollectionView


@property (nonatomic, weak)id <WaterFlowViewDelegate> waterFlowDelegate;

@end

NS_ASSUME_NONNULL_END
