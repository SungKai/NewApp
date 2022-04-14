//
//  NavView.h
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NavViewDelegate <NSObject>

@required

/// 点击按钮切换新闻界面
/// @param tag 按钮的号码
- (void)silderView:(NSInteger)tag;

@end

@interface NavView : UIView

@property (nonatomic, strong) UIButton *currentBtn;

@property (nonatomic, strong) UIButton *funnyBtn;

@property (nonatomic, strong) UIButton *schoolBtn;

//滑动条
@property (nonatomic, strong) UIImageView *silderImageView;

//代理
@property (nonatomic, weak) id <NavViewDelegate> delegate;

/// 界面滑动，使滑条同时也跟着滑动
/// @param x 界面滑动的距离经过计算得到的适合滑条滑动的距离
- (void)diliverTheXWithSilderImageView:(CGFloat)x;

/// 直接滑动界面的静态结果
/// @param tag 按钮的号码
- (void)silderAction:(NSInteger)tag;

@end

NS_ASSUME_NONNULL_END
