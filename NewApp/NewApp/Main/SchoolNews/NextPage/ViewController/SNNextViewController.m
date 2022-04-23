//
//  SNNextViewController.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/21.
//

#import "SNNextViewController.h"
//V
#import "SNNextView.h"

@interface SNNextViewController () <
    SNNextViewDelegete
>

@property (nonatomic, strong) NSArray *nextData;

@property (nonatomic, strong) SNNextView *snNextView;

@end

@implementation SNNextViewController

- (instancetype)initWithTitleLab:(NSString *)titleLab TextLab:(NSString *)textLab {
    self = [super init];
    if (self) {
        [self.view addSubview:self.snNextView];
        //传递数据
        [self.snNextView gainTitleLab:titleLab TextLab:textLab];
    }
    return self;
}
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view.
}

#pragma mark - Method

#pragma mark - Delegete
// MARK: <SNNextViewDelegete>
- (void)back {
    [self.SNNextViewControllerDelegete back];
}

#pragma mark - Getter
- (SNNextView *)snNextView {
    if (!_snNextView) {
        _snNextView = [[SNNextView alloc] initWithFrame:CGRectMake(0, StatusBarHeight, ScreenWidth, ScreenHeight)];
        _snNextView.SNNextViewDelegete = self;
    }
    return _snNextView;
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
