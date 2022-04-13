//
//  AppDelegate.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import "AppDelegate.h"
//#import "LoginViewController.h"
//#import "MainViewController.h"
//#import "PersonViewController.h"

#import "NewPresenter.h"

#pragma mark - AppDelegate ()

@interface AppDelegate ()

/// 主要的控制器
@property (nonatomic, strong) NewPresenter *presenterVC;

@end

#pragma mark - AppDelegate

@implementation AppDelegate

#pragma mark - <UIApplicationDelegate>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //loginVC    需要伪登陆
//    LoginViewController *loginVC = [[LoginViewController alloc] init];
    self.window = [[UIWindow alloc] init];
    self.window.rootViewController = self.presenterVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - Getter

- (NewPresenter *)presenterVC {
    if (_presenterVC == nil) {
        _presenterVC = [[NewPresenter alloc] init];
    }
    return _presenterVC;
}

@end
