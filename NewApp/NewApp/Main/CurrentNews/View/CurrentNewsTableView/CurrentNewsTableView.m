//
//  CurrentNewsTableView.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/16.
//

#import "CurrentNewsTableView.h"
#import "CurrentNewsCell.h"


@interface CurrentNewsTableView () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@end

@implementation CurrentNewsTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:UITableViewStyleGrouped];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        //不显示横条
        self.showsVerticalScrollIndicator = NO;
        //不显示分割线
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.wydata = [NSMutableArray array];
    }
    return self;
}


#pragma mark- <UITableViewDataSource>
/// 组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

/// cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.wydata.count;
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

///设置内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //设置无数据状态
    CurrentNewsCell *cell = [CurrentNewsCell CreateReusableCell:tableView];
//    NSLog(@"-------%ld", self.wydata.count);
//    //取出Model里面的数据，把相应数据给相应cell
//    WYNews *dataModel = self.wydata[indexPath.row];
//
//    return  [cell cellWithInformation:cell WithTitleText:dataModel.title WithHintText:dataModel.digest WithImageURL:dataModel.imgURL];
    return cell;
}

#pragma mark- <UITableViewDelegate>
/// 设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
