//
//  SNNextView.h
//  NewApp
//
//  Created by 宋开开 on 2022/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SNNextViewDelegete <NSObject>

@required
- (void)back;

@end
@interface SNNextView : UIScrollView

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UILabel *textLab;

@property (nonatomic, strong) UIButton *backBtn;

@property (nonatomic, weak) id <SNNextViewDelegete> SNNextViewDelegete;
/// 获取新闻数据
/// @param titleLab 新闻标题
/// @param textLab 新闻详情
- (void)gainTitleLab:(NSString *)titleLab TextLab:(NSString *)textLab;
@end

NS_ASSUME_NONNULL_END
