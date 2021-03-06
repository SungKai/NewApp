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
#import "TopView.h"
#import "NavView.h"

#import "WYNewsModel.h"
#import "ZHNewsModel.h"

@interface MainViewController () <
    UIScrollViewDelegate,
    NavViewDelegate,
    CurrentNewsViewControllerDelegete,
    SchoolNewsViewControllerDelegete
>

@property (nonatomic, strong) CurrentNewsViewController *curVC;

@property (nonatomic, strong) FunnyNewsViewController *funVC;

@property (nonatomic, strong) SchoolNewsViewController *schoolVC;

@property (nonatomic, strong) TopView *topView;

@property (nonatomic, strong) NavView *navView;

//用于实现左右滑动切换界面
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, assign) NSInteger currentIndex;

#pragma mark - SSR Test

@property (nonatomic, strong) WYNewsModel *wyNewModel;

@property (nonatomic, strong) ZHNewsModel *zhNewModel;

@end

@implementation MainViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.view.backgroundColor = UIColor.whiteColor;
    }
    return self;
}
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.navView];
    [self setMainScrollView];
    //设置默认
    self.currentIndex = 0;
    [self.navView silderAction:self.currentIndex];
    
    
    
    self.zhNewModel = [[ZHNewsModel alloc] init];
    [self.zhNewModel
     requestLastest:^{
        NSLog(@"bbbbb");
        [self requestBefore];
    }
     failure:^(NSError * _Nonnull error) {
        
    }];
}

- (void)requestBefore {
    NSInteger count = self.zhNewModel.bodyNewsModel.count;
    [self.zhNewModel
     requestBeforeDate:self.zhNewModel.bodyNewsModel[count - 1].date
     success:^{
        NSLog(@"%@", self);
    }
     failure:^(NSError *error) {
        
    }];
}
#pragma mark - Method
- (void)setMainScrollView {
    [self.view addSubview:self.scrollView];
    //分别添加各个VC
    NSArray *VCArray = @[self.curVC.view, self.funVC.view, self.schoolVC.view];
    //逐一加入scrollView
    for (int i = 0; i < VCArray.count; i++) {
        UIView *pageView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth * i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        [pageView addSubview:VCArray[i]];
        [self.scrollView addSubview:pageView];
    }
    //给scrollView设置好偏移尺寸
    self.scrollView.contentSize = CGSizeMake(ScreenWidth * VCArray.count, 0);
    //滚动到首页
    [self.scrollView setContentOffset:CGPointMake(ScreenWidth * self.currentIndex, 0) animated:YES];
}

#pragma mark - Delegate

// MARK: <UIScrollViewDelegate>

//正在滑动的状态：使滑条也跟着滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat contentX = scrollView.contentOffset.x;
    CGFloat X = contentX * (3 * ScreenWidth / 4) / ScreenWidth / 2;
    //传递应该滑条滑动的x
    [self.navView diliverTheXWithSilderImageView:X];
}
//结束界面的滑动，结果是使UI在一瞬间变化
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //计算总偏移量
    CGFloat x = scrollView.contentOffset.x;
    CGFloat tag = x / ScreenWidth;
    [self.navView silderAction:tag];
}

// MARK:  <NavDelegate>

//点击了导航栏的按钮后动画跳转到相应界面
- (void)silderView:(NSInteger)tag {
    if (self.currentIndex == tag) {
        return;
    }
    self.currentIndex = tag;
    //动画
    [UIView animateWithDuration:0.3 animations:^{
        self.currentIndex = tag;
        self.scrollView.contentOffset = CGPointMake(ScreenWidth * tag, 0);
    }];
}

// MARK: <CurrentNewsViewControllerDelegete>
//时事新闻跳转到新闻详情页
- (void)jumpToCNNextVC:(CNNextViewController *)cnNextVC {
    [self.navigationController pushViewController:cnNextVC animated:YES];
}

// MARK:  <SchoolNewsViewControllerDelegete>
//教务新闻页跳转到教务新闻详情页
- (void)jumpToSNNextVC:(SNNextViewController *)snNextVC {
    [self.navigationController pushViewController:snNextVC animated:YES];
}
///从nextVC跳回frontVC
- (void)jumpToFrontVC {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Getter
//scrollView
- (UIScrollView *)scrollView {
    if (!_scrollView) {
//        CGFloat a = StatusBarHeight;
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.navView.frame.origin.y + self.navView.frame.size.height, self.view.width, self.view.height - self.navView.frame.origin.y)];
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
        _curVC.cnVCDelegete = self;
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
        _schoolVC.SchoolNewsViewControllerDelegete = self;
    }
    return _schoolVC;
}

//navView
- (NavView *)navView {
    if (!_navView) {
        _navView = [[NavView alloc] initWithFrame:CGRectMake(0, self.topView.frame.origin.y + self.topView.frame.size.height, self.view.width, 40)];
        _navView.delegate = self;
    }
    return _navView;
}
//topView
- (TopView *)topView {
    if (!_topView) {
        _topView = [[TopView alloc] initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height, ScreenWidth, 60)];
    }
    return _topView;
}


@end
