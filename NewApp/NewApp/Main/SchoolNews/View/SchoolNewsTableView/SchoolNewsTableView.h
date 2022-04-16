//
//  SchoolNewsTableView.h
//  NewApp
//
//  Created by 小艾同学 on 2022/4/16.
//

#import <UIKit/UIKit.h>

#import "SchoolNewsCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SchoolNewsTableViewDelegate <NSObject>


@end

@interface SchoolNewsTableView : UITableView

//代理
@property (nonatomic, weak)id <SchoolNewsTableViewDelegate> schoolDelegate;

@end

NS_ASSUME_NONNULL_END
