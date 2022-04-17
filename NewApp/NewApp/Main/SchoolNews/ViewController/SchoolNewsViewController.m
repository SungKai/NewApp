//
//  SchoolNewsViewController.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import "SchoolNewsViewController.h"

//V
#import "SchoolNewsTableView.h"

@interface SchoolNewsViewController ()

@property (nonatomic, strong) SchoolNewsTableView *tableView;

@end

@implementation SchoolNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemBlueColor];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
}

#pragma mark-懒加载
- (SchoolNewsTableView *)tableView {
    if (!_tableView) {
        _tableView = [[SchoolNewsTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor systemGreenColor];
    }
    return _tableView;
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
