//
//  ViewController.m
//  SubViewProject
//
//  Created by Elzes on 31.08.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.74f green:0.2f blue:0.23f alpha:1.0f];
    
    aboutViewController = [AboutViewController new];
    [self.view addSubview:aboutViewController.view];
    tableViewController = [TableViewController new];
    [self.view addSubview:tableViewController.view];
    headerView = [HeaderView new];
    [headerView._btnAdd addTarget:self  action:@selector(add:)  forControlEvents:UIControlEventTouchUpInside];
    headerView._searchTextField.delegate = self;
//    [self viewDidLayoutSubviews];
    [self.view addSubview:headerView];
  
    
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
}
-(void) add:(UIButton *)sender{
    [tableViewController._myArray addObject:self->headerView._searchTextField.text ];
    [tableViewController._tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect frame = CGRectMake(0, 0, 414, 150);//im not sure about it but its about the demesion
    headerView.frame = frame;
    /*frame.origin.y = 100;
    frame.origin.x = 100;*/

  
    CGRect frame2 = CGRectMake(0, 150, 414, 450);
    tableViewController.view.frame = frame2;
    
  /*  frame2.origin.x = 0;
    frame2.origin.y = 100;*/
 
    }


@end
