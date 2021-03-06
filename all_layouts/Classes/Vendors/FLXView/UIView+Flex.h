@import UIKit;

#import "FLXTypes.h"

@class FLXLayoutStrategy;

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Flex)

@property (readwrite, nonatomic, assign) CGFloat flx_flex;

@property (readwrite, nonatomic, strong) FLXLayoutStrategy *flx_layoutStrategy;

@property (readwrite, nonatomic, assign) FLXMargins flx_margins;

@property (readwrite, nonatomic, assign) FLXSelfAlignment flx_selfAlignment;

@end

NS_ASSUME_NONNULL_END
