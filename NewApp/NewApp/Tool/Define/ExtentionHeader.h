//
//  ExtentionHeader.h
//  NewApp
//
//  Created by SSR on 2022/4/13.
//

#ifndef ExtentionHeader_h
#define ExtentionHeader_h

#pragma mark - Frame

#import "UIView+Frame.h"

#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)

#define ScreenHeight ([[UIScreen mainScreen]bounds].size.height)

#define StatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

#pragma mark - Font

#define PingFangSCSemibold @"PingFangSC-Semibold"

#endif /* ExtentionHeader_h */
