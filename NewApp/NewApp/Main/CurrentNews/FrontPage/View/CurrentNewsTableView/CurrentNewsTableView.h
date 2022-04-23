//
//  CurrentNewsTableView.h
//  NewApp
//
//  Created by 小艾同学 on 2022/4/16.
//

#import <UIKit/UIKit.h>
//V
#import "CurrentNewsCell.h"
//M
#import "WYNewsModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol CurrentNewsTableViewDelegate <NSObject>

/// 单击事件界面跳转到时事新闻详情
/// @param indexPath indexPath
- (void)clickGainIndexPath:(NSIndexPath *)indexPath;

@end

@interface CurrentNewsTableView : UITableView
//代理
@property (nonatomic, weak)id <CurrentNewsTableViewDelegate> cnVDelegate;

@property (nonatomic, strong) NSArray <WYNews *> *wydata;

@end

NS_ASSUME_NONNULL_END
