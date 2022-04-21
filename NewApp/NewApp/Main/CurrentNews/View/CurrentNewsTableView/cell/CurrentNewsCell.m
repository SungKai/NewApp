//
//  CurrentNewsCell.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/15.
//

#import "CurrentNewsCell.h"
//Tool
#import "Masonry.h"
#import "UIView+RoundCorner.h"
#import <UIImageView+AFNetworking.h>
#import "UILabel+AutoHeight.h"
@implementation CurrentNewsCell

/// 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.hintLab];
        [self.contentView addSubview:self.imgView];
        [self setPosition];
        
        self.layer.cornerRadius = 10.0f;
        self.layer.masksToBounds = YES;
        [self setFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    }
    return self;
}

/// 复用池
+ (CurrentNewsCell *)CreateReusableCell:(UITableView *)tableView {
    static NSString *identyfing = @"cell";
    CurrentNewsCell *currentCell = [tableView dequeueReusableCellWithIdentifier:identyfing];
    if (!currentCell) {
        currentCell = [[CurrentNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identyfing];
        currentCell.titleLab.backgroundColor = [UIColor orangeColor];
        currentCell.hintLab.backgroundColor = [UIColor systemPinkColor];
    }
    return currentCell;
}

#pragma mark- 方法

//设置分割线的宽度和高度
-(void)setFrame:(CGRect)frame
{
  frame.origin.x =2;//这里间距为10可以根据自己的情况调整
  frame.size.width -=frame.origin.x;
  frame.size.height -= 5 * frame.origin.x;
  [super setFrame:frame];
}

//设置数据
- (CurrentNewsCell *)cellWithInformation:(CurrentNewsCell *)cell WithTitleText:(NSString *)titleText WithHintText:(NSString *)hintText WithImageURL:(NSString *)imageURL {
    cell.titleLab.text = titleText;
    cell.hintLab.text = hintText;
    cell.titleLab.backgroundColor = [UIColor clearColor];
    cell.hintLab.backgroundColor = [UIColor clearColor];
//    [cell calculateTitle:cell AndTitleText:titleText];
    [cell.imgView setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"defaultImage"]];
    [cell setPosition];
    return cell;
}
//设置title行数
- (void)calculateTitle:(CurrentNewsCell *)cell AndTitleText:(NSString *)str{
    CGRect tempTitleFrame = cell.titleLab.frame;
    //得到文字相应的size
//    tempTitleFrame.size = [cell.titleLab MaxLabelWidth:str FontOfSize:20 MaxWidth:WIDTH  MaxNumberOfLine:2 Interval:3];
    tempTitleFrame.origin = CGPointMake(20, 15);
    cell.titleLab.frame = tempTitleFrame;
    cell.hintLab.frame = CGRectMake(cell.titleLab.frame.origin.x, cell.titleLab.frame.origin.y + cell.titleLab.frame.size.height + 3, cell.titleLab.frame.size.width, 16);
}


#pragma mark- 懒加载
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.backgroundColor = [UIColor lightGrayColor];
        _titleLab.font = [UIFont boldSystemFontOfSize:20];
    }
    return _titleLab;
}

- (UILabel *)hintLab {
    if (!_hintLab) {
        _hintLab = [[UILabel alloc] init];
        _hintLab.backgroundColor = [UIColor lightGrayColor];
        _hintLab.font = [UIFont systemFontOfSize:15];
    }
    return _hintLab;
}

- (UIImageView *)imgView{
    if (!_imgView){
        _imgView = [[UIImageView alloc]init];
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = 12;
        _imgView.backgroundColor = [UIColor lightGrayColor];
    }
    return _imgView;
}
//x-xcode-debug-views://33e0a80b0?DBGViewDebuggerLaunchSessionParameter=33e0a80b0 The layer is masked by a `CAShapeLayer` with a path that's a rect, a rounded-rect, or an ellipse. Instead, use an appropriately transformed container layer with `cornerRadius` and `masksToBounds` set.

- (void)setPosition{
    //image
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.imgView.mas_left).offset(-10);
        make.top.equalTo(self.contentView).offset(15);
        
    }];
    
    [self.hintLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.right.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom).offset(5);
    }];
}

@end
