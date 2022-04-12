//
//  TopView.m
//  NewApp
//
//  Created by 宋开开 on 2022/4/12.
//

#import "TopView.h"
#import "NSDate+Day.h"
@implementation TopView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.brownColor;
        self.frame = frame;
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
