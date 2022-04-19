//
//  NSDate+Day.h
//  ZhiHuDaily
//
//  Created by 宋开开 on 2022/2/21.
//
//此分类为日期的封装
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Day)
//得到今天日期
+ (NSDate *)today;
//得到今天的day
- (NSString *)day;
//得到今天的month
- (NSString *)month;
//得到今天的week英文
- (NSString *)week;
//月份翻译为中文
- (NSString *)monthTransformChinese;
//星期翻译为中文
- (NSString *)weekTransformChinese;
@end

NS_ASSUME_NONNULL_END
