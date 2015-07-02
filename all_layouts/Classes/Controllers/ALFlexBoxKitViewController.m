//
//  ALFlexBoxKitViewController.m
//  all_layouts
//
//  Created by xiekw on 15/6/29.
//  Copyright (c) 2015年 xiekw. All rights reserved.
//

#import "ALFlexBoxKitViewController.h"
#import "FlexboxKit.h"
#import "all_layouts-Swift.h"

static NSString * const kContent = @"The Réunion parrot or Dubois's parrot (Necropsittacus borbonicus) is a hypothetical extinct species of parrot based on descriptions of birds from the Mascarene island of Réunion. Its existence has been inferred from the travel report of Dubois in 1674 who described it as having a “Body the size of a large pigeon, green; head, tail and upper part of wings the colour of fire.” No remains have been found of this supposed species, and its existence seems doubtful.";

static CGFloat const margin = 8.0;

@interface ALFlexBoxKitViewController ()


@end

@implementation ALFlexBoxKitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self render];
}

- (void)render {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 1000.0);
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.flexContainer = YES;
    scrollView.flexMargin = UIEdgeInsetsMake(margin, margin, margin, margin);
    [self.view addSubview:scrollView];
    
    UIView *header = [UIView new];
    header.backgroundColor = [UIColor whiteColor];
    header.flexContainer = YES;
    header.flexMargin = UIEdgeInsetsMake(margin, margin, margin, margin);
    header.flexDirection = FLEXBOXFlexDirectionRow;
    header.flexWrap = YES;
    header.flexMinimumSize = CGSizeMake(320.0, 200.0);
    [scrollView addSubview:header];
    
    Avatar *avtar = [[Avatar alloc] initWithImage:[UIImage imageNamed:@"Bird6"]];
    avtar.flexFixedSize = CGSizeMake(80.0, 80.0);
    avtar.flexAlignSelf = FLEXBOXAlignmentFlexStart;
    avtar.flexMargin = UIEdgeInsetsMake(margin, margin, margin, margin);
    [header addSubview:avtar];
    
    Label *title = [[Label alloc] initWithText:@"Necropsittacus Borbonicus" align:NSTextAlignmentLeft fontSize:24.0];
    title.flex = 1;
    title.flexMargin = UIEdgeInsetsMake(margin, margin, margin, margin);
    [header addSubview:title];

    Label *subTitle = [[Label alloc] initWithText:@"A pretty but unfortunately extinct bird." align:NSTextAlignmentLeft fontSize:20.0];
    subTitle.flexMaximumSize = CGSizeMake(CGRectGetWidth(self.view.bounds) - 2 * margin, 200.0);
    [header addSubview:subTitle];

    [scrollView addSubview:[Separator new]];
    
    Label *contentText = [[Label alloc] initWithText:kContent align:NSTextAlignmentLeft fontSize:18.0];
    contentText.backgroundColor = [UIColor whiteColor];
    contentText.flexMargin = UIEdgeInsetsMake(margin, margin, margin, margin);
    [scrollView addSubview:contentText];
    
    [scrollView addSubview:[Separator new]];
    
    UIView *tagContainer = [UIView new];
    tagContainer.flexContainer = YES;
    tagContainer.flexMargin = UIEdgeInsetsMake(margin, margin, margin, margin);
    tagContainer.flexDirection = FLEXBOXFlexDirectionRow;
    tagContainer.flexWrap = YES;
    tagContainer.flexAlignItems = FLEXBOXAlignmentFlexStart;
    [scrollView addSubview:tagContainer];
    
    Label *tagLabel = [[Label alloc] initWithText:@"Tag:" align:NSTextAlignmentLeft fontSize:20.0];
    tagLabel.flexAlignSelf = FLEXBOXAlignmentFlexStart;
    [tagContainer addSubview:tagLabel];
    
    NSArray *birdNames = @[@"Bird", @"Extinct", @"Red", @"Renuion", @"Parrot", @"Psitacinae"];
    for (NSUInteger i = 0; i < birdNames.count; i ++) {
        Tag *tag = [[Tag alloc] initWithName:birdNames[i]];
        tag.flexMargin = UIEdgeInsetsMake(0, margin, margin, 0);
        [tagContainer addSubview:tag];
    }

    [scrollView addSubview:[Separator new]];
    
    UIView *friendsContainer = [UIView new];
    friendsContainer.flexContainer = YES;
    friendsContainer.flexMargin = UIEdgeInsetsMake(margin, margin, margin, margin);
    friendsContainer.flexDirection = FLEXBOXFlexDirectionRow;
    friendsContainer.flexWrap = YES;
    friendsContainer.flexAlignItems = FLEXBOXAlignmentFlexStart;
    friendsContainer.flexJustifyContent = FLEXBOXJustificationSpaceBetween;
    friendsContainer.flexMinimumSize = CGSizeMake(300.0, 300.0);
    [scrollView addSubview:friendsContainer];
    
    Label *friendLabel = [[Label alloc] initWithText:@"Friends:" align:NSTextAlignmentLeft fontSize:20.0];
    friendLabel.flexAlignSelf = FLEXBOXAlignmentFlexStart;
    [friendsContainer addSubview:friendLabel];

    NSArray *birdImageNames = @[@"Bird1", @"Bird2", @"Bird3", @"Bird4", @"Bird5", @"Bird6"];
    for (NSString *imageName in birdImageNames) {
        UIImage *image = [UIImage imageNamed:imageName];
        Avatar *imageV = [[Avatar alloc] initWithImage:image];
        imageV.flexMargin = UIEdgeInsetsMake(0, 4.0, 4.0, 0.0);
        imageV.flexSizeThatFitsBlock = ^CGSize(CGSize imageSize) {
            return CGSizeMake(80.0, 80.0);
        };
        [friendsContainer addSubview:imageV];
    }

    [scrollView addSubview:[Separator new]];
    
    [scrollView flexLayoutSubviews];
}


@end
