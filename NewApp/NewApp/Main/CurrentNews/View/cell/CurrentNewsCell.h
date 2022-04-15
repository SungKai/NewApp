//
//  CurrentNewsCell.h
//  NewApp
//
//  Created by 小艾同学 on 2022/4/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CurrentNewsCell : UITableViewCell

/// 新闻主标题
@property (nonatomic, strong) UILabel *titleLab;

/// 小标题
@property (nonatomic, strong) UILabel *hintLab;



/// 复用池
+ (CurrentNewsCell *)CreateReusableCell:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END