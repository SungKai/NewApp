//
//  WaterFlowCell.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/20.
//

#import "WaterFlowCell.h"
#import "Masonry.h"

@implementation WaterFlowCell

- (instancetype)initWithCell {
    self = [super self];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.hintLab];
        [self.contentView addSubview:self.imgView];
        [self setPosition];
        
    }
    return self;
}


#pragma mark- 懒加载
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.font = [UIFont systemFontOfSize:20];
    }
    return _titleLab;
}

- (UILabel *)hintLab {
    if (!_hintLab) {
        _hintLab = [[UILabel alloc] init];
        _hintLab.textColor = [UIColor grayColor];
        _hintLab.font = [UIFont systemFontOfSize:15];
    }
    return _hintLab;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.backgroundColor = [UIColor grayColor];
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = 4;
        _imgView.backgroundColor = [UIColor lightGrayColor];
    }
    return _imgView;
}

#pragma mark- 方法
- (WaterFlowCell *)cellWithInformation:(WaterFlowCell *)cell WithTitleText:(NSString *)titleText WithHintText:(NSString *)hintText WithImageURL:(NSString *)imageURL {
    cell.titleLab.text = titleText;
    cell.hintLab.text = hintText;
    cell.titleLab.backgroundColor = [UIColor clearColor];
    cell.hintLab.backgroundColor = [UIColor clearColor];
    [cell setPosition];
    return cell;
}

- (void)setPosition {
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20);
    }];
}


@end
