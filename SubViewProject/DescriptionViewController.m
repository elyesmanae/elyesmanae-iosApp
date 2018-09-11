//
//  DescriptionViewController.m
//  SubViewProject
//
//  Created by Elzes on 10.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import "DescriptionViewController.h"

@interface DescriptionViewController ()

@end

@implementation DescriptionViewController

//@synthesize  _textView = textView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   UITextView *textView = [[UITextView alloc] init];
   textView.text=@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis tincidunt libero, sed convallis libero. Vivamus non dictum velit. Nulla facilisi. Praesent auctor leo ac dolor imperdiet malesuada. Donec bibendum, purus ac pellentesque dictum, eros urna volutpat arcu, non porttitor nulla neque vel tellus. Sed bibendum nibh non pellentesque mattis. Donec pretium odio non efficitur blandit. Pellentesque pretium porttitor nunc, eu dapibus eros euismod a. Donec nunc elit, pulvinar eget turpis sit amet, vehicula posuere eros. Fusce ac bibendum velit. Suspendisse in ante augue. In a odio et sem venenatis semper nec in urna";
    
    textView.tintColor = [UIColor blackColor];
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
