//
//  PersonFirstView.h
//  NewApp
//
//  Created by 小艾同学 on 2022/4/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonFirstView : UIView

/// 用户名
@property (nonatomic, strong) UILabel *personName;
/// 签名
@property (nonatomic, strong) UILabel *signature;
/// 阅读时间
//@property (nonatomic, strong) UILabel *timeCalculate;
/// 头像
@property (nonatomic, strong) UIImageView *headImgView;


- (instancetype)initWithFirstView;
- (void)setPosition;

@end

NS_ASSUME_NONNULL_END
