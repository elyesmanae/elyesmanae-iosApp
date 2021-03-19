//
//  HeaderView.h
//  SubViewProject
//
//  Created by Elzes on 31.08.18.
//  Copyright © 2018 Elzes. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface HeaderView : UIView
{
    UIButton *btnAdd;
    UITextField *searchTextField;
}

@property (strong, nonatomic) UIButton *_btnAdd;
@property (strong, nonatomic) UITextField *_searchTextField;

@end

