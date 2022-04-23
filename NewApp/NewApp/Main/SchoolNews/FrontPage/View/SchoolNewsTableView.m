//
//  SchoolNewsTableView.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/16.
//

#import "SchoolNewsTableView.h"

@interface SchoolNewsTableView () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@end

@implementation SchoolNewsTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:UITableViewStyleGrouped];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        //不显示横条
        self.showsVerticalScrollIndicator = NO;
        //不限时分割线
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.SNData = [NSArray<SNModel *> array];
        
    }
    return self;
}

#pragma mark - <UITableViewDataSource>
///组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

/// cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.SNData.count;
}

///设置内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //设置无数据状态
    SchoolNewsCell *cell = [SchoolNewsCell CreateReusableCell:tableView];
    //取出Model里面的数据，把相应数据给相应cell
    SNModel *dataModel = self.SNData[indexPath.row];
    return [cell cellWithInformation:cell WithTitleText:dataModel.title WithHintText:dataModel.text];
//    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

#pragma mark- <UITableViewDelegate>
/// 设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}
//单击新闻跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //cell变灰
    SchoolNewsCell *cell = [self cellForRowAtIndexPath:indexPath];
    cell.titleLab.textColor = [UIColor grayColor];
    //跳转事件传递indexPath
    [self.schoolDelegate clickGainIndexPath:indexPath];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
