//
//  CompanyViewDetail.h
//  SubViewProject
//
//  Created by Elzes on 17.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyViewController.h"
#include "AppDelegate.h"
#import <CoreData/CoreData.h>


@interface CompanyViewDetail : UIViewController
{
    UITextField *nameText;
    UITextField *serviceText;
    UITextField *adressText;
}

@property (strong,nonatomic) id detailItem;
@property (weak,nonatomic) AppDelegate *appDelegate;
@property (strong,nonatomic) UIBarButtonItem *_cancelBtn;
@property (strong,nonatomic) UITextField *_nameText;
@property (strong,nonatomic) UITextField *_serviceText;
@property (strong,nonatomic) UITextField *_adressText;


@end
