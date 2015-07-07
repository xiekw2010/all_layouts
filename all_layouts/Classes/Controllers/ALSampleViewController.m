//
//  ALSampleViewController.m
//  all_layouts
//
//  Created by xiekw on 15/7/7.
//  Copyright (c) 2015年 xiekw. All rights reserved.
//

#import "ALSampleViewController.h"

@interface ALSampleViewController ()

@end

@implementation ALSampleViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)setupScrollView {
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self.navigationController action:@selector(popViewControllerAnimated:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    UIScrollView *scv = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scv.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:scv];
    
    _scv = scv;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
