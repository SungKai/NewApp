//
//  ZHNewsModel.h
//  NewApp
//
//  Created by SSR on 2022/4/16.
//

#import <Foundation/Foundation.h>

#import "ZHSectionNews.h"

NS_ASSUME_NONNULL_BEGIN

/// 知乎日报Model
@interface ZHNewsModel : NSObject

/// 顶部model，拥有HUE和imgURL
@property (nonatomic, strong) ZHSectionNews *topNewsModel;

/// sections的model，没有HUE，可能有imgURL
@property (nonatomic, strong) NSMutableArray <ZHSectionNews *> *bodyNewsModel;

/// 请求最近一次的
/// @param success 请求成功，两者都重新复值
/// @param failure 请求失败
- (void)requestLastest:(void (^)(void))success
               failure:(void (^)(NSError *error))failure;

/// 请求以前的，得到日期以前的
/// @param date 请求的日期（得到前一天的）
/// @param success 请求失败，只改变sections的model
/// @param failure 请求失败
- (void)requestBeforeDate:(NSString *)date
                  success:(void (^)(void))success
                  failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
