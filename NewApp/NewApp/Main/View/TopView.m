//
//  TopView.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/12.
//

#import "TopView.h"
#import "UIView+Frame.h"
#import "NSDate+Day.h"
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
    }
    return self;
}
#pragma mark-懒加载
- (UIButton *)personalBtn {
    if (!_personalBtn) {
        _personalBtn = [[UIButton alloc] init];
        _personalBtn.width = _personalBtn.height = 50;
        _personalBtn.left = self.left + 10;
        _personalBtn.bottom = self.top + 8;
        
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

        [_nameLbl stretchLeft_toPointX:self.personalBtn.right offset:20];
        [_nameLbl stretchTop_toPointY:self.top offset:-25];
        _nameLbl.width = 70;
        _nameLbl.height = 20;
        
        _nameLbl.font = [UIFont systemFontOfSize:20];
        _nameLbl.textColor = [UIColor greenColor];
    }
    return _nameLbl;
}


- (UILabel *)line1 {
    if (!_line1) {
        _line1 = [[UILabel alloc] init];
        _line1.text = @"|";
        _line1.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
        [_line1 stretchLeft_toPointX:self.nameLbl.right offset:2];
        [_line1 stretchTop_toPointY:self.top offset:-26];
        _line1.width = 3;
        _line1.font = [UIFont systemFontOfSize:25];
        
    }
    return _line1;
}

- (UILabel *)monthNumber {
    if (!_monthNumber) {
        _monthNumber = [[UILabel alloc] init];
        _monthNumber.text = @"xx月";
        _monthNumber.textColor = [UIColor greenColor];
        
        [_monthNumber stretchLeft_toPointX:self.line1.right offset:15];
        [_monthNumber stretchTop_toPointY:self.top offset:-30];
        _monthNumber.width = 40;
        _monthNumber.font = [UIFont systemFontOfSize:16];
    }
    return _monthNumber;
}

- (UILabel *)dayNumber {
    if (!_dayNumber) {
        _dayNumber = [[UILabel alloc] init];
        _dayNumber.text = @"xx日";
        _dayNumber.textColor = [UIColor greenColor];
        
        [_dayNumber stretchLeft_toPointX:self.line1.right offset:15];
        [_dayNumber stretchTop_toPointY:self.top offset:-20];
        _dayNumber.width = 40;
        _dayNumber.font = [UIFont systemFontOfSize:16];
    }
    return _dayNumber;
}

- (UILabel *)line2 {
    if (!_line2) {
        _line2 = [[UILabel alloc] init];
        _line2.text = @"|";
        _line2.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
        
        [_line2 stretchLeft_toPointX:self.monthNumber.right offset:5];
        [_line2 stretchTop_toPointY:self.top offset:-26];
        _line2.width = 3;
        _line2.font = [UIFont systemFontOfSize:25];
    }
    return _line2;
}

- (UILabel *)dayDate {
    if (!_dayDate) {
        _dayDate = [[UILabel alloc] init];
        _dayDate.text = @"星期x";
        _dayDate.textColor = [UIColor greenColor];
                              
        [_dayDate stretchLeft_toPointX:self.line2.right offset:15];
        [_dayDate stretchTop_toPointY:self.top offset:-25];
        _dayDate.width = 70;
        _dayDate.height = 20;
        _dayDate.font = [UIFont systemFontOfSize:20];
    }
    return _dayDate;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
