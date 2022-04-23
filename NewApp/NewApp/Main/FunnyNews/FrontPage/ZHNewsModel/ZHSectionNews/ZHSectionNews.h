//
//  ZHSectionNews.h
//  NewApp
//
//  Created by SSR on 2022/4/16.
//

#import <Foundation/Foundation.h>

#import "ZHNews.h"

NS_ASSUME_NONNULL_BEGIN

/// 知乎日报组新闻，init后，rowNews为0个数据
@interface ZHSectionNews : NSObject

/// 当前组新闻的日期
@property (nonatomic, copy, nullable) NSString *date;

/// 组新闻
@property (nonatomic, copy) NSArray <ZHNews *> *newsAry;

/// 返回顶视图模型，date为nil
/// @param dict 字典
- (instancetype)initWithTopDictionary:(NSDictionary *)dict;

/// 返回cell模型，有date
/// @param date 日期
/// @param dict 字典
- (instancetype)initWithCellDate:(NSString *)date
                      dictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
