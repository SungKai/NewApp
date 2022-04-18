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

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    [self.view addSubview:self.personFirstView];
}

#pragma mark- 懒加载
- (PersonFirstView *)personFirstView {
    if (!_personFirstView) {
        _personFirstView = [[PersonFirstView alloc] initWithFirstView];
        
    }
    return _personFirstView;
}

@end
