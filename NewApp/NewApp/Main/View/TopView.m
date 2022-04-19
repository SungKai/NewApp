//
//  TopView.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/12.
//

#import "TopView.h"

#import "UIView+Frame.h"
#import "NSDate+Day.h"
#import "Masonry.h"

@implementation TopView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.brownColor;
        self.frame = frame;
        
        [self addSubview:self.personalBtn];
        [self addSubview:self.nameLbl];
        [self  addSubview:self.line1];
        [self addSubview:self.monthNumber];
        [self addSubview:self.dayNumber];
        [self addSubview:self.line2];
        [self addSubview:self.dayDate];
        //放置位置
        [self setPosition];
        //加载日期
        self.monthNumber.text = [NSString stringWithFormat:@"%@月", [[NSDate today] month]];
        self.dayNumber.text = [NSString stringWithFormat:@"%@日", [[NSDate today] day]];
        self.dayDate.text = [NSString stringWithFormat:@"星期%@", [[NSDate today] weekTransformChinese]];
    }
    return self;
}

#pragma mark-懒加载
- (UIButton *)personalBtn {
    if (!_personalBtn) {
        _personalBtn = [[UIButton alloc] init];
        _personalBtn.layer.masksToBounds = YES;
        _personalBtn.layer.cornerRadius = 25;
        _personalBtn.backgroundColor = [UIColor colorWithRed:0.7 green:0.9 blue:1 alpha:1];
    }
    return _personalBtn;
}

- (UILabel *)nameLbl {
    if (!_nameLbl) {
        _nameLbl = [[UILabel alloc] init];
        _nameLbl.text = @"用户名";
        _nameLbl.font = [UIFont systemFontOfSize:20];
        _nameLbl.textColor = [UIColor greenColor];
    }
    return _nameLbl;
}


- (UILabel *)line1 {
    if (!_line1) {
        _line1 = [[UILabel alloc] init];
        _line1.text = @"|";
        _line1.textColor = [UIColor whiteColor];
        _line1.font = [UIFont systemFontOfSize:40];
        
    }
    return _line1;
}

- (UILabel *)monthNumber {
    if (!_monthNumber) {
        _monthNumber = [[UILabel alloc] init];
        _monthNumber.textColor = [UIColor greenColor];
        _monthNumber.font = [UIFont systemFontOfSize:16];
    }
    return _monthNumber;
}

- (UILabel *)dayNumber {
    if (!_dayNumber) {
        _dayNumber = [[UILabel alloc] init];
        _dayNumber.textColor = [UIColor greenColor];
        _dayNumber.font = [UIFont systemFontOfSize:16];
    }
    return _dayNumber;
}

- (UILabel *)line2 {
    if (!_line2) {
        _line2 = [[UILabel alloc] init];
        _line2.text = @"|";
        _line2.textColor = [UIColor whiteColor];
        _line2.font = [UIFont systemFontOfSize:40];
    }
    return _line2;
}

- (UILabel *)dayDate {
    if (!_dayDate) {
        _dayDate = [[UILabel alloc] init];
        _dayDate.textColor = [UIColor greenColor];
        _dayDate.font = [UIFont systemFontOfSize:20];
    }
    return _dayDate;
}


- (void)setPosition {
    [self.personalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(10);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [self.nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-15);
        make.left.equalTo(self.personalBtn.mas_right).offset(40);
    }];
    
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(4);
        make.left.equalTo(self.nameLbl.mas_right).offset(20);
        make.bottom.equalTo(self).offset(-5);
    }];
    
    [self.monthNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-30);
        make.left.equalTo(self.line1.mas_right).offset(20);
    }];
    
    [self.dayNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.monthNumber);
        make.bottom.equalTo(self.monthNumber).offset(20);
    }];
    
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(4);
        make.left.equalTo(self.monthNumber.mas_right).offset(20);
        make.bottom.equalTo(self).offset(-5);
    }];
    
    [self.dayDate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-15);
            make.left.equalTo(self.line2.mas_right).offset(20);
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
