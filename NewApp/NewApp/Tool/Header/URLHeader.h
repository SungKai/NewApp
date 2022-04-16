//
//  URLHeader.h
//  NewApp
//
//  Created by SSR on 2022/4/13.
//

#ifndef URLHeader_h
#define URLHeader_h

#import "HTTPClient.h"

#pragma mark - WY163

/// 网易接口
#define WY163_Headline @"http://c.m.163.com/nc/article/headline/T1348647853363/0-60.html"

#pragma mark - ZhiHuDaily

/// 知乎日报Base接口
#define ZhiHuDaily_Base @"https://news-at.zhihu.com/api/3/"

/// 知乎日报当日新闻接口
#define ZhiHuDaily_Lastest [ZhiHuDaily_Base stringByAppendingString:@"news/latest"]

/// 知乎日报以前新闻接口
#define ZhiHuDaily_Before(date) [ZhiHuDaily_Base stringByAppendingFormat:@"stories/before/%@", date]

#endif /* URLHeader_h */
