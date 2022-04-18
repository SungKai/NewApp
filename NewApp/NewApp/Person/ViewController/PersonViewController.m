//
//  PersonViewController.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/11.
//

#import "PersonViewController.h"
#import "PersonFirstView.h"
#import "PersonSecondView.h"
#import "Masonry.h"

@interface PersonViewController ()

@property (nonatomic, strong) PersonFirstView *personFirstView;

@property (nonatomic, strong) PersonSecondView *personSecondView;

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    [self.view addSubview:self.personFirstView];
    [self.view addSubview:self.personSecondView];
}

#pragma mark- 懒加载
- (PersonFirstView *)personFirstView {
    if (!_personFirstView) {
        _personFirstView = [[PersonFirstView alloc] initWithFirstView];
        
    }
    return _personFirstView;
}


- (PersonSecondView *)personSecondView {
    if (!_personSecondView) {
        _personSecondView = [[PersonSecondView alloc] initWithSecondView];
    }
    return _personSecondView;
}

@end
