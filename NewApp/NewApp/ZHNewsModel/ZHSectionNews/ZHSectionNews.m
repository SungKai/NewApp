//
//  ZHSectionNews.m
//  NewApp
//
//  Created by SSR on 2022/4/16.
//

#import "ZHSectionNews.h"

@implementation ZHSectionNews

- (instancetype)init {
    self = [super init];
    if (self) {
        self.date = @"";
        self.newsAry = NSArray.array;
    }
    return self;
}

- (instancetype)initWithTopDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.date = nil;
        NSMutableArray <ZHNews *> *ma = NSMutableArray.array;
        for (NSDictionary *newsDic in dict) {
            [ma addObject:[[ZHNews alloc] initWithTopDictionary:newsDic]];
        }
        self.newsAry = ma.copy;
    }
    return self;
}

- (instancetype)initWithCellDate:(NSString *)date
                      dictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.date = date;
        NSMutableArray <ZHNews *> *ma = NSMutableArray.array;
        for (NSDictionary *newsDic in dict) {
            [ma addObject:[[ZHNews alloc] initWithCellDictionary:newsDic]];
        }
        self.newsAry = ma.copy;
    }
    return self;
}

@end
