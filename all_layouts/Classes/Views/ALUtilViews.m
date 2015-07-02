//
//  ALUtilViews.m
//  all_layouts
//
//  Created by xiekw on 15/6/30.
//  Copyright (c) 2015年 xiekw. All rights reserved.
//

#import "ALUtilViews.h"

@implementation ALTag

- (instancetype)initWithText:(NSString *)text {
    if (self = [super init]) {
        self.font = [UIFont fontWithName:@"Avenir Next" size:16.0];
        self.backgroundColor = [UIColor colorWithHue:0.3 saturation:0.5 brightness:0.8 alpha:1.0];
        self.layer.borderColor = [UIColor colorWithWhite:0.92 alpha:1.0].CGColor;
        self.layer.borderWidth = 1.0;
    }
    return self;
}

@end
