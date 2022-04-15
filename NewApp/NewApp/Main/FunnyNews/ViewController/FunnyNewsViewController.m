//
//  FunnyNewsViewController.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import "FunnyNewsViewController.h"

//View
#import "BannerView.h"

@interface FunnyNewsViewController ()

@property (nonatomic, strong) BannerView *bannerView;

@end

@implementation FunnyNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.bannerView];
}

#pragma mark-懒加载
- (BannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [[BannerView alloc] init];
        _bannerView.backgroundColor = [UIColor blackColor];
        [_bannerView stretchLeft_toPointX:self.view.left offset:20];
        [_bannerView stretchTop_toPointY:self.view.top offset:20];
        [_bannerView stretchRight_toPointX:self.view.right offset:20];
        _bannerView.height = 200;
        
        
    }
    return _bannerView;
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
