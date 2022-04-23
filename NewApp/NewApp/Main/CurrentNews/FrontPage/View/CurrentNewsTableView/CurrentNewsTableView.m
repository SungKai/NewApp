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
    }
    return self;
}


#pragma mark - <UITableViewDataSource>
/// 组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

/// cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wydata.count;
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
    //取出Model里面的数据，把相应数据给相应cell
    WYNews *dataModel = self.wydata[indexPath.row];

    return  [cell cellWithInformation:cell WithTitleText:dataModel.title WithHintText:dataModel.digest WithImageURL:dataModel.imgURL];
}

#pragma mark - Delegate

// MARK: <UITableViewDelegate>
/// 设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}

///单击cell跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.cnVDelegate clickGainIndexPath:indexPath];
    
}
#pragma mark - Getter
- (NSArray<WYNews *> *)wydata {
    if (!_wydata) {
        _wydata = [[NSArray<WYNews *> alloc] init];
    }
    return _wydata;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
