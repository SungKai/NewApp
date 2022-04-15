//
//  CurrentNewsTableView.h
//  NewApp
//
//  Created by 小艾同学 on 2022/4/16.
//

#import <UIKit/UIKit.h>

#import "CurrentNewsCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CurrentNewsTableViewDelegate <NSObject>

@end

@interface CurrentNewsTableView : UITableView
//代理
@property (nonatomic, weak)id <CurrentNewsTableViewDelegate> currentDelegate;

@end

NS_ASSUME_NONNULL_END
