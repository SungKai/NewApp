//
//  AppDelegate.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "MainViewController.h"
#import "PersonViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //loginVC    需要伪登陆
//    LoginViewController *loginVC = [[LoginViewController alloc] init];
    
    //mainVC
    MainViewController *mainVC = [[MainViewController alloc] init];
    mainVC.title = @"首页";
    mainVC.tabBarItem.title = @"首页";
    mainVC.tabBarItem.image = [UIImage imageNamed:@"首页"];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    mainNav.navigationBar.translucent = YES;
    //personVC
    PersonViewController *personVC = [[PersonViewController alloc] init];
    personVC.title = @"个人";
    personVC.tabBarItem.title = @"个人";
    personVC.tabBarItem.image = [UIImage imageNamed:@"个人"];
    UINavigationController *personNav = [[UINavigationController alloc] initWithRootViewController:personVC];
    personNav.navigationBar.translucent = YES;
    
    NSArray *vcsArray = [NSArray arrayWithObjects:mainNav, personNav, nil];
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    [[UITabBar appearance] setBackgroundColor:[UIColor yellowColor]];
    tabBarVC.viewControllers = vcsArray;

    self.window = [[UIWindow alloc] init];
    self.window.rootViewController = tabBarVC;
    mainNav.navigationBar.hidden = YES;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
