//
//  SchoolNewsViewController.h
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

//教务新闻
#import <UIKit/UIKit.h>
//VC
#import "SNNextViewController.h"

NS_ASSUME_NONNULL_BEGIN
@protocol SchoolNewsViewControllerDelegete <NSObject>

@required

/// 跳转到教务新闻详情页
/// @param snNextVC 要跳转的VC
- (void)jumpToSNNextVC:(SNNextViewController *)snNextVC;

///从nextVC跳回frontVC
- (void)jumpToFrontVC;

@end

@interface SchoolNewsViewController : UIViewController

@property (nonatomic, weak) id <SchoolNewsViewControllerDelegete> SchoolNewsViewControllerDelegete;

@end

NS_ASSUME_NONNULL_END
