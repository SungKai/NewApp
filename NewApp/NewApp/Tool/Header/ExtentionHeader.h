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

//#define WIDTH self.contentView.frame.size.width - 
#pragma mark - Font

#define PingFangSCSemibold @"PingFangSC-Semibold"

#pragma mark - Singleton

#define UserDefaults NSUserDefaults.standardUserDefaults

#pragma mark - Modularization

#import "PersonHeader.h"

#endif /* ExtentionHeader_h */
