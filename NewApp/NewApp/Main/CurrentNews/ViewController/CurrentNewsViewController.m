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

@interface CurrentNewsViewController ()

@property (nonatomic, strong) CurrentNewsTableView *tableView;

@end

@implementation CurrentNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemYellowColor];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
}

#pragma mark-懒加载
- (CurrentNewsTableView *)tableView {
    if (!_tableView) {
        _tableView = [[CurrentNewsTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor grayColor];
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
