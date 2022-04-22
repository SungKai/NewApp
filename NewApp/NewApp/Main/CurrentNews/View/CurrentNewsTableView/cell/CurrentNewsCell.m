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
        
        self.backgroundColor = [UIColor colorNamed:@"247_247_247"];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.hintLab];
        [self.contentView addSubview:self.imgView];
        [self setPosition];
        
        self.layer.cornerRadius = 8.0f;
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
        currentCell.titleLab.backgroundColor = [UIColor colorNamed:@"204_204_204"];
        currentCell.hintLab.backgroundColor = [UIColor colorNamed:@"204_204_204"];
    }
    return currentCell;
}

#pragma mark- 方法

//设置分割线的宽度和高度
-(void)setFrame:(CGRect)frame
{
  frame.origin.x = 2;//这里间距为10可以根据自己的情况调整
  frame.size.width -=frame.origin.x;
  frame.size.height -= 3 * frame.origin.x;
  [super setFrame:frame];
}

//设置数据
- (CurrentNewsCell *)cellWithInformation:(CurrentNewsCell *)cell WithTitleText:(NSString *)titleText WithHintText:(NSString *)hintText WithImageURL:(NSString *)imageURL {
    cell.titleLab.text = titleText;
    cell.hintLab.text = hintText;
    cell.titleLab.backgroundColor = [UIColor clearColor];
    cell.hintLab.backgroundColor = [UIColor clearColor];
    [cell calculateTitle:cell AndTitleText:titleText];
    [cell.imgView setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"defaultImage"]];
    [cell setPosition];
    return cell;
}
//设置title行数
- (void)calculateTitle:(CurrentNewsCell *)cell AndTitleText:(NSString *)str{
    CGRect tempTitleFrame = cell.titleLab.frame;
    CGFloat width =  ScreenWidth - 8 - 100 - 10 - 10;
    //得到文字相应的size
    tempTitleFrame.size = [cell.titleLab MaxLabelWidth:str FontOfSize:20 MaxWidth:width  MaxNumberOfLine:2 Interval:3];
    tempTitleFrame.origin = CGPointMake(10, 15);
    cell.titleLab.frame = tempTitleFrame;
}


#pragma mark- 懒加载
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textColor = [UIColor colorNamed:@"51_51_51"];
//        _titleLab.backgroundColor = [UIColor colorNamed:@"51_51_51"];
        _titleLab.font = [UIFont boldSystemFontOfSize:20];
    }
    return _titleLab;
}

- (UILabel *)hintLab {
    if (!_hintLab) {
        _hintLab = [[UILabel alloc] init];
        _hintLab.textColor = [UIColor colorNamed:@"102_102_102"];
        _hintLab.font = [UIFont systemFontOfSize:15];
    }
    return _hintLab;
}

- (UIImageView *)imgView{
    if (!_imgView){
        _imgView = [[UIImageView alloc]init];
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = 5;
        _imgView.backgroundColor = [UIColor colorNamed:@"255_211_176"];
    }
    return _imgView;
}

- (void)setPosition{
    //image
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-8);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(100, 87));
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.imgView.mas_left).offset(-10);
        make.top.equalTo(self.contentView).offset(15);
        
    }];
    
    [self.hintLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.right.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom).offset(10);
    }];
}

@end
