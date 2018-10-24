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
    tableViewController = [TableViewController new];
    [self.view addSubview:tableViewController.view];
    
    aboutViewController = [AboutViewController new];
    [self.view addSubview:aboutViewController.view];
  
    headerView = [HeaderView new];
    [headerView._btnAdd addTarget:self  action:@selector(add:)  forControlEvents:UIControlEventTouchUpInside];
    headerView._searchTextField.delegate = self;
    [self.view addSubview:headerView];
    
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
}
-(void) add:(UIButton *)sender{
    [tableViewController._myArray addObject:self->headerView._searchTextField.text ];
    headerView._searchTextField.text = @"";
    [tableViewController._tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect frame = CGRectMake(0, 0, 414, 70);//im not sure about it but its about the demesion
    headerView.frame = frame;
    /*frame.origin.y = 100;
    frame.origin.x = 100;*/

  
    CGRect frame2 = CGRectMake(0, 65, 414, 400);
    tableViewController.view.frame = frame2;
    
    CGRect frame3 = CGRectMake(0, 500, 414 , 300);
    aboutViewController.view.frame = frame3;
  /*  frame2.origin.x = 0;
    frame2.origin.y = 100;*/
 
    }


@end
