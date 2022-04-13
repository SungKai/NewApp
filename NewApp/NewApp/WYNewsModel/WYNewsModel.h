//
//  WYNewsModel.h
//  NewApp
//
//  Created by SSR on 2022/4/13.
//

#import <Foundation/Foundation.h>

#import "WYNews.h"

NS_ASSUME_NONNULL_BEGIN

/// 新闻整体模型
@interface WYNewsModel : NSObject

/// 新闻整体
@property (nonatomic, copy) NSArray <WYNews *> *newsAry;

/// 请求网易新闻，测试API为cm163
/// @param success 请求成功并有值
/// @param failure 请求失败返回
- (void)requestSuccess:(void (^)(void))success
               failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
