//
//  AboutViewController.m
//  SubViewProject
//
//  Created by Elzes on 05.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()


@end

@implementation AboutViewController

@synthesize _label = label, _text = text;

- (void)viewDidLoad {
    [super viewDidLoad];
    label =[[UILabel alloc] initWithFrame:CGRectMake(10, 15, 50, 50)];
    label.text = @"about";
    [self.view addSubview:label];
    
    text = [[UITextView alloc] initWithFrame:CGRectMake(0, 50, 414, 150)];
    text.text = @"Travel is the movement of people between distant geographical locations. Travel can be done by foot, bicycle, automobile, train, boat, bus, airplane, or other means, with or without luggage, and can be one way or round trip.Pulvinar eget turpis sit amet, vehicula posuere eros. Fusce ac bibendum velit In a odio et sem venenatis semper.Pulvinar eget turpis sit amet, vehicula posuere eros. Fusce ac bibendum velit. Suspendisse in ante augue. In a odio et sem venenatis semper.";
    text.contentSize = CGSizeMake(100, 25)  ;
    //text.backgroundColor = [UIColor grayColor];
    [self.view addSubview:text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
