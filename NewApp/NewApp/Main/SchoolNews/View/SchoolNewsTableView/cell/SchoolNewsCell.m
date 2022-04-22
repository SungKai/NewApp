//
//  SchoolNewsCell.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/17.
//

#import "SchoolNewsCell.h"
#import "Masonry.h"

@implementation SchoolNewsCell

/// 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor colorNamed:@"247_247_247"];
        [self.contentView addSubview:self.titleLab];
//        [self.contentView addSubview:self.hintLab];
        [self setPosition];
        
        self.layer.cornerRadius=10.0f;
        self.layer.masksToBounds=YES;
        [self setFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    }
    return self;
}

/// 复用池
+ (SchoolNewsCell *)CreateReusableCell:(UITableView *)tableView {
    static NSString *identyfing = @"cell";
    SchoolNewsCell *schoolCell = [tableView dequeueReusableCellWithIdentifier:identyfing];
    if (!schoolCell) {
        schoolCell = [[SchoolNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identyfing];
        schoolCell.titleLab.backgroundColor = [UIColor colorNamed:@"204_204_204"];
//        schoolCell.hintLab.backgroundColor = [UIColor systemGreenColor];
    }
    return schoolCell;
}

- (SchoolNewsCell *)cellWithInformation:(SchoolNewsCell *)cell WithTitleText:(NSString *)titleText WithHintText:(NSString *)hintText {
    cell.titleLab.text = titleText;
//    cell.hintLab.text = hintText;
    cell.titleLab.backgroundColor = [UIColor clearColor];
    cell.hintLab.backgroundColor = [UIColor clearColor];

    return cell;
}

//设置分割线的宽度和高度
-(void)setFrame:(CGRect)frame
{
  frame.origin.x =2;//这里间距为10可以根据自己的情况调整
  frame.size.width -=frame.origin.x;
  frame.size.height -= 5 * frame.origin.x;
  [super setFrame:frame];
}

#pragma mark- 懒加载
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.font = [UIFont boldSystemFontOfSize:26];
        _titleLab.text = @"教务在线";
    }
    return _titleLab;
}

//- (UILabel *)hintLab {
//    if (!_hintLab) {
//        _hintLab = [[UILabel alloc] init];
//        _hintLab.textColor = [UIColor blackColor];
//        _hintLab.textColor = [UIColor systemGrayColor];
//        _hintLab.font = [UIFont systemFontOfSize:15];
//
//        _hintLab.text = @"hintTitle";
//    }
//    return _hintLab;
//}

- (void)setPosition {
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20);
        make.top.equalTo(self.contentView).offset(15);
    }];
    
//    [self.hintLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.titleLab);
//        make.top.equalTo(self.titleLab.mas_bottom).offset(5);
//    }];
}

@end
