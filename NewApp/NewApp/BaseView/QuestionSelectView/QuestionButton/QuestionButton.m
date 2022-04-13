//
//  QuestionButton.m
//  CyxbsMobile2019_iOS
//  NewApp
//
//  Created by SSR on 2022/4/13.
//

#import "QuestionButton.h"

#pragma mark - QuestionButton

@implementation QuestionButton

#pragma mark - Lazy

- (NSString *)title {
    return self.titleLabel.text;
}

- (void)setTitle:(NSString *)title {
    CGSize size =
    [title sizeWithAttributes:@{
        NSFontAttributeName : self.titleLabel.font
    }];
    self.width = size.width + size.height;
    [self setTitle:title forState:UIControlStateNormal];
}

@end
