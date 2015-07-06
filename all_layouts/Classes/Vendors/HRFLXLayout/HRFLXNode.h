//
//  HRFLXNode.h
//  all_layouts
//
//  Created by xiekw on 15/7/5.
//  Copyright (c) 2015年 xiekw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Layout.h"

typedef NS_ENUM(NSInteger, HRFLXLayoutAlignItems) {
    HRFLXLayoutAlignItemsAuto = CSS_ALIGN_AUTO,
    HRFLXLayoutAlignItemsStart = CSS_ALIGN_FLEX_START,
    HRFLXLayoutAlignItemsCenter = CSS_ALIGN_CENTER,
    HRFLXLayoutAlignItemsFlexEnd = CSS_ALIGN_FLEX_END,
    HRFLXLayoutAlignItemsStretch = CSS_ALIGN_STRETCH
};

typedef NS_ENUM(NSInteger, HRFLXLayoutAlignSelf) {
    HRFLXLayoutAlignSelfAuto = CSS_ALIGN_AUTO,
    HRFLXLayoutAlignSelfStart = CSS_ALIGN_FLEX_START,
    HRFLXLayoutAlignSelfCenter = CSS_ALIGN_CENTER,
    HRFLXLayoutAlignSelfFlexEnd = CSS_ALIGN_FLEX_END,
    HRFLXLayoutAlignSelfStretch = CSS_ALIGN_STRETCH
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
@property (nonatomic, assign) HRFLXLayoutAlignItems alignItems;
@property (nonatomic, assign) HRFLXLayoutJustification justification;

@property (nonatomic, assign) BOOL flexWrap;
@property (nonatomic, assign) HRFLXLayoutAlignSelf alignSelf;
@property (nonatomic, assign) CGFloat flex;

@property (nonatomic, assign) CGSize dimensions;
@property (nonatomic, assign) CGSize minDimensions;
@property (nonatomic, assign) CGSize maxDimensions;
@property (nonatomic, assign) UIEdgeInsets margin;
@property (nonatomic, assign) UIEdgeInsets padding;

// If the direction is column the width is father node's width - padding - margin, otherwise is NAN
@property (nonatomic, copy) CGSize (^measure)(CGFloat width);

- (id)initWithView:(UIView *)view children:(NSArray *)childNodes;

- (void)layoutSizeThatFits;
- (void)layout;
- (void)layoutAysnc;
- (void)setNeedsLayout;

@end
