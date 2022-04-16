//
//  ZHNews.m
//  NewApp
//
//  Created by SSR on 2022/4/16.
//

#import "ZHNews.h"

@implementation ZHNews

- (instancetype)initWithTopDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.title = dict[@"title"];
        self.hint = dict[@"hint"];
        self.imageURL = dict[@"image"];
        self.imageHue = dict[@"image_hue"];
        self.newsID = dict[@"id"];
        self.newsURL = dict[@"url"];
        self.hadRead = NO;
    }
    return self;
}

- (instancetype)initWithCellDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.title = dict[@"title"];
        self.hint = dict[@"hint"];
        NSArray *images = dict[@"images"];
        if (images) {
            self.imageURL = images[0];
        }
        self.imageHue = nil;
        self.newsID = dict[@"id"];
        self.newsURL = dict[@"url"];
        self.hadRead = NO;
    }
    return self;
}

@end
