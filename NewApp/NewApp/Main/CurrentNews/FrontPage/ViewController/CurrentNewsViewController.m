//
//  CurrentNewsViewController.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import "CurrentNewsViewController.h"
//M
#import "WYNewsModel.h"
//View
#import "CurrentNewsTableView.h"

@interface CurrentNewsViewController () <
    CurrentNewsTableViewDelegate
>

@property (nonatomic, strong) CurrentNewsTableView *tableView;

@property (nonatomic, strong) WYNewsModel *wyNewModel;

@end

@implementation CurrentNewsViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemYellowColor];
   
    [self.view addSubview:self.tableView];
    //下拉刷新
    UIRefreshControl *control = [[UIRefreshControl alloc]init];
    [control addTarget:self action:@selector(refreshTableView) forControlEvents:UIControlEventValueChanged];
    self.tableView.refreshControl = control;
    [self loadNewData];
}
#pragma mark - Method
//下拉刷新
- (void)refreshTableView{
    [self loadNewData];
}
//加载数据
- (void)loadNewData {
    __weak typeof(self) weakSelf = self;
    [self.wyNewModel
     requestSuccess:^{
        if ([self.tableView.refreshControl isRefreshing]) {
            [self.tableView.refreshControl endRefreshing];
        }
        //传递数据给View
        weakSelf.tableView.wydata = weakSelf.wyNewModel.newsAry;
        //刷新
        [self.tableView reloadData];
    }
     failure:^(NSError * _Nonnull error) {
    }];
}

#pragma mark - Delegate

// MARK: <CurrentNewsTableViewDelegate>
///跳转到时事新闻详情界面
- (void)clickGainIndexPath:(NSIndexPath *)indexPath {
    CNNextViewController *cnNextVC = [[CNNextViewController alloc] initWithURL:self.wyNewModel.newsAry[indexPath.row].newsURL];
    [self.cnVCDelegete jumpToCNNextVC:cnNextVC];
}

#pragma mark - Getter
- (CurrentNewsTableView *)tableView {
    if (!_tableView) {
        _tableView = [[CurrentNewsTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor colorNamed:@"237_237_237"];
        _tableView.cnVDelegate = self;
//        _tableView.estimatedRowHeight = 0;
//        _tableView.estimatedSectionHeaderHeight = 0;
//        _tableView.estimatedSectionFooterHeight = 0;
    }
    return _tableView;
}
//wyNewModel
- (WYNewsModel *)wyNewModel {
    if (!_wyNewModel) {
        _wyNewModel = [[WYNewsModel<UITableViewDataSource> alloc] init];
    }
    return _wyNewModel;
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
