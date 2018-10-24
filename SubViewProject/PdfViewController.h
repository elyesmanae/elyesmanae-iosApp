//
//  PdfViewController.h
//  iosApp
//
//  Created by Elzes on 25.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface PdfViewController : UIViewController
{
    UITextField *mytile;
    UITextView *mytext;
    UIButton *pdfButton;
}

@property (strong,nonatomic) UITextField  *_mytitle;
@property (strong,nonatomic) UITextView *_mytext;
@property (strong,nonatomic) UIButton *_pdfButton;

@end
