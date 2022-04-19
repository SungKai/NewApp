//
//  BannerView.h
//  NewApp
//
//  Created by 小艾同学 on 2022/4/18.
//

#import <UIKit/UIKit.h>
//M
#import "ZHNewsModel.h"

NS_ASSUME_NONNULL_BEGIN
#pragma mark - BannerViewDelegate
@protocol BannerViewDelegate <NSObject>



@end

#pragma mark - BannerView
@interface BannerView : UICollectionView
/**遵守的代理*/
<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

//代理
@property (nonatomic, weak) id <BannerViewDelegate> Banner_delegate;
 
@property (nonatomic, strong) ZHSectionNews *bannerZHData;
@end

NS_ASSUME_NONNULL_END
