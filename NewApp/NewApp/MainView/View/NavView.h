//
//  NavView.h
//  NewApp
//
//  Created by 宋开开 on 2022/4/9.
//

#import <UIKit/UIKit.h>
//顶部的滑动栏
NS_ASSUME_NONNULL_BEGIN
//代理
@protocol NavDelegate <NSObject>
@required
//点击按钮切换新闻界面
- (void)silderView:(NSInteger)tag;

@end
@interface NavView : UIView
@property (nonatomic, strong) UIButton *currentBtn;
@property (nonatomic, strong) UIButton *funnyBtn;
@property (nonatomic, strong) UIButton *schoolBtn;
//滑动条
@property (nonatomic, strong) UIImageView *silderImageView;
//代理
@property (nonatomic, weak) id <NavDelegate> navDelegate;
//初始化方法
- (instancetype)initWithNavView:(CGRect)frame;
//界面滑动，使滑条同时也跟着滑动
- (void)diliverTheXWithSilderImageView:(CGFloat)x;
//直接滑动界面的静态结果
- (void)silderAction:(NSInteger)tag;
@end

NS_ASSUME_NONNULL_END
