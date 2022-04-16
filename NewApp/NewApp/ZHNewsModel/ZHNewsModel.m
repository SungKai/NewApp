//
//  ZHNewsModel.m
//  NewApp
//
//  Created by SSR on 2022/4/16.
//

#import "ZHNewsModel.h"

@implementation ZHNewsModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.topNewsModel = [[ZHSectionNews alloc] init];
        self.bodyNewsModel = NSMutableArray.array;
    }
    return self;
}

- (void)requestLastest:(void (^)(void))success
               failure:(void (^)(NSError * _Nonnull))failure {
    [HTTPClient.defaultClient
     GET:ZhiHuDaily_Lastest
     parameters:nil
     progress:nil
     success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"🟢%@:\n%@", self.class, responseObject);
        
        self.topNewsModel = [[ZHSectionNews alloc]
                             initWithTopDictionary:responseObject[@"top_stories"]];
        
        [self.bodyNewsModel
         addObject:[[ZHSectionNews alloc]
                    initWithCellDate:responseObject[@"date"]
                    dictionary:responseObject[@"stories"]]];
        
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

- (void)requestBeforeDate:(NSString *)date
                  success:(void (^)(void))success
                  failure:(void (^)(NSError * _Nonnull))failure {
    [HTTPClient.defaultClient
     GET:ZhiHuDaily_Before(date)
     parameters:nil
     progress:nil
     success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"🟢%@:\n%@", self.class, responseObject);
        
        [self.bodyNewsModel
         addObject:[[ZHSectionNews alloc]
                    initWithCellDate:responseObject[@"date"]
                    dictionary:responseObject[@"stories"]]];
        
        if (success) {
            success();
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"🔴%@:\n%@", self.class, error);
        if (failure) {
            failure(error);
        }
    }];
}

@end
