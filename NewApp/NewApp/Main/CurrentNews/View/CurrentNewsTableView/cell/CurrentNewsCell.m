//
//  CurrentNewsCell.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/15.
//

#import "CurrentNewsCell.h"
#import "Masonry.h"
#import "UIView+RoundCorner.h"
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
        
        self.layer.cornerRadius=5.0f;
        self.layer.masksToBounds=YES;
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
    [cell setPosition];
    return cell;
}



#pragma mark- 懒加载
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.font = [UIFont systemFontOfSize:26];
        
        _titleLab.text = @"xinwen";
    }
    return _titleLab;
}

- (UILabel *)hintLab {
    if (!_hintLab) {
        _hintLab = [[UILabel alloc] init];
        _hintLab.textColor = [UIColor blackColor];
    
        _hintLab.font = [UIFont systemFontOfSize:15];
        _hintLab.text = @"texttexthinthint";
    }
    return _hintLab;
}

- (UIImageView *)imgView{
    if (!_imgView){
        _imgView = [[UIImageView alloc]init];
        _imgView.backgroundColor = [UIColor grayColor];
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = 4;
        _imgView.backgroundColor = [UIColor lightGrayColor];
    }
    return _imgView;
}


- (void)setPosition{
    //image
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-18);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(76, 76));
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20);
        make.top.equalTo(self.contentView).offset(15);
        
    }];
    
    [self.hintLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom).offset(5);
    }];
}

@end
