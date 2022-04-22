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
        self.backgroundColor = [UIColor colorNamed:@"237_237_237"];
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
    if (!_message) {
        _message = [[UIButton alloc] init];
        _message.backgroundColor = [UIColor clearColor];
        [_message setImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
        [_message setTitle:@"消息" forState:UIControlStateNormal];
        [_message setTitleColor:[UIColor colorNamed:@"254_149_87"] forState:UIControlStateNormal];
        [_message setTitleEdgeInsets:UIEdgeInsetsMake(_message.currentImage.size.height, -_message.currentImage.size.width, -20, -20)];
       
//        [_message setTitleEdgeInsets:UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)]
        
        _message.titleLabel.font = [UIFont systemFontOfSize:20];
        
    }
    return _message;
}
- (UIButton *)collection {
    if (!_collection) {
        _collection = [[UIButton alloc] init];
        [_collection setImage:[UIImage imageNamed:@"收藏"] forState:UIControlStateNormal];
        [_collection setTitle:@"收藏" forState:UIControlStateNormal];
        [_collection setTitleColor:[UIColor colorNamed:@"254_149_87"] forState:UIControlStateNormal];
        [_collection setTitleEdgeInsets:UIEdgeInsetsMake(_collection.currentImage.size.height, -_collection.currentImage.size.width + 4, -15, -20)];
        _collection.titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return _collection;
}

- (UIButton *)exit {
    if (!_exit) {
        _exit = [[UIButton alloc] init];
        [_exit setImage:[UIImage imageNamed:@"退出"] forState:UIControlStateNormal];
        [_exit setTitle:@"退出" forState:UIControlStateNormal];
        [_exit setTitleColor:[UIColor colorNamed:@"254_149_87"] forState:UIControlStateNormal];
        [_exit setTitleEdgeInsets:UIEdgeInsetsMake(_exit.currentImage.size.height, -_exit.currentImage.size.width + 4, -10, -20)];
        
        _exit.titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return _exit;
}

- (void)setPosition {
    [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(40);
        make.top.equalTo(self.mas_top).offset(30);
        make.size.mas_equalTo(CGSizeMake(62, 62));
    }];
    
    [self.collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.message).offset(-5);
        make.size.mas_equalTo(CGSizeMake(65, 65));
    }];

    [self.exit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-40);
        make.top.equalTo(self.message);
        make.size.mas_equalTo(CGSizeMake(60, 60));
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
