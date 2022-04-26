//
//  UILabel+AutoHeight.h
//  ZhiHuDaily
//
//  Created by 宋开开 on 2022/2/16.
//
/*此分类为UILabel添加了一个能够根据文本内容，字号，字体间隔，来确定该UILabel的Size，有些不足一行的也会把宽度调整至文本宽度
 */
#import <UIKit/UIKit.h>

@interface UILabel (AutoHeight)
/// MaxLabelWidth
/// @param text 文本内容
/// @param size 字号
/// @param maxWidth 最大宽度
/// @param maxNumOfLine 最大行数，等于-1时相当于不限行数
/// @param interval 文字间隔
- (CGSize)MaxLabelWidth:(NSString *)text FontOfSize:(NSInteger)size MaxWidth:(CGFloat)maxWidth MaxNumberOfLine:(NSInteger)maxNumOfLine Interval:(CGFloat)interval;

@end

