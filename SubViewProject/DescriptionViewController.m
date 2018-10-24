//
//  DescriptionViewController.m
//  SubViewProject
//
//  Created by Elzes on 11.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import "DescriptionViewController.h"
@interface DescriptionViewController ()

@end

@implementation DescriptionViewController

@synthesize _label = label,
            _date = date,
            _myDate = myDate;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    date = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 40, 31)];
    date.text = @"Date";
    date.textColor =[UIColor blueColor];
    [self.view addSubview:date];
    
    myDate = [[UITextView alloc] initWithFrame:CGRectMake(150, 105, 150, 31)];
    myDate.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:myDate];
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 150, 400, 400)];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    datePicker.timeZone = [NSTimeZone defaultTimeZone];
    [myDate setInputView:datePicker];
    label.text = myDate.text;
    [self.view addSubview:datePicker];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 100, 30)];
    label.text = @"Date Picker";
    label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
}
- (void)datePickerValueChanged:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // if you want to add realTime add "h:mm a" to the string@“"
    [dateFormatter setDateFormat:@"dd/MM/YYYY"];
    myDate.text = [dateFormatter stringFromDate:datePicker.date];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
