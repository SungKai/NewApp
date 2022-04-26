//
//  NavView.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import "NavView.h"
#import "Masonry.h"

@implementation NavView
//初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.currentBtn];
        [self addSubview:self.funnyBtn];
        [self addSubview:self.schoolBtn];
        [self addSubview:self.silderImageView];
        self.backgroundColor = [UIColor colorNamed:@"247_247_247"];
        [self setPosition];
        //设置默认状态
        
    }
    return self;
}


#pragma mark - lazy
//currentBtn
- (UIButton *)currentBtn {
    if (!_currentBtn) {
        _currentBtn = [[UIButton alloc] init];
        [_currentBtn setTitle:@"时事" forState:UIControlStateNormal];
        _currentBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_currentBtn setTitleColor:[UIColor blackColor] forState:normal];
        [_currentBtn addTarget:self action:@selector(silderAnimateAction:) forControlEvents:UIControlEventTouchUpInside];
        _currentBtn.tag = 0;
        
    }
    return _currentBtn;
}
//funnyBtn
- (UIButton *)funnyBtn {
    if (!_funnyBtn) {
        _funnyBtn = [[UIButton alloc] init];
        [_funnyBtn setTitle:@"趣闻" forState:UIControlStateNormal];
        _funnyBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_funnyBtn setTitleColor:[UIColor blackColor] forState:normal];
        [_funnyBtn addTarget:self action:@selector(silderAnimateAction:) forControlEvents:UIControlEventTouchUpInside];
        _funnyBtn.tag = 1;
    }
    return _funnyBtn;
}
//schoolBtn
- (UIButton *)schoolBtn {
    if (!_schoolBtn) {
        _schoolBtn = [[UIButton alloc] init];
        [_schoolBtn setTitle:@"教务" forState:UIControlStateNormal];
        _schoolBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_schoolBtn setTitleColor:[UIColor blackColor] forState:normal];
        [_schoolBtn addTarget:self action:@selector(silderAnimateAction:) forControlEvents:UIControlEventTouchUpInside];
        _schoolBtn.tag = 2;
    }
    return _schoolBtn;
}
//silderImageView
- (UIImageView *)silderImageView {
    if (!_silderImageView) {
        _silderImageView = [[UIImageView alloc] init];
        _silderImageView.image = [UIImage imageNamed:@"分页滑条"];
        
    }
    return _silderImageView;
}

#pragma mark - 方法
//点击按钮的动画切换UI和界面效果
- (void)silderAnimateAction:(UIButton *)sender {
    NSInteger tag = sender.tag;
    //1.切换新闻界面，用代理的方式传给MainVC
    [self.delegate silderView:tag];
    //2.切换UI
    self.currentBtn.selected = NO;
    self.funnyBtn.selected = NO;
    self.schoolBtn.selected = NO;
    UIButton *btn = [self buttonWithTag:tag];
    btn.selected = YES;
    [UIView animateWithDuration:0.3 animations:^{
        //2.1 UI变换1:滑条
        self.silderImageView.frame = CGRectMake(sender.frame.origin.x - 6, self.silderImageView.frame.origin.y, self.silderImageView.frame.size.width, self.silderImageView.frame.size.height);
    } completion:^(BOOL finished) {
        //2.2 UI变换2:btn字体变大
        self.currentBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.funnyBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.schoolBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        sender.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    }];
}
//界面滑动，使滑条同时也跟着滑动
- (void)diliverTheXWithSilderImageView:(CGFloat)x {
    CGRect frame = self.silderImageView.frame;
        frame.origin.x = x;
        self.silderImageView.frame = frame;
}
//直接滑动界面的静态结果
- (void)silderAction:(NSInteger)tag {
    //切换UI
    self.currentBtn.selected = NO;
    self.funnyBtn.selected = NO;
    self.schoolBtn.selected = NO;
    UIButton *btn = [self buttonWithTag:tag];
    btn.selected = YES;
    //1.变换滑条
    self.silderImageView.frame = CGRectMake(btn.frame.origin.x - 6, self.silderImageView.frame.origin.y, self.silderImageView.frame.size.width, self.silderImageView.frame.size.height);
    //2.UI变换2:btn字体变大
    self.currentBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    self.funnyBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    self.schoolBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:24];
}
//用tag定位到button
- (UIButton *)buttonWithTag:(NSInteger)tag {
    switch (tag) {
        case 0:
            return self.currentBtn;
        case 1:
            return self.funnyBtn;
        case 2:
            return self.schoolBtn;
        default:
            return nil;
    }
}
//设置位置尺寸
- (void)setPosition {
    //funnyBtn
    [self.funnyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    //currentBtn
    [self.currentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.funnyBtn);
        make.left.equalTo(self).offset(40);
        make.size.mas_equalTo(self.funnyBtn);
    }];
    //schoolBtn
    [self.schoolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.funnyBtn);
        make.right.equalTo(self).offset(-40);
        make.size.mas_equalTo(self.funnyBtn);
    }];
    //silderImageView
    [self.silderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.centerX.equalTo(self.currentBtn);
        make.size.mas_equalTo(CGSizeMake(60, 6));
    }];
}

@end
