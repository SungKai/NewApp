//
//  UIView+RoundCorner.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/15.
//

#import "UIView+RoundCorner.h"

@implementation UIView (RoundCorner)

/**设置边角圆角*/
- (void)applyRoundCorners:(UIRectCorner)corners radius:(CGFloat)radius
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];

    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;

    self.layer.mask = maskLayer;
}

@end
