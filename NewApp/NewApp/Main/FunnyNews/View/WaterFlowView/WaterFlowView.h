//
//  WaterFlowView.h
//  NewApp
//
//  Created by 小艾同学 on 2022/4/17.
//

#import <UIKit/UIKit.h>
//M
#import "ZHNewsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WaterFlowView : UICollectionView

@property (nonatomic, strong) NSArray <ZHSectionNews *> *cellZHData;

@end

NS_ASSUME_NONNULL_END
