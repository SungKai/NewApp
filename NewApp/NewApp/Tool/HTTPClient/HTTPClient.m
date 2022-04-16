//
//  HTTPClient.m
//  NewApp
//
//  Created by SSR on 2022/4/13.
//

#import "HTTPClient.h"

static HTTPClient *client;

@implementation HTTPClient

- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [super init];
        
        AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
        requestSerializer.timeoutInterval = 15.0;
        [client setRequestSerializer:requestSerializer];
        
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
        [responseSerializer setRemovesKeysWithNullValues:YES];
        [responseSerializer.acceptableContentTypes setByAddingObjectsFromSet:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",@"application/atom+xml",@"application/xml",@"text/xml",@"application/x-www-form-urlencoded", nil]];
        [client setResponseSerializer:responseSerializer];
    });
    return client;
}

+ (HTTPClient *)defaultClient{
    return [[HTTPClient alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [super allocWithZone:zone];
    });
    return client;
}

- (id)copyWithZone:(NSZone *)zone{
    return client;
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return client;
}

@end
