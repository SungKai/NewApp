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
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.hintLab];
        [self.contentView addSubview:self.imgView];
        [self setPosition];
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

#pragma mark- 方法
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
        _titleLab.font = [UIFont boldSystemFontOfSize:17];
        
        _titleLab.frame = CGRectMake(20, 15, ScreenWidth, 43);
    }
    return _titleLab;
}

- (UILabel *)hintLab {
    if (!_hintLab) {
        _hintLab = [[UILabel alloc] init];
        _hintLab.textColor = [UIColor blackColor];
    
        _hintLab.font = [UIFont systemFontOfSize:14];
        _hintLab.frame = CGRectMake(20, 64, ScreenWidth, 16);
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
}

@end
