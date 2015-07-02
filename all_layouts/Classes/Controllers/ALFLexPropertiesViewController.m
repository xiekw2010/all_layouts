//
//  ALFLexPropertiesViewController.m
//  all_layouts
//
//  Created by xiekw on 15/6/30.
//  Copyright (c) 2015年 xiekw. All rights reserved.
//

#import "ALFLexPropertiesViewController.h"
#import "FlexboxKit.h"

static int __i = 0;
static inline UIButton *buttonWithTitleAndFontSize(NSString *title, CGFloat fontSize) {
    __i ++;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:@[[UIColor orangeColor], [UIColor cyanColor]][__i%2]];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    btn.showsTouchWhenHighlighted = YES;
    return btn;
}

static int __j = 0;
static inline UIView *boxContainer() {
    __j++;
    UIView *v = [UIView new];
    v.flexContainer = YES;
    v.layer.borderWidth = 3.0;
    v.layer.borderColor = [@[[UIColor greenColor], [UIColor blueColor]][__j%2] CGColor];
    v.backgroundColor = [UIColor lightGrayColor];
    return v;
}

static inline NSArray *buttonsWithCount(NSUInteger count) {
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < count; i ++) {
        [mArray addObject:buttonWithTitleAndFontSize([NSString stringWithFormat:@"%lu", (unsigned long)i], 15.0)];
    }
    return mArray;
}

@interface ALFLexPropertiesViewController ()

@property (nonatomic, strong) UIView *scrollFlexContainer;
@property (nonatomic, strong) UIView *flexContainerBox;

@end

@implementation ALFLexPropertiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupScrollFlexContainer];
}

- (void)setupScrollFlexContainer {
    _scrollFlexContainer = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollFlexContainer.flexContainer = YES;
    _scrollFlexContainer.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_scrollFlexContainer];
    _scrollFlexContainer.flexWrap = YES;
    
    [self setupFlexContainer];
    
    [self setupFlexSize];
    
    [_scrollFlexContainer flexLayoutSubviews];
}

- (void)setupFlexContainer {
    UIButton *flexContainer = buttonWithTitleAndFontSize(@"FlexContainer", 18);
    [flexContainer addTarget:self action:@selector(flexContainerTapped) forControlEvents:UIControlEventTouchUpInside];
    UIView *flexContainerBox = boxContainer();
    NSArray *buttons = buttonsWithCount(5);
    for (UIView *vb in buttons) {
        [flexContainerBox addSubview:vb];
    }
    flexContainerBox.flexJustifyContent = FLEXBOXJustificationSpaceBetween;
    [_scrollFlexContainer addSubview:flexContainer];
    [_scrollFlexContainer addSubview:flexContainerBox];
    _flexContainerBox = flexContainerBox;
    _flexContainerBox.flexSizeThatFitsBlock = ^CGSize(CGSize size){
        return CGSizeMake(size.width, 100.0);
    };

}

- (void)flexContainerTapped {
    _flexContainerBox.flexContainer = !_flexContainerBox.flexContainer;
    [_flexContainerBox flexLayoutSubviews];
}

- (void)setupFlexSize {
    UIButton *btn = buttonWithTitleAndFontSize(@"FlexSize", 18);
    [btn addTarget:self action:@selector(flexSizeTapped) forControlEvents:UIControlEventTouchUpInside];
    UIView *flexSizeBox = boxContainer();
    NSArray *buttons = buttonsWithCount(10);
    for (UIView *vb in buttons) {
        [flexSizeBox addSubview:vb];
    }
    [_scrollFlexContainer addSubview:btn];
    [_scrollFlexContainer addSubview:flexSizeBox];
}

- (void)flexSizeTapped {
    
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
