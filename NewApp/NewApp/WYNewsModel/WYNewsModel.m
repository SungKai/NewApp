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
     GET:WY163
     parameters:nil
     progress:nil
     success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"🟢WYNewsModel:\n%@", responseObject);
        NSMutableArray *ma = NSMutableArray.array;
        for (NSDictionary *dict in responseObject[@"T1348647853363"]) {
            WYNews *aNew = [[WYNews alloc] initWithDictionary:dict];
            [ma addObject:aNew];
        }
        self.newsAry = ma.copy;
        if (success) {
            success();
        }
    }
     failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"🔴WYNewsModel:\n%@", error);
        if (failure) {
            failure(error);
        }
    }];
}

@end
