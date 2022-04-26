//
//  UILabel+AutoHeight.m
//  ZhiHuDaily
//
//  Created by 宋开开 on 2022/2/16.
//
  
#import "UILabel+AutoHeight.h"

@implementation UILabel (AutoHeight)

- (CGSize)MaxLabelWidth:(NSString *)text FontOfSize:(NSInteger)size MaxWidth:(CGFloat)maxWidth MaxNumberOfLine:(NSInteger)maxNumOfLine Interval:(CGFloat)interval{
    //文字展开一行的宽度
    CGSize originSize = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:size],NSFontAttributeName,nil]];
    //把所有文字都展现所需要的行数
    NSInteger count = originSize.width / maxWidth + 1;
    CGFloat width = 0;
    //大于最大行数
    if (count > maxNumOfLine && maxNumOfLine != -1){
        count = maxNumOfLine;
    }
    self.numberOfLines = count;
    //不满一行
    if (count == 1){
        width = originSize.width;
    }else{
        width = maxWidth;
    }
    //高度
    CGFloat height = count * originSize.height + interval * (count + 1);
    return CGSizeMake(width, height);
}
@end
