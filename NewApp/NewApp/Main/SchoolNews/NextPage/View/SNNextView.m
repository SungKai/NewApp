//
//  SNNextView.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/21.
//

#import "SNNextView.h"
//Tool
#import "UILabel+AutoHeight.h"

@implementation SNNextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLab];
        [self addSubview:self.textLab];
        [self addSubview:self.backBtn];
    }
    return self;
}

#pragma mark - Method
//载入数据
- (void)gainTitleLab:(NSString *)titleLab TextLab:(NSString *)textLab {
    self.titleLab.text = titleLab;
    self.textLab.text = textLab;
    [self calculateTitleLab:titleLab TextLab:textLab];
}
//根据文字设置尺寸
- (void)calculateTitleLab:(NSString *)titleLab TextLab:(NSString *)textLab {
    //title
    CGRect tempTitleFrame = self.titleLab.frame;
    CGFloat titleWidth = ScreenWidth - 2 * 25;
    tempTitleFrame.size = [self.titleLab MaxLabelWidth:self.titleLab.text FontOfSize:25 MaxWidth:titleWidth MaxNumberOfLine:3 Interval:3];
    tempTitleFrame.origin = CGPointMake(25, 20);
    self.titleLab.frame = tempTitleFrame;
    //text
    CGRect tempTextFrame = self.textLab.frame;
    CGFloat textWidth = ScreenWidth - 2 * 20;
    tempTextFrame.size = [self.textLab MaxLabelWidth:self.textLab.text FontOfSize:16 MaxWidth:textWidth MaxNumberOfLine:-1 Interval:3];
    CGFloat textOriginY = self.textLab.frame.origin.y + self.textLab.frame.size.height + 20;
    tempTextFrame.origin = CGPointMake(self.titleLab.frame.origin.x, textOriginY);
    self.textLab.frame = tempTextFrame;
    //scrollView
    self.contentSize = CGSizeMake(ScreenWidth, self.textLab.frame.size.height - 30);
}

//返回上一个界面
- (void)clickBack {
    [self.SNNextViewDelegete back];
}

#pragma mark - Getter

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.font = [UIFont boldSystemFontOfSize:25];
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}

- (UILabel *)textLab {
    if (!_textLab) {
        _textLab = [[UILabel alloc] init];
        _textLab.textColor = [UIColor blackColor];
        _textLab.font = [UIFont systemFontOfSize:16];
    }
    return _textLab;
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] init];
        _backBtn.frame = CGRectMake(15, 13, 17, 27);
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
