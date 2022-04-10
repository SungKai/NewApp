//
//  NavView.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import "NavView.h"

@implementation NavView



#pragma mark - lazy
//currentBtn
- (UIButton *)currentBtn {
    if (!_currentBtn) {
        _currentBtn = [[UIButton alloc] init];
        
    }
    return _currentBtn;
}
//funnyBtn
- (UIButton *)funnyBtn {
    if (!_funnyBtn) {
        _funnyBtn = [[UIButton alloc] init];
    }
    return _funnyBtn;
}
//schoolBtn
- (UIButton *)schoolBtn {
    if (!_schoolBtn) {
        _schoolBtn = [[UIButton alloc] init];
    }
    return _schoolBtn;
}

#pragma mark - 方法
//初始化方法
- (instancetype)initWithNavView:(CGRect)frame {
    if (self = [super init]) {
        
    }
    return self;
}

@end
