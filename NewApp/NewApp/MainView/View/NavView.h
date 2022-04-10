//
//  NavView.h
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import <UIKit/UIKit.h>
//顶部的滑动栏
NS_ASSUME_NONNULL_BEGIN

@interface NavView : UIView
@property (nonatomic, strong) UIButton *currentBtn;
@property (nonatomic, strong) UIButton *funnyBtn;
@property (nonatomic, strong) UIButton *schoolBtn;
//初始化方法
- (instancetype)initWithNavView:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
