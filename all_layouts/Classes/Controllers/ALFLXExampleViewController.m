//
//  ALFLXExampleViewController.m
//  all_layouts
//
//  Created by xiekw on 15/6/30.
//  Copyright (c) 2015年 xiekw. All rights reserved.
//

#import "ALFLXExampleViewController.h"
#import "FLXView.h"
#import "all_layouts-Swift.h"

static CGFloat const margin = 8.0;

@interface ALFLXExampleViewController ()

@end

@implementation ALFLXExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self render];
}

- (void)render {
    FLXView *flxView = [FLXView new];
    flxView.backgroundColor = [UIColor lightGrayColor];
    flxView.childAlignment = FLXChildAlignmentStretch;
    flxView.direction = FLXDirectionColumn;
    flxView.padding = FLXPaddingMake(margin, margin, margin, margin);
    [self.view addSubview:flxView];
    
    FLXView *header = [FLXView new];
    header.childAlignment = FLXChildAlignmentCenter;
    header.direction = FLXDirectionRow;
    header.flx_margins = FLXMarginsMake(margin, margin, margin, margin);
    [flxView addSubview:header];
    
    Avatar *avatar = [[Avatar alloc] initWithImage:[UIImage imageNamed:@"Bird6"]];
    avatar.flx_layoutStrategy = [FLXLayoutStrategy fixed:CGSizeMake(80.0, 80.0)];
    avatar.flx_margins = FLXMarginsMake(margin, margin, margin, margin);
    avatar.flx_selfAlignment = FLXSelfAlignmentStart;
    [header addSubview:avatar];
    
    Label *title = [[Label alloc] initWithText:@"Necropsittacus Borbonicus" align:NSTextAlignmentLeft fontSize:24.0];
    title.flx_flex = 1.0;
    title.flx_margins = FLXMarginsMake(margin, margin, margin, margin);
    [header addSubview:title];
    
    Label *subtitle = [[Label alloc] initWithText:@"A pretty but unfortunately extinct bird." align:NSTextAlignmentLeft fontSize:20.0];
    subtitle.flx_margins = FLXMarginsMake(margin, margin, margin, margin);
    [header addSubview:subtitle];
    
    [flxView sizeThatFits:CGSizeMake(CGRectGetWidth(self.view.bounds), CGFLOAT_MAX)];
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
