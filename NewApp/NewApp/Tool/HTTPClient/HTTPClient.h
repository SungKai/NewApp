//
//  HTTPClient.h
//  NewApp
//
//  Created by SSR on 2022/4/13.
//

#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - HTTPClient

@interface HTTPClient : AFHTTPSessionManager

/// 单例网络接口
@property (nonatomic, strong, readonly, class) HTTPClient *defaultClient;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

- (void)test;

@end

NS_ASSUME_NONNULL_END
