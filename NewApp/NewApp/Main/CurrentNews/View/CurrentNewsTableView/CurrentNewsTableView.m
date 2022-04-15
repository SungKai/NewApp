//
//  CurrentNewsTableView.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/16.
//

#import "CurrentNewsTableView.h"

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


#pragma mark- <UITableViewDataSource>
/// 组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

/// cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}


#pragma mark- <UITableViewDelegate>
/// 设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CurrentNewsCell *cell = [[CurrentNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"标题%ld", (long)indexPath.row];
    return cell;
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
