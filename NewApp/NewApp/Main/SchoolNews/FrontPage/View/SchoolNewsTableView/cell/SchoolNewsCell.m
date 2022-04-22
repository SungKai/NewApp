//
//  SchoolNewsCell.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/17.
//

#import "SchoolNewsCell.h"
//Tool
#import "Masonry.h"
#import "UILabel+AutoHeight.h"

@implementation SchoolNewsCell

/// 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleLab];
        self.layer.cornerRadius = 10.0f;
        self.layer.masksToBounds = YES;
        [self setFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    }
    return self;
}

#pragma mark - Method
/// 复用池
+ (SchoolNewsCell *)CreateReusableCell:(UITableView *)tableView {
    static NSString *identyfing = @"cell";
    SchoolNewsCell *schoolCell = [tableView dequeueReusableCellWithIdentifier:identyfing];
    if (!schoolCell) {
        schoolCell = [[SchoolNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identyfing];
        schoolCell.titleLab.backgroundColor = [UIColor lightGrayColor];
//        schoolCell.hintLab.backgroundColor = [UIColor systemGreenColor];
    }
    return schoolCell;
}
//载入信息
- (SchoolNewsCell *)cellWithInformation:(SchoolNewsCell *)cell WithTitleText:(NSString *)titleText WithHintText:(NSString *)hintText {
    cell.titleLab.text = titleText;
    cell.titleLab.backgroundColor = [UIColor clearColor];
    cell.hintLab.backgroundColor = [UIColor clearColor];
    [cell calculateTitle:cell AndTitleText:titleText];
    return cell;
}

//设置title行数
- (void)calculateTitle:(SchoolNewsCell *)cell AndTitleText:(NSString *)str{
    CGRect tempTitleFrame = cell.titleLab.frame;
    CGFloat width = ScreenWidth - 2 * 10;
    //得到文字相应的size
    tempTitleFrame.size = [cell.titleLab MaxLabelWidth:str FontOfSize:20 MaxWidth:width  MaxNumberOfLine:2 Interval:3];
    tempTitleFrame.origin = CGPointMake(10, 4);
    cell.titleLab.frame = tempTitleFrame;
}
//设置分割线的宽度和高度
-(void)setFrame:(CGRect)frame
{
  frame.origin.x = 2;//这里间距为10可以根据自己的情况调整
  frame.size.width -= frame.origin.x;
  frame.size.height -= 5 * frame.origin.x;
  [super setFrame:frame];
}

#pragma mark- 懒加载
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.font = [UIFont boldSystemFontOfSize:20];
    }
    return _titleLab;
}
@end
