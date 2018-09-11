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
    label =[[UILabel alloc] initWithFrame:CGRectMake(10, 570, 200, 100)];
    label.text = @"about";
    [self.view addSubview:label];
    
    text = [[UITextView alloc] initWithFrame:CGRectMake(0, 650, 414, 736)];
    text.text = @"Pulvinar eget turpis sit amet, vehicula posuere eros. Fusce ac bibendum velit. Suspendisse in ante augue. In a odio et sem venenatis semper nec in urna.";
    text.contentSize = CGSizeMake(100, 25)  ;
    //text.backgroundColor = [UIColor grayColor];
    [self.view addSubview:text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
