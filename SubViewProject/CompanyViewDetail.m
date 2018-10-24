//
//  CompanyViewDetail.m
//  SubViewProject
//
//  Created by Elzes on 17.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import "CompanyViewDetail.h"
#import "CompanyViewController.h"
#import "Company+CoreDataProperties.h"
#import "AppDelegate.h"


@interface CompanyViewDetail ()

@end

@implementation CompanyViewDetail

@synthesize _nameText = nameText,
            _serviceText = serviceText,
            _adressText = adressText;

- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    nameText =  [[UITextField alloc] initWithFrame:CGRectMake(100, 240, 200, 30)];
    nameText.borderStyle = UITextBorderStyleRoundedRect;
    nameText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter name"];
    [self.view addSubview:nameText];
    
    serviceText = [[UITextField alloc] initWithFrame:CGRectMake(100, 300, 200, 30)];
    serviceText.borderStyle = UITextBorderStyleRoundedRect;
    serviceText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter service"];
    [self.view addSubview:serviceText];

    adressText = [[UITextField alloc] initWithFrame:CGRectMake(100, 360, 200, 30)];
    adressText.borderStyle = UITextBorderStyleRoundedRect;
    adressText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter adress"];
    [self.view addSubview:adressText];
 
    //create a navigationBar
    UINavigationBar *navBar =[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 414, 50)];
    //create  an item where to put tools for use like buttons
    UINavigationItem *items = [[UINavigationItem alloc] initWithTitle:@"Detail"];
    //create your tools
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onTapCancel:)];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onTapDone:)];
   //add your tools to the item
    [items setLeftBarButtonItem:cancelBtn];
    [items setRightBarButtonItem:doneBtn];
    //create an arry where will put your items
    NSArray *myItems = [[NSArray alloc] initWithObjects:items, nil];
    //add the array to your navigationBar
    [navBar setItems:myItems];
    //add your navigationBar to the view
    [self.view addSubview:navBar];
}


-(void)onTapCancel:(UIBarButtonItem *)item{
    CompanyViewController *cViewController = [[CompanyViewController alloc] init];
   // [self.navigationController pushViewController:cViewController animated:YES];
    [self presentViewController:cViewController animated:YES completion:nil];
}

//Action of button responsible of adding a new instance of our entity.
-(void)onTapDone:(UIBarButtonItem *)item{
    // Alert interface displayed if company namy is empty
    if ([nameText.text length] == 0){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Company name is empty" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    //Adding a new instance of our entity.
    Company *company = [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:_appDelegate.managedObjectContext];
    company.name = nameText.text;
    company.service = serviceText.text;
    company.adress = adressText.text;
    [_appDelegate saveContext];
    nameText.text = @"";
    serviceText.text = @"";
    adressText.text = @"";
    
    
    
    
    //Come back to the previous view
    CompanyViewController *cViewController = [[CompanyViewController alloc] init];
    [self presentViewController:cViewController animated:YES completion:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
