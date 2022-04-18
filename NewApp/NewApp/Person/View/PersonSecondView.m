//
//  PersonSecondView.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/18.
//

#import "PersonSecondView.h"
#import "Masonry.h"
#import "UIView+RoundCorner.h"

@implementation PersonSecondView


- (instancetype)initWithSecondView {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.frame = CGRectMake(20, 300, ScreenWidth - 40, 150);
        [self applyRoundCorners:UIRectCornerAllCorners radius:20];
        [self addSubview:self.message];
        [self addSubview:self.collection];
        [self addSubview:self.exit];
        
        [self setPosition];
    }
    return self;
}

#pragma mark- 懒加载
- (UIButton *)message {
    if (_message) {
        _message = [[UIButton alloc] init];
        
    }
    return _message;
}
- (UIButton *)collection {
    if (_collection) {
        _collection = [[UIButton alloc] init];
       
    }
    return _collection;
}

- (UIButton *)exit {
    if (_exit) {
        _exit = [[UIButton alloc] init];
        
    }
    return _exit;
}

- (void)setPosition {
    [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(10);
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
