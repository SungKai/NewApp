//
//  PersonDetailController.m
//  NewApp
//
//  Created by SSR on 2022/4/27.
//

#import "PersonDetailController.h"

#import "PersonDetialView.h"

#pragma mark - PersonDetailController ()

@interface PersonDetailController () <
    PersonDetialViewDelegate
>

@property (nonatomic, strong) PersonDetialView *detailView;

@end

#pragma mark - PersonDetailController

@implementation PersonDetailController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.size = self.detailView.size;
    [self.view addSubview:self.detailView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.detailView reloadData];
}

#pragma mark - <PersonDetailController>

- (void)personDetailView:(PersonDetialView *)view didSelectedInMode:(PersonMode)mode {
    switch (mode) {
        case PersonModeDefault:
            view.mode = PersonModeFocused;
            break;
        case PersonModeFocused:
            view.mode = PersonModeDefault;
            break;
    }
}

#pragma mark - Getter

- (PersonDetialView *)detailView {
    if (_detailView == nil) {
        _detailView = [[PersonDetialView alloc] init];
        _detailView.delegate = self;
    }
    return _detailView;
}

@end
