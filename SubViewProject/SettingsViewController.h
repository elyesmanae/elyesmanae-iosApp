//
//  SettingsViewController.h
//  SubViewProject
//
//  Created by Elzes on 14.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableDictionary *tableContents;
    NSMutableArray *dictAllKeys;
    NSMutableArray *dictAllValues;
    NSMutableArray *array;
    NSMutableArray *about;
}

@property (strong,nonatomic) NSMutableDictionary *_tableContents;
@property (strong,nonatomic) NSMutableArray *_array;

@end
