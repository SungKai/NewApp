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
#import "WaterFlowCell.h"
#import "WaterFlowLayout.h"
//Tool
#import "UIView+RoundCorner.h"
static NSString *CellIdentifier = @"Cell";

@interface FunnyNewsViewController () 

/// Banner
@property (nonatomic, strong) BannerView *bannerView;

///瀑布布局
@property (nonatomic, strong) WaterFlowView *waterFlowView;

@end

@implementation FunnyNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.bannerView];
    [self.view addSubview:self.waterFlowView];
    [self.view bringSubviewToFront:self.bannerView];
    //注册
    [self.waterFlowView registerClass:[WaterFlowCell class] forCellWithReuseIdentifier:CellIdentifier];
    
    
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
        
        [_bannerView applyRoundCorners:UIRectCornerAllCorners radius:10];
    }
    return _bannerView;
}

- (WaterFlowView *)waterFlowView {
    if (!_waterFlowView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _waterFlowView = [[WaterFlowView alloc] initWithFrame:CGRectMake(0, self.bannerView.height + 20, ScreenWidth, ScreenHeight) collectionViewLayout:layout];
        
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
