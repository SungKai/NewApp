//
//  PersonViewController.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/11.
//

#import "PersonViewController.h"

#import "PersonDetailController.h"

#import "PersonDetialView.h"
#import "PersonSecondView.h"

#pragma mark - PersonViewController ()

@interface PersonViewController ()

@property (nonatomic, strong) PersonDetailController *personDetailVC;

@property (nonatomic, strong) PersonSecondView *personSecondView;

@end

#pragma mark - PersonViewController

@implementation PersonViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorNamed:@"247_247_247"];
    [self addChildViewController:self.personDetailVC];
    [self.view addSubview:self.personDetailVC.view];
    [self.view addSubview:self.personSecondView];
}

#pragma mark - Getter

- (PersonDetailController *)personDetailVC {
    if (_personDetailVC == nil) {
        _personDetailVC = [[PersonDetailController alloc] init];
        _personDetailVC.view.top = 100;
        _personDetailVC.view.centerX = self.view.SuperCenter.x;
    }
    return _personDetailVC;
}

- (PersonSecondView *)personSecondView {
    if (!_personSecondView) {
        _personSecondView = [[PersonSecondView alloc] initWithSecondView];
    }
    return _personSecondView;
}

@end
