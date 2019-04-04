//
//  ViewController.m
//  HZMutiIconsView
//
//  Created by Quanhai on 2019/4/4.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import "ViewController.h"
#import "MutiIconsView.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MutiIconsLayout layout = MutiLayoutMake(4, MutiIconsDirectionVertical, MutiIconsTypeItems);
    AllMutiIconsLayout allLayout = AllMutiIconsLayoutMake(layout, 100.f, CGSizeMake(50.f, 50.f), 0, 0, 0, 0);
    MutiIconsView *iconsView = [[MutiIconsView alloc] initWithIcons:@[@"icon1", @"icon2", @"icon3", @"icon4",@"icon1", @"icon2", @"icon3"] iconTitles:@[@"第一个", @"第二个", @"第三个", @"第四个",@"第5个", @"第6个", @"第7个"] allLayout:allLayout];
    [self.view addSubview:iconsView];
    [iconsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(50.f);
        make.centerX.mas_equalTo(self.view);
    }];
}

@end
