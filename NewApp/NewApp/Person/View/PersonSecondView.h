//
//  PersonSecondView.h
//  NewApp
//
//  Created by 小艾同学 on 2022/4/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonSecondView : UIView

/// 消息
@property (nonatomic, strong) UIButton *message;
/// 收藏
@property (nonatomic, strong) UIButton *collection;
/// 退出
@property (nonatomic, strong) UIButton *exit;

- (instancetype)initWithSecondView;
- (void)setPosition;
@end

NS_ASSUME_NONNULL_END
