//
//  SchoolNewsViewController.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import "SchoolNewsViewController.h"
//VC
#import "SNNextViewController.h"
//V
#import "SchoolNewsTableView.h"
//M
#import "SNModel.h"

@interface SchoolNewsViewController () <
    SchoolNewsTableViewDelegate,
    SNNextViewControllerDelegete
>

@property (nonatomic, strong) SchoolNewsTableView *tableView;

@property (nonatomic, strong) NSArray<SNModel *> *dataArray;

@end

@implementation SchoolNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemBlueColor];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    //传递数据给View
    self.tableView.SNData = self.dataArray;

//    //把数据传递给SNNextVC
//    [self.snFrontDelegete gainArrayDataToNext:self.dataArray];
}

#pragma mark - Getter
- (SchoolNewsTableView *)tableView {
    if (!_tableView) {
        _tableView = [[SchoolNewsTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor lightGrayColor];
        _tableView.schoolDelegate = self;
    }
    return _tableView;
}
- (NSArray *)dataArray {
    if (!_dataArray) {
        //获取plist文件的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"schoolNews.plist" ofType:nil];
        //根据文件路径获取plist文件
        NSArray *arrryDicts = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *maArray = [NSMutableArray array];
        for (NSDictionary *dic in arrryDicts) {
            SNModel *snModel = [[SNModel alloc] init];
            [snModel SNModelWithDic:dic];
            [maArray addObject:snModel];
        }
        _dataArray = maArray;
        NSLog(@"=============%ld", _dataArray.count);
    }
    return _dataArray;
}
#pragma mark - Delegete

// MARK:  <SchoolNewsTableViewDelegate>
- (void)clickGainIndexPath:(NSIndexPath *)indexPath {
    //传给下一个VC该新闻所在的index
    SNNextViewController *snNextVC = [[SNNextViewController alloc] initWithTitleLab:self.dataArray[indexPath.row].title TextLab:self.dataArray[indexPath.row].text];
    snNextVC.SNNextViewControllerDelegete = self;
    [self.SchoolNewsViewControllerDelegete jumpToNextVC:snNextVC];
}
#pragma mark - <SNNextViewControllerDelegete>
- (void)back {
    [self.SchoolNewsViewControllerDelegete jumpToFrontVC];
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
