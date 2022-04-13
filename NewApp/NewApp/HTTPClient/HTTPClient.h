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

- (void)GET:(NSString *)url
 parameters:(nullable id)parameters
   progress:(nullable void (^)(NSProgress *progress))downloadProgress
    success:(nullable void (^)(NSURLSessionDataTask *, id))success
    failure:(nullable void (^)(NSURLSessionDataTask *, NSError *))failure;

@end

NS_ASSUME_NONNULL_END
