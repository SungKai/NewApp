//
//  WYNewsModel.m
//  NewApp
//
//  Created by SSR on 2022/4/13.
//

#import "WYNewsModel.h"

@implementation WYNewsModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.newsAry = NSArray.array;
    }
    return self;
}

- (void)requestSuccess:(void (^)(void))success
               failure:(void (^)(NSError * _Nonnull))failure {
    [HTTPClient.defaultClient
     GET:WY163_Headline
     parameters:nil
     progress:nil
     success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"🟢%@:\n%@", self.class, responseObject);
        NSMutableArray *ma = NSMutableArray.array;
        for (NSDictionary *dict in responseObject[@"T1348647853363"]) {
            WYNews *aNew = [[WYNews alloc] initWithDictionary:dict];
            //有部分新闻没有简短信息digest，会影响进入新闻详情页，需要删掉
            if (![aNew.digest  isEqual: @""]) {
                [ma addObject:aNew];
            }
        }
        self.newsAry = ma.copy;
        if (success) {
            success();
        }
    }
     failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"🔴%@:\n%@", self.class, error);
        if (failure) {
            failure(error);
        }
    }];
}

@end
