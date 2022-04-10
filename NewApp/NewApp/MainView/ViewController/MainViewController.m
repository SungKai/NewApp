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

@interface MainViewController ()<UIScrollViewDelegate, NavDelegate>
@property (nonatomic, strong) CurrentNewsViewController *curVC;
@property (nonatomic, strong) FunnyNewsViewController *funVC;
@property (nonatomic, strong) SchoolNewsViewController *schoolVC;
@property (nonatomic, strong) NavView *navView;
//用于实现左右滑动切换界面
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.navView];
    [self.view addSubview:self.scrollView];
//    [self.scrollView addSubview:self.curVC];
    [self setMainScrollView];
    //设置默认
    self.currentIndex = 0;
    [self.navView silderAction:self.currentIndex];
    
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
//curVC
- (CurrentNewsViewController *)curVC {
    if (!_curVC) {
        _curVC = [[CurrentNewsViewController alloc] init];
    }
    return _curVC;
}
//funVC
- (FunnyNewsViewController *)funVC {
    if (!_funVC) {
        _funVC = [[FunnyNewsViewController alloc] init];
    }
    return _funVC;
}
//funVC
- (SchoolNewsViewController *)schoolVC {
    if (!_schoolVC) {
        _schoolVC = [[SchoolNewsViewController alloc] init];
    }
    return _schoolVC;
}
//navView
- (NavView *)navView {
    if (!_navView) {
        _navView = [[NavView alloc] initWithNavView:CGRectMake(0, 0, DEVICESCREENWIDTH, NAVHEIGHT)];
        _navView.navDelegate = self;
    }
    return _navView;
}
#pragma mark - 方法
- (void)setMainScrollView {
    [self.view addSubview:self.scrollView];
    //分别添加各个VC
    NSArray *VCArray = @[self.curVC.view, self.funVC.view, self.schoolVC.view];
    //逐一加入scrollView
    for (int i = 0; i < VCArray.count; i++) {
        UIView *pageView = [[UIView alloc] initWithFrame:CGRectMake(DEVICESCREENWIDTH * i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        [pageView addSubview:VCArray[i]];
        [self.scrollView addSubview:pageView];
    }
    //给scrollView设置好偏移尺寸
    self.scrollView.contentSize = CGSizeMake(DEVICESCREENWIDTH * VCArray.count, 0);
    //滚动到首页
    [self.scrollView setContentOffset:CGPointMake(DEVICESCREENWIDTH * self.currentIndex, 0) animated:YES];
}
#pragma mark - <UIScrollViewDelegate>
//正在滑动的状态：使滑条也跟着滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat contentX = scrollView.contentOffset.x;
    CGFloat X = contentX * (3 * DEVICESCREENWIDTH / 4) / DEVICESCREENWIDTH / 2;
    //传递应该滑条滑动的x
    [self.navView diliverTheXWithSilderImageView:X];
}
//结束界面的滑动，结果是使UI在一瞬间变化
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //计算总偏移量
    CGFloat x = scrollView.contentOffset.x;
    CGFloat tag = x / DEVICESCREENWIDTH;
    [self.navView silderAction:tag];
}

#pragma mark - <NavDelegate>
//点击了导航栏的按钮后动画跳转到相应界面
- (void)silderView:(NSInteger)tag {
    if (self.currentIndex == tag) {
        return;
    }
    self.currentIndex = tag;
    //动画
    [UIView animateWithDuration:0.3 animations:^{
        self.currentIndex = tag;
        self.scrollView.contentOffset = CGPointMake(DEVICESCREENWIDTH * tag, 0);
    }];
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
