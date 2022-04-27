//
//  PersonDetialView.m
//  NewApp
//
//  Created by 小艾同学 on 2022/4/18.
//

#import "PersonDetialView.h"

#pragma mark - PersonDetialView ()

@interface PersonDetialView ()

/// 用户名
@property (nonatomic, strong) UITextField *nameLab;

/// 签名
@property (nonatomic, strong) UITextField *mottoLab;

/// 头像
@property (nonatomic, strong) UIImageView *headImgView;

@property (nonatomic, strong) UITapGestureRecognizer *tap;

@end

#pragma mark - PersonDetialView

@implementation PersonDetialView

#pragma mark - Life cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorNamed:@"237_237_237"];
        self.frame = CGRectMake(0, 0, ScreenWidth - 40, 200);
        self.layer.cornerRadius = 20;
        self.userInteractionEnabled = YES;
        _mode = PersonModeDefault;
        
        [self addSubview:self.nameLab];
        [self addSubview:self.mottoLab];
        [self addSubview:self.headImgView];
        [self addGestureRecognizer:self.tap];
    }
    return self;
}

#pragma mark - Method

- (void)reloadData {
    NSString *str = [UserDefaults stringForKey:Person_name_String];
    str = str ? str : @"NAME";
    self.nameLab.text = str;
    
    str = [UserDefaults stringForKey:Person_motto_String];
    str = str ? str : @"或许这里有一段励志语";
    self.mottoLab.text = str;
    
    NSData *headData = [UserDefaults dataForKey:Person_head_Data];
    self.headImgView.image = [UIImage imageWithData:headData];
}

// MARK: SEL

- (void)personDetailTaped {
    if (self.delegate) {
        [self.delegate personDetailView:self didSelectedInMode:self.mode];
    }
}

#pragma mark - Getter

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 100, 100)];
        _headImgView.right = self.SuperRight - 20;
        _headImgView.backgroundColor = [UIColor colorNamed:@"254_149_87"];
        _headImgView.layer.cornerRadius = 50;
    }
    return _headImgView;
}

- (UITextField *)nameLab {
    if (!_nameLab) {
        _nameLab = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, 150, 54)];
        [_nameLab stretchRight_toPointX:self.headImgView.left offset:20];
        
        _nameLab.textAlignment = NSTextAlignmentCenter;
        _nameLab.text = @"NAME";
        _nameLab.userInteractionEnabled = NO;
        _nameLab.textColor = [UIColor colorNamed:@"51_51_51"];
        _nameLab.font = [UIFont boldSystemFontOfSize:45];
    }
    return _nameLab;
}

- (UITextField *)mottoLab {
    if (!_mottoLab) {
        _mottoLab = [[UITextField alloc] initWithFrame:CGRectMake(self.nameLab.left, self.nameLab.bottom, 175, 40)];
        _mottoLab.textAlignment = NSTextAlignmentCenter;
        _mottoLab.userInteractionEnabled = NO;
        _mottoLab.text = @"或许这里有一段励志语";
        _mottoLab.textColor = [UIColor colorNamed:@"149_158_165"];
    }
    return _mottoLab;
}

- (UITapGestureRecognizer *)tap {
    if (_tap == nil) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(personDetailTaped)];
    }
    return _tap;
}

#pragma mark - Setter

- (void)setMode:(PersonMode)mode {
    if (_mode == mode) {
        return;
    }
    switch (mode) {
        case PersonModeDefault:
            [self drawWithPersonModeDefault];
            break;
        case PersonModeFocused:
            [self drawWithPersonModeFocused];
            break;
    }
    _mode = mode;
}

@end

#pragma mark - PersonDetialView (PersonMode)

@implementation PersonDetialView (PersonMode)

- (void)drawWithPersonModeDefault {
    [UIView
     animateWithDuration:1
     animations:^{
        self.nameLab.frame = CGRectMake(20, 40, 150, 54);
        
        self.mottoLab.frame = CGRectMake(self.nameLab.left, self.nameLab.bottom, 175, 40);
        
        self.headImgView.frame = CGRectMake(0, 20, 100, 100);
        self.headImgView.right = self.SuperRight - 20;
        self.headImgView.layer.cornerRadius = self.headImgView.width / 2;
    }];
}

- (void)drawWithPersonModeFocused {
    [UIView
     animateWithDuration:1
     animations:^{
        self.headImgView.frame = CGRectMake((self.width - 150) / 2, 20, 150, 150);
        self.headImgView.layer.cornerRadius = self.headImgView.width / 2;
        
        self.nameLab.frame = CGRectMake(10, 170 + 20, self.width, 54);
        
        self.mottoLab.size = self.nameLab.size;
        self.mottoLab.left = self.nameLab.left;
        self.mottoLab.height = 40;
    }];
}

@end
