//
//  FunnyNewsViewController.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import "FunnyNewsViewController.h"
#import "WaterFlowView.h"
#import "WaterFlowCell.h"
#import "WaterFlowLayout.h"

//View
#import "BannerView.h"
//Tool
#import "UIView+RoundCorner.h"

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
    
    //注册单元格
    [self.waterFlowView registerClass:[WaterFlowCell class] forCellWithReuseIdentifier:@"cell"];
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

//- (WaterFlowView *)waterFlowView {
//    if (!_waterFlowView) {
//        WaterFlowLayout *layout = [[WaterFlowLayout alloc] init];
////        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        _waterFlowView = [[WaterFlowView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
//        _waterFlowView.backgroundColor = [UIColor systemPinkColor];
//        _waterFlowView.delegate = self;
//        _waterFlowView.dataSource = self;
//
//    }
//    return _waterFlowView;
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
