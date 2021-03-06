//
//  NewPresenter.m
//  NewApp
//
//  Created by SSR on 2022/4/13.
//

#import "NewPresenter.h"

@interface NewPresenter ()

@end

#pragma mark - NewPresenter

@implementation NewPresenter

#pragma mark - Life cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [[UITabBar appearance] setBackgroundColor:[UIColor colorNamed:@"237_237_237"]];
        self.viewControllers = @[self.mainNav, self.personNav];
        self.tabBar.tintColor = [UIColor colorNamed:@"254_149_87"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Getter

- (UINavigationController *)mainNav {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.mainVC];
    nav.navigationBarHidden = YES;
    nav.navigationBar.translucent = YES;
    return nav;
}

- (MainViewController *)mainVC {
    if (_mainVC == nil) {
        _mainVC = [[MainViewController alloc] init];
        _mainVC.title = @"首页";
        _mainVC.tabBarItem.title = @"首页";
        _mainVC.tabBarItem.image = [UIImage imageNamed:@"首页"];
        _mainVC.tabBarItem.selectedImage = [UIImage imageNamed:@"首页_selected"];
    }
    return _mainVC;
}

- (UINavigationController *)personNav {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.personVC];
    nav.navigationBar.translucent = YES;
    return nav;
}

- (PersonViewController *)personVC {
    if (_personVC == nil) {
        _personVC = [[PersonViewController alloc] init];
        _personVC.title = @"个人";
        _personVC.tabBarItem.title = @"个人";
        _personVC.tabBarItem.image = [UIImage imageNamed:@"个人"];
        _personVC.tabBarItem.selectedImage = [UIImage imageNamed:@"个人_selected"];
    }
    return _personVC;
}

@end
