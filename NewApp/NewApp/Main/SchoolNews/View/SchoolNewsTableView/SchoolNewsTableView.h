//
//  SchoolNewsTableView.h
//  NewApp
//
//  Created by 小艾同学 on 2022/4/16.
//

#import <UIKit/UIKit.h>
//V
#import "SchoolNewsCell.h"
//M
#import "SNModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SchoolNewsTableViewDelegate <NSObject>

/// 单击事件界面跳转到教务新闻详情
/// @param indexPath indexPath
- (void)clickGainIndexPath:(NSIndexPath *)indexPath;
///从新闻详情页回到新闻页
- (void)backToFrontVC;
@end

@interface SchoolNewsTableView : UITableView

//代理
@property (nonatomic, weak)id <SchoolNewsTableViewDelegate> schoolDelegate;

@property (nonatomic, strong) NSArray<SNModel *> *SNData;

@end

NS_ASSUME_NONNULL_END
