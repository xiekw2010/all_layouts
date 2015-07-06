//
//  ALHRFLXNodeViewController.m
//  all_layouts
//
//  Created by xiekw on 15/7/6.
//  Copyright (c) 2015年 xiekw. All rights reserved.
//

#import "ALHRFLXNodeViewController.h"
#import "HRFLXNode.h"
#import "ALFLEXBOXUtils.h"

static CGFloat const margin = 10.0;

@interface ALHRFLXNodeViewController ()

@property (nonatomic, strong) UIScrollView *scv;

@end

@implementation ALHRFLXNodeViewController

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
    scv.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    scv.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 1000.0);
    scv.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:scv];
    
    _scv = scv;
}

- (void)render {
    NSArray *childNodes = @[self.box1, self.box2, self.box3, self.box4];
    HRFLXNode *node = [[HRFLXNode alloc] initWithView:_scv children:childNodes];
    node.justification = HRFLXLayoutJustificationCenter;
    
    [node setNeedsLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScrollView];
    [self render];
}

// This sample shows how measure block, minDimensions, flex, maxDimension impact on the box remain space divid
- (HRFLXNode *)box1 {
    HRFLXNode *box11 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box11.measure = ^CGSize(CGFloat width) {
        return CGSizeMake(50.0, 20.0);
    };
    box11.alignSelf = HRFLXLayoutAlignSelfCenter;
    box11.margin = UIEdgeInsetsMake(margin / 2, margin / 2, margin / 2, margin / 2);
    
    HRFLXNode *box12 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box12.margin = UIEdgeInsetsMake(margin / 2, margin / 2, margin / 2, margin / 2);
    box12.minDimensions = CGSizeMake(100.0, 200.0);
    
    HRFLXNode *box13 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box13.margin = UIEdgeInsetsMake(margin / 2, margin / 2, margin / 2, margin / 2);
    box13.flex = 2;
    
    HRFLXNode *box14 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box14.margin = UIEdgeInsetsMake(margin / 2, margin / 2, margin / 2, margin / 2);
    box14.maxDimensions = CGSizeMake(40.0, 30.0);
    
    HRFLXNode *box1 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:@[box11, box12, box13, box14]];
    box1.direction = HRFLXLayoutDirectionRow;
    box1.alignSelf = HRFLXLayoutAlignSelfStart;
    box1.margin = UIEdgeInsetsMake(margin, margin, margin, margin);
    box1.measure = ^CGSize(CGFloat width) {
        return CGSizeMake(250.0, 150.0);
    };
    
    return box1;
}

- (HRFLXNode *)box2 {
    
    UILabel *textLabel = [UILabel new];
    textLabel.numberOfLines = 0;
    textLabel.text = [ALFLEXBOXUtils kContent];
    HRFLXNode *box11 = [[HRFLXNode alloc] initWithView:textLabel children:nil];
    box11.margin = UIEdgeInsetsMake(margin / 2, margin / 2, margin / 2, margin / 2);
    box11.measure = ^CGSize(CGFloat width) {
        return [ALFLEXBOXUtils textSizeWithLabel:textLabel constrainedSize:CGSizeMake(width - margin, 80.0)];
    };
    HRFLXNode *box13 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box13.margin = UIEdgeInsetsMake(margin / 2, margin / 2, margin / 2, margin / 2);
    box13.flex = 2;
    
    HRFLXNode *box14 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box14.margin = UIEdgeInsetsMake(margin / 2, margin / 2, margin / 2, margin / 2);
    
    NSArray *children = @[box11, box13, box14];

    HRFLXNode *box2 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:children];
    box2.margin = UIEdgeInsetsMake(margin, margin, margin, margin);
    box2.direction = HRFLXLayoutDirectionColumn;
 
    return box2;
}

- (HRFLXNode *)box3 {
    
    HRFLXNode *box3 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box3.margin = UIEdgeInsetsMake(margin, margin, margin, margin);
    
    return box3;
}

- (HRFLXNode *)box4 {
    HRFLXNode *box4 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box4.margin = UIEdgeInsetsMake(margin, margin, margin, margin);
    
    return box4;
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
