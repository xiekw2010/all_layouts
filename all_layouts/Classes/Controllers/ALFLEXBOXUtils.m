//
//  ALFLEXBOXUtils.m
//  all_layouts
//
//  Created by xiekw on 15/7/6.
//  Copyright (c) 2015年 xiekw. All rights reserved.
//

#import "ALFLEXBOXUtils.h"

@interface UIColor (Colorful)

+ (UIColor *)randomColor;
+ (UIColor *)randomColorWithAlpha:(CGFloat)alpha;

@end

@implementation UIColor (Colorful)

+ (UIColor *)randomColor
{
    return [self randomColorWithAlpha:1.0];
}

+ (UIColor *)randomColorWithAlpha:(CGFloat)alpha
{
    CGFloat red = arc4random_uniform(255) / 255.0;
    CGFloat green = arc4random_uniform(255) / 255.0;
    CGFloat blue = arc4random_uniform(255) / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


@end

static int __i;

static inline UIView *createBoxWithRandomColor() {
    __i ++;
    UILabel *box = [UILabel new];
    box.backgroundColor = [UIColor randomColor];
    box.text = [NSString stringWithFormat:@"%d", __i];
    box.font = [UIFont systemFontOfSize:30.0];
    box.textAlignment = NSTextAlignmentCenter;
    return box;
}

static NSString * const kContent = @"The Réunion parrot or Dubois's parrot (Necropsittacus borbonicus) is a hypothetical extinct species of parrot based on descriptions of birds from the Mascarene island of Réunion. Its existence has been inferred from the travel report of Dubois in 1674 who described it as having a “Body the size of a large pigeon, green; head, tail and upper part of wings the colour of fire.” No remains have been found of this supposed species, and its existence seems doubtful.";


@implementation ALFLEXBOXUtils

+ (NSString *)kContent {
    return kContent;
}
+ (UIView *)randomColorBox {
    return createBoxWithRandomColor();
}

+ (UILabel *)randomColorLabelWithText:(NSString *)text fontSize:(CGFloat)fontSize {
    UILabel *label = [UILabel new];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    return label;
}

+ (CGSize)textSizeWithLabel:(UILabel *)label constrainedSize:(CGSize)constrainedSize {
    return [label.text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : label.font} context:NULL].size;
}


@end
