//
//  DescriptionViewController.h
//  SubViewProject
//
//  Created by Elzes on 11.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DescriptionViewController : UIViewController<UITextViewDelegate>

{
    UILabel *label;
    UILabel *date;
    UITextView *myDate;
    UIDatePicker *datePicker;
  
}
@property (strong,nonatomic) UILabel *_label;
@property (strong,nonatomic) UILabel *_date;
@property (strong,nonatomic) UITextView *_myDate;
@property (strong,nonatomic) UIDatePicker *_datePicker;

@end
