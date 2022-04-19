//
//  CurrentNewsTableView.h
//  NewApp
//
//  Created by 小艾同学 on 2022/4/16.
//

#import <UIKit/UIKit.h>

#import "WYNewsModel.h"
#import "CurrentNewsCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CurrentNewsTableViewDelegate <NSObject>

@required
//数据传递，当滑到footerView的时候去触发加载Before数据
- (void)nextSectionBlock:(NSInteger)section;
//点击cell,把indexPath传给CurrentNewsViewController来进行页面跳转
- (void)gainIndexPath:(NSIndexPath *)indexPath;

@end

@interface CurrentNewsTableView : UITableView

//代理
@property (nonatomic, weak)id <CurrentNewsTableViewDelegate> currentDelegate;

@property (nonatomic, strong) NSMutableArray<WYNewsModel *> *WYNews;

@end

NS_ASSUME_NONNULL_END
