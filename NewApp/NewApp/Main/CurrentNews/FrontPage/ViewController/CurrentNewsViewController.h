//
//  CurrentNewsViewController.h
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import <UIKit/UIKit.h>
#import "CNNextViewController.h"
//最左边的时事新闻
NS_ASSUME_NONNULL_BEGIN
@protocol CurrentNewsViewControllerDelegete <NSObject>

@required

/// 跳转到时事新闻详情页
/// @param cnNextVC 要跳转的VC
- (void)jumpToCNNextVC:(CNNextViewController *)cnNextVC;


@end

@interface CurrentNewsViewController : UIViewController

@property (nonatomic, weak) id <CurrentNewsViewControllerDelegete> cnVCDelegete;
@end

NS_ASSUME_NONNULL_END
