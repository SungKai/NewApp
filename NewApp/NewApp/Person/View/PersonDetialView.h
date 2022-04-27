//
//  PersonDetialView.h
//  NewApp
//
//  Created by 小艾同学 on 2022/4/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PersonDetialView;

#pragma mark - ENUM (PersonMode)

typedef NS_ENUM(NSUInteger, PersonMode) {
    PersonModeDefault,
    PersonModeFocused
};

#pragma mark - PersonDetialViewDelegate

@protocol PersonDetialViewDelegate <NSObject>

@required

- (void)personDetailView:(PersonDetialView *)view didSelectedInMode:(PersonMode)mode;

@end

#pragma mark - PersonDetialView

@interface PersonDetialView : UIView

@property (nonatomic, weak) id <PersonDetialViewDelegate> delegate;

@property (nonatomic) PersonMode mode;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

- (void)reloadData;

@end

#pragma mark - PersonDetialView (PersonMode)

@interface PersonDetialView (PersonMode)

- (void)drawWithPersonModeDefault;

- (void)drawWithPersonModeFocused;

@end

NS_ASSUME_NONNULL_END
