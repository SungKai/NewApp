//
//  FNNextViewController.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/23.
//

#import "FNNextViewController.h"
#import <WebKit/WebKit.h>

@interface FNNextViewController () <
    WKNavigationDelegate
>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation FNNextViewController

- (instancetype)initWithURL:(NSString *)url {
    self = [super init];
    if (self) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    }
    return self;
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.webView];
    self.webView.hidden = YES;
}

#pragma mark - Method

#pragma mark - Getter
- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] init];
        _webView.frame = CGRectMake(0, StatusBarHeight, ScreenWidth, ScreenHeight);
        _webView.navigationDelegate = self;
    }
    return _webView;
}
#pragma mark - Delegate

// MARK: <WKNavigationDelegate>
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    //屏蔽最顶部打开知乎日报和最底部进入知乎（去除页面”广告“元素）
    [webView evaluateJavaScript:@"document.getElementsByClassName('Daily')[0].remove();document.getElementsByClassName('    view-more')[0].remove();" completionHandler:nil];
// 移除控件有一个动画，会出现一闪而过的移除的动画，体验不太好。可以在WKWebView加载内容之前先进行隐藏，然后在block中显示，并且显示的时候要做一个延时
    dispatch_time_t delayTime =dispatch_time(DISPATCH_TIME_NOW, (int64_t)(50/*延迟执行时间*/*NSEC_PER_MSEC));
    dispatch_after(delayTime,dispatch_get_main_queue(), ^{
        self.webView.hidden = NO;//展示页面
    });
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
