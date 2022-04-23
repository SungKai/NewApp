//
//  FunnyNewsViewController.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import "FunnyNewsViewController.h"

//View
#import "BannerView.h"
#import "WaterFlowView.h"
//M
#import "ZHNewsModel.h"
//Tool
#import "UIView+RoundCorner.h"

@interface FunnyNewsViewController ()

@property (nonatomic, strong) BannerView *bannerView;

@property (nonatomic, strong) WaterFlowView *waterFlowView;

@property (nonatomic, strong) ZHNewsModel *zhNewsModel;

@end

@implementation FunnyNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorNamed:@"238_238_238"];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.bannerView];
    //请求Latest数据
    __weak typeof(self) weakSelf = self;
    [self.zhNewsModel requestLastest:^{
        //1.banner
        weakSelf.bannerView.bannerZHData = weakSelf.zhNewsModel.topNewsModel;
        //2.cell
        weakSelf.waterFlowView.cellZHData = weakSelf.zhNewsModel.bodyNewsModel;

    } failure:^(NSError * _Nonnull error) {
        
    }];
}

#pragma mark-懒加载
- (BannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [[BannerView alloc] init];
        _bannerView.backgroundColor = [UIColor colorNamed:@"254_149_87"];
        [_bannerView stretchLeft_toPointX:self.view.left offset:20];
        [_bannerView stretchTop_toPointY:self.view.top offset:20];
        [_bannerView stretchRight_toPointX:self.view.right offset:20];
        _bannerView.height = 200;
        
        [_bannerView applyRoundCorners:UIRectCornerAllCorners radius:10];
    }
    return _bannerView;
}
- (WaterFlowView *)waterFlowView {
    if (!_waterFlowView) {
        _waterFlowView = [[WaterFlowView alloc] init];
        
    }
    return _waterFlowView;
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
