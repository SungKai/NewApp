//
//  PersonFirstView.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/18.
//

#import "PersonFirstView.h"
#import "Masonry.h"
#import "UIView+RoundCorner.h"

@implementation PersonFirstView

- (instancetype)initWithFirstView {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.frame = CGRectMake(20, 80, ScreenWidth - 40, 200);
        [self applyRoundCorners:UIRectCornerAllCorners radius:20];
        
        [self addSubview:self.personName];
        [self addSubview:self.signature];
        [self addSubview:self.timeCalculate];
        [self addSubview:self.headImgView];
        
        [self setPosition];
    }
    return self;
}

#pragma mark- 懒加载
- (UILabel *)personName {
    if (!_personName) {
        _personName = [[UILabel alloc] init];
        _personName.text = @"NAME";
        _personName.textColor = [UIColor whiteColor];
        _personName.font = [UIFont boldSystemFontOfSize:45];
    }
    return _personName;
}

- (UILabel *)signature {
    if (!_signature) {
        _signature = [[UILabel alloc] init];
        _signature.text = @"或许这里有一段励志语";
        _signature.textColor = [UIColor whiteColor];
    }
    return _signature;
}

- (UILabel *)timeCalculate {
    if (!_timeCalculate) {
        _timeCalculate = [[UILabel alloc] init];
        _timeCalculate.text = @"已阅读xx时xx分";
        _timeCalculate.font = [UIFont systemFontOfSize:20];
    }
    return _timeCalculate;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc] init];
        _headImgView.backgroundColor = [UIColor colorWithRed:0.7 green:0.9 blue:1 alpha:1];
        _headImgView.layer.cornerRadius = 50;
        
    }
    return _headImgView;
}

- (void)setPosition {
    [self.personName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(40);
    }];
    
    [self.signature mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.personName);
        make.top.equalTo(self.personName.mas_bottom);
    }];
    
    [self.timeCalculate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.signature);
        make.top.equalTo(self.signature.mas_bottom).offset(30);
    }];
    
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self).offset(20);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
