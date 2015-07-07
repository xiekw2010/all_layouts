//
//  ALHRFLXNodeMiddleViewController.m
//  all_layouts
//
//  Created by xiekw on 15/7/7.
//  Copyright (c) 2015年 xiekw. All rights reserved.
//

#import "ALHRFLXNodeMiddleViewController.h"

static CGFloat const margin = 8.0;

@interface ALHRFLXNodeMiddleViewController ()

@end

@implementation ALHRFLXNodeMiddleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self render];
}

- (void)render {
    NSArray *childNodes = @[self.box1, self.box2, self.box3, self.box4, self.box4];
    HRFLXNode *node = [[HRFLXNode alloc] initWithView:_scv children:childNodes];
    node.justification = HRFLXLayoutJustificationStart;
    node.alignItems = HRFLXLayoutAlignmentStretch;
    node.dimensions = CGSizeMake(CGRectGetWidth(self.view.bounds), HRFLXLayoutFloatUnDefined);
    
    [node setNeedsLayout];
    _scv.frame = self.view.bounds;
    _scv.contentSize = node.frame.size;
}

// This sample shows how measure block, minDimensions, flex, maxDimension impact on the box remain space divid
- (HRFLXNode *)box1 {
    HRFLXNode *box11 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box11.measure = ^CGSize(CGFloat width) {
        return CGSizeMake(50.0, 20.0);
    };
    box11.alignSelf = HRFLXLayoutAlignmentCenter;
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
    box1.alignSelf = HRFLXLayoutAlignmentStart;
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
        return [ALFLEXBOXUtils textSizeWithLabel:textLabel constrainedSize:CGSizeMake(width - margin, CGFLOAT_MAX)];
    };
    
    NSUInteger const smallBoxesCount = 30;
    CGSize const smallBoxSize = CGSizeMake(30.0, 30.0);
    NSMutableArray *smallBoxes = [NSMutableArray arrayWithCapacity:smallBoxesCount];
    for (NSUInteger i = 0; i < smallBoxesCount; i ++) {
        HRFLXNode *smallNode = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
        smallNode.measure = ^CGSize(CGFloat width) {
            return smallBoxSize;
        };
        smallNode.margin = UIEdgeInsetsMake(3.0, 3.0, 3.0, 3.0);
        [smallBoxes addObject:smallNode];
    }
    HRFLXNode *box13 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:smallBoxes];
    box13.margin = UIEdgeInsetsMake(margin / 2, margin / 2, margin / 2, margin / 2);
    box13.flexWrap = YES;
    box13.direction = HRFLXLayoutDirectionRow;
    box13.alignContent = HRFLXLayoutAlignmentStart;
    box13.alignItems = HRFLXLayoutAlignmentStart;
    
    HRFLXNode *box14 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box14.margin = UIEdgeInsetsMake(margin / 2, margin / 2, margin / 2, margin / 2);
    
    NSArray *children = @[box11, box13, box14];
    HRFLXNode *box2 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:children];
    box2.margin = UIEdgeInsetsMake(margin, margin, margin, margin);
    box2.measure = ^CGSize(CGFloat width) {
        return CGSizeMake(320.0, 500.0);
    };
    
    return box2;
}

- (HRFLXNode *)box3 {
    HRFLXNode *box3 = self.box1;
    box3.margin = UIEdgeInsetsMake(margin, margin, margin, margin);
    box3.direction = HRFLXLayoutDirectionRowReverse;
    box3.minDimensions = CGSizeMake(CGRectGetWidth(self.view.bounds), 100.0);
    
    return box3;
}

- (HRFLXNode *)box4 {
    HRFLXNode *box4 = [[HRFLXNode alloc] initWithView:[ALFLEXBOXUtils randomColorBox] children:nil];
    box4.margin = UIEdgeInsetsMake(margin, margin, margin, margin);
    box4.measure = ^CGSize(CGFloat width) {
        return CGSizeMake(200.0, 50.0);
    };
    return box4;
}


@end
