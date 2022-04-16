//
//  CurrentNewsCell.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/15.
//

#import "CurrentNewsCell.h"

@implementation CurrentNewsCell

/// 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.hintLab];
    }
    return self;
}

/// 复用池
+ (CurrentNewsCell *)CreateReusableCell:(UITableView *)tableView {
    static NSString *identyfing = @"cell";
    CurrentNewsCell *currentCell = [tableView dequeueReusableCellWithIdentifier:identyfing];
    if (!currentCell) {
        currentCell = [[CurrentNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identyfing];
    }
    return currentCell;
}

#pragma mark- 懒加载
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.font = [UIFont boldSystemFontOfSize:17];
    }
    return _titleLab;
}

- (UILabel *)hintLab {
    if (!_hintLab) {
        _hintLab = [[UILabel alloc] init];
        _hintLab.textColor = [UIColor blackColor];
        _hintLab.textColor = [UIColor systemGrayColor];
    }
    return _hintLab;
}


@end
