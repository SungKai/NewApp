//
//  ZHNews.h
//  NewApp
//
//  Created by SSR on 2022/4/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 单个知乎日报新闻
@interface ZHNews : NSObject

/// 标题
@property (nonatomic, copy) NSString *title;

/// 作者
@property (nonatomic, copy) NSString *hint;

/// 图片来源
@property (nonatomic, copy, nullable) NSString *imageURL;

/// 图片HUE
@property (nonatomic, copy, nullable) NSString *imageHue;

/// 图片新闻
@property (nonatomic, copy) NSString *newsID;

/// 新闻详情URL
@property (nonatomic, copy) NSString *newsURL;

/// 是否已读，每次进入不做处理
@property (nonatomic) BOOL hadRead;

- (instancetype)init NS_UNAVAILABLE;

/// 根据字典Top（接口：api/3）
/// @param dict 转化的字典
- (instancetype)initWithTopDictionary:(NSDictionary *)dict;

/// 根据字典Cell
/// @param dict 转化的字典
- (instancetype)initWithCellDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
