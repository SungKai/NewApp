//
//  SNNextViewController.h
//  NewApp
//
//  Created by 宋开开 on 2022/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SNNextViewControllerDelegete <NSObject>

- (void)back;

@end

@interface SNNextViewController : UIViewController

@property (nonatomic, weak) id <SNNextViewControllerDelegete> SNNextViewControllerDelegete;

/// 初始化方法
/// @param titleLab 新闻标题
/// @param textLab 新闻内容
- (instancetype)initWithTitleLab:(NSString *)titleLab TextLab:(NSString *)textLab;

@end

NS_ASSUME_NONNULL_END
