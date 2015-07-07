//
//  ALFLEXBOXUtils.h
//  all_layouts
//
//  Created by xiekw on 15/7/6.
//  Copyright (c) 2015年 xiekw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALFLEXBOXUtils : NSObject

+ (NSString *)kContent;
+ (UIView *)randomColorBox;
+ (UILabel *)randomColorLabelWithText:(NSString *)text fontSize:(CGFloat)fontSize;

+ (CGSize)textSizeWithLabel:(UILabel *)label constrainedSize:(CGSize)constrainedSize;

@end
