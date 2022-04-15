//
//  UIView+RoundCorner.h
//  NewApp
//
//  Created by 小艾同学 on 2022/4/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (RoundCorner)

- (void)applyRoundCorners:(UIRectCorner)corners radius:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
