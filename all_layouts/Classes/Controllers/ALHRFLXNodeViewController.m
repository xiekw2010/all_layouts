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

@end

@implementation ALHRFLXNodeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self render];
}

- (void)render {
    HRFLXNode *box1 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box1.margin = UIEdgeInsetsMake(margin / 2, margin / 2, margin / 2, margin / 2);

    HRFLXNode *box2 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box2.margin = UIEdgeInsetsMake(margin / 2, margin / 2, margin / 2, margin / 2);
    
    HRFLXNode *box3 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box3.margin = UIEdgeInsetsMake(margin / 2, margin / 2, margin / 2, margin / 2);
  
    HRFLXNode *box4 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box4.margin = UIEdgeInsetsMake(margin / 2, margin / 2, margin / 2, margin / 2);
  
    NSArray *childNodes = @[box1, box2, box3, box4];
    HRFLXNode *node = [[HRFLXNode alloc] initWithView:self.scv children:childNodes];

    [node setNeedsLayout];
}


@end
