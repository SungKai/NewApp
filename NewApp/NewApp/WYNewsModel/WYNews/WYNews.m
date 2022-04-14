//
//  WYNews.m
//  NewApp
//
//  Created by SSR on 2022/4/13.
//

#import "WYNews.h"

@implementation WYNews

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.source = dict[@"source"];
        self.title = dict[@"title"];
        self.digest = dict[@"digest"];
        self.imgURL = dict[@"imgsrc"];
        self.newsURL = [NSString stringWithFormat:@"https://3g.163.com/news/article/%@.html",  dict[@"docid"]];
        //H4TPBAO90512D3VJ
    }
    return self;
}

@end
