//
//  HeaderView.m
//  SubViewProject
//
//  Created by Elzes on 31.08.18.
//  Copyright © 2018 Elzes. All rights reserved.
//
#import "HeaderView.h"
@implementation HeaderView

@synthesize  _btnAdd = btnAdd,
_searchTextField = searchTextField;

-(id) init {
    self = [super init];
    if (self){
       
        btnAdd = [UIButton buttonWithType:UIButtonTypeSystem];
        btnAdd.layer.cornerRadius = 8;
        btnAdd.clipsToBounds = YES;
        [btnAdd setTitle:@"Add" forState:UIControlStateNormal];
        btnAdd.backgroundColor = [UIColor grayColor];
        [btnAdd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:btnAdd];
       
        searchTextField = [[UITextField alloc] init];
        searchTextField.backgroundColor = [UIColor whiteColor];
        searchTextField.borderStyle = UITextBorderStyleRoundedRect;
        searchTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter City"];
        [self._searchTextField becomeFirstResponder];
        [self addSubview:searchTextField];
    }
    return self;
}


-(void)layoutSubviews {
    [super layoutSubviews];

    CGRect Frm_BtnAdd = CGRectZero;
    Frm_BtnAdd.size =  CGSizeMake(100, 31);
    Frm_BtnAdd.origin.x = 290;
    Frm_BtnAdd.origin.y = 20;
    btnAdd.frame = Frm_BtnAdd;
    
    
    CGRect Frm_Search = CGRectZero;
    Frm_Search.size = CGSizeMake(220, 31);
    Frm_Search.origin.x = 50;
    Frm_Search.origin.y = 20;
    searchTextField.frame = Frm_Search;
    

}
@end

