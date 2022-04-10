//
//  MainViewController.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import "MainViewController.h"
//VC
#import "CurrentNewsViewController.h"
#import "FunnyNewsViewController.h"
#import "SchoolNewsViewController.h"
//V
#import "NavView.h"

@interface MainViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) CurrentNewsViewController *curView;
@property (nonatomic, strong) FunnyNewsViewController *funView;
@property (nonatomic, strong) SchoolNewsViewController *schoolView;
@property (nonatomic, strong) NavView *navView;
//用于实现左右滑动切换界面
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.scrollView];
    
}
#pragma mark - lazy
//scrollView
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, NAVHEIGHT, DEVICESCREENWIDTH, DEVICESCREENHEIGHT - NAVHEIGHT)];
        _scrollView.backgroundColor = [UIColor lightGrayColor];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.bounces = NO;
    }
    return _scrollView;
}
//curView
- (CurrentNewsViewController *)curView {
    if (!_curView) {
        _curView = [[CurrentNewsViewController alloc] init];
    }
    return _curView;
}
//funView
- (FunnyNewsViewController *)funView {
    if (!_funView) {
        _funView = [[FunnyNewsViewController alloc] init];
    }
    return _funView;
}
//funView
- (SchoolNewsViewController *)schoolView {
    if (!_schoolView) {
        _schoolView = [[SchoolNewsViewController alloc] init];
    }
    return _schoolView;
}
//navView
- (NavView *)navView {
    if (!_navView) {
        _navView = [[NavView alloc] init];
    }
    return _navView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
