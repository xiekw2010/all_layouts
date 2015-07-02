//
//  HomeViewController.m
//  
//
//  Created by xiekw on 15/4/1.
//  Copyright (c) 2015年 Modudu. All rights reserved.
//

#import "HomeViewController.h"
#import <Nimbus/NimbusModels.h>

@interface HomeViewController ()

@end

@implementation HomeViewController {
    NITableViewActions *_actions;
    NITableViewModel *_model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"all_layouts";
    _actions = [[NITableViewActions alloc] initWithTarget:self];
    
    NSArray *sections
    = @[@"FlexBoxKit",
        [_actions attachToObject:[NISubtitleCellObject objectWithTitle:@"Demo" subtitle:@""]
                 navigationBlock:NIPushControllerAction(NSClassFromString(@"ALFlexBoxKitViewController"))],
        [_actions attachToObject:[NISubtitleCellObject objectWithTitle:@"Round" subtitle:@""]
                 navigationBlock:NIPushControllerAction(NSClassFromString(@"ALFLexPropertiesViewController"))],
        @"FLXView",
        [_actions attachToObject:[NISubtitleCellObject objectWithTitle:@"Demo" subtitle:@""]
                 navigationBlock:NIPushControllerAction(NSClassFromString(@"ALFLXExampleViewController"))]
        
        ];
    _model = [[NITableViewModel alloc] initWithSectionedArray:sections delegate:(id)[NICellFactory class]];
    
    self.tableView.dataSource = _model;
    self.tableView.delegate = _actions;
    self.tableView.rowHeight = 60.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
