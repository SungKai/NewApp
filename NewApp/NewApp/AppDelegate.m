//
//  AppDelegate.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import "AppDelegate.h"

#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    MainViewController *mainVC = [[MainViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    self.window = [[UIWindow alloc] init];
    self.window.rootViewController = nav;
    nav.navigationBar.hidden = YES;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
