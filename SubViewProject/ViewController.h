//
//  ViewController.h
//  SubViewProject
//
//  Created by Elzes on 31.08.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "TableViewController.h"
#import "AboutViewController.h"
#import "DescriptionViewController.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    TableViewController *tableViewController;
    HeaderView *headerView;
    AboutViewController *aboutViewController;
    DescriptionViewController *descView;
}

@end

