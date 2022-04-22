//
//  TopView.h
//  NewApp
//
//  Created by 宋开开 on 2022/4/12.
//
//顶部时间View
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TopView : UIView
/// 头像
@property (nonatomic, strong) UIButton *personalBtn;

/// 用户名
@property (nonatomic, strong) UILabel *nameLbl;

/// 月份
@property (nonatomic, strong) UILabel *monthNumber;

/// 日期
@property (nonatomic, strong) UILabel *dayNumber;

/// 星期x
@property (nonatomic, strong) UILabel *dayDate;

/// 线1
@property (nonatomic, strong) UILabel *line1;

/// 线2
@property (nonatomic, strong) UILabel *line2;

///框
@property (nonatomic, strong) UIImageView *imgView;

//大小设置
- (void)setPosition;

@end

NS_ASSUME_NONNULL_END
