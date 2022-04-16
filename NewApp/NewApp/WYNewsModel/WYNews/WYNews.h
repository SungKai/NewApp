//
//  WYNews.h
//  NewApp
//
//  Created by SSR on 2022/4/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 单个网易新闻
@interface WYNews : NSObject

/// 所属来源
@property (nonatomic, strong) NSString *source;

/// 标题
@property (nonatomic, strong) NSString *title;

/// 简短的信息
@property (nonatomic, strong) NSString *digest;

/// 图片来源URL
@property (nonatomic, strong) NSString *imgURL;

/// 重定向URL
@property (nonatomic, strong) NSString *newsURL;

- (instancetype)init NS_UNAVAILABLE;

/// 通过字典传入，测试APK为cm163
/// @param dict 来自网络的节点
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
