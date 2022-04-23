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

///图片
@property (nonatomic, strong) UIImageView *imgView;

/// 复用池
+ (CurrentNewsCell *)CreateReusableCell:(UITableView *)tableView;

- (CurrentNewsCell *)cellWithInformation:(CurrentNewsCell *)cell WithTitleText:(NSString *)titleText WithHintText:(NSString *)hintText WithImageURL:(NSString *)imageURL;

@end

NS_ASSUME_NONNULL_END
