//
//  HRFLXNode.h
//  all_layouts
//
//  Created by xiekw on 15/7/5.
//  Copyright (c) 2015年 xiekw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Layout.h"

FOUNDATION_EXTERN CGFloat const HRFLXLayoutFloatUnDefined;

typedef NS_ENUM(NSInteger, HRFLXLayoutAlignment) {
    HRFLXLayoutAlignmentAuto = CSS_ALIGN_AUTO,
    HRFLXLayoutAlignmentStart = CSS_ALIGN_FLEX_START,
    HRFLXLayoutAlignmentCenter = CSS_ALIGN_CENTER,
    HRFLXLayoutAlignmentEnd = CSS_ALIGN_FLEX_END,
    HRFLXLayoutAlignmentStretch = CSS_ALIGN_STRETCH
};

typedef NS_ENUM(NSInteger, HRFLXLayoutDirection) {
    HRFLXLayoutDirectionColumn = CSS_FLEX_DIRECTION_COLUMN,
    HRFLXLayoutDirectionRow = CSS_FLEX_DIRECTION_ROW,
    HRFLXLayoutDirectionRowReverse = CSS_FLEX_DIRECTION_ROW_REVERSE,
    HRFLXLayoutDirectionColumnReverse = CSS_FLEX_DIRECTION_COLUMN_REVERSE
};

typedef NS_ENUM(NSInteger, HRFLXLayoutJustification) {
    HRFLXLayoutJustificationStart = CSS_JUSTIFY_FLEX_START,
    HRFLXLayoutJustificationCenter = CSS_JUSTIFY_CENTER,
    HRFLXLayoutJustificationEnd = CSS_JUSTIFY_FLEX_END,
    HRFLXLayoutJustificationBetween = CSS_JUSTIFY_SPACE_BETWEEN,
    HRFLXLayoutJustificationAround = CSS_JUSTIFY_SPACE_AROUND
};

@interface HRFLXNode : NSObject {
@public
    BOOL _dirty;
}

@property (nonatomic, assign, readonly) css_node_t *node;
@property (nonatomic, strong, readonly) UIView *view;
@property (nonatomic, assign, readonly) CGRect frame;
@property (nonatomic, strong, readonly) NSArray *childNodes;

@property (nonatomic, assign) HRFLXLayoutDirection direction;
@property (nonatomic, assign) HRFLXLayoutAlignment alignItems;
@property (nonatomic, assign) HRFLXLayoutAlignment alignContent;
@property (nonatomic, assign) HRFLXLayoutJustification justification;

@property (nonatomic, assign) BOOL flexWrap;
@property (nonatomic, assign) HRFLXLayoutAlignment alignSelf;
@property (nonatomic, assign) CGFloat flex;

// eg:Direction is column, it can is {fixedX, CSS_UNDEFINED} or {fixedX, fixedY}, former the size depends on the children, later children's size depends on the fixedY
@property (nonatomic, assign) CGSize dimensions;
@property (nonatomic, assign) CGSize minDimensions;
@property (nonatomic, assign) CGSize maxDimensions;
@property (nonatomic, assign) UIEdgeInsets margin;
@property (nonatomic, assign) UIEdgeInsets padding;
@property (nonatomic, copy) CGSize (^measure)(CGFloat width);

- (id)initWithView:(UIView *)view children:(NSArray *)childNodes;

- (void)layoutAysnc:(BOOL)aysnc completionBlock:(dispatch_block_t)block;
- (void)setNeedsLayout;

@end
