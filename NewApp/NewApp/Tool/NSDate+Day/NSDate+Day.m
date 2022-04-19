//
//  NSDate+Day.m
//  ZhiHuDaily
//
//  Created by 宋开开 on 2022/2/21.
//

#import "NSDate+Day.h"

@implementation NSDate (Day)
//得到今天日期
+ (NSDate *)today {
    return [[NSDate alloc] init];
}
//得到今天的day
- (NSString *)day {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"d";
    NSString *day = [formatter stringFromDate:self];
//    NSLog(@"================%@", )
    return day;
}
//得到今天的month
- (NSString *)month {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"M";
    NSString *month = [formatter stringFromDate:self];
    return month;
}
//得到今天的week英文
- (NSString *)week {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"E";
    NSString *week = [formatter stringFromDate:self];
    return week;
}
//月份翻译为中文
- (NSString *)monthTransformChinese {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"M";
    NSString *month = [formatter stringFromDate:self];
    //设置数字数组
    NSArray *numberArray = @[@"1", @"2",@"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12"];
    NSArray *stringArray = @[@"一月", @"二月",@"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"];
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:stringArray forKeys:numberArray];
    return [dict objectForKey:month];
}
//星期翻译为中文
- (NSString *)weekTransformChinese {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"E";
    NSString *week = [formatter stringFromDate:self];
    //设置数字数组
    NSArray *englishArray = @[@"Mon", @"Tue",@"Wed", @"Thur", @"Fri", @"Sat", @"Sun"];
    NSArray *stringArray = @[@"一", @"二",@"三", @"四", @"五", @"六", @"七"];
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:stringArray forKeys:englishArray];
    return [dict objectForKey:week];
}
@end
