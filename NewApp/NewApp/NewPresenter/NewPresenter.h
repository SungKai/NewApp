//
//  NewPresenter.h
//  NewApp
//
//  Created by SSR on 2022/4/13.
//

#import <UIKit/UIKit.h>

#import "MainViewController.h"
#import "LoginViewController.h"
#import "PersonViewController.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark - NewPresenter

@interface NewPresenter : UITabBarController

/// 主页VC
@property (nonatomic, strong) MainViewController *mainVC;

/// 个人页VC
@property (nonatomic, strong) PersonViewController *personVC;

@end

NS_ASSUME_NONNULL_END
