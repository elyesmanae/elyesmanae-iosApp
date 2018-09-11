//
//  TableViewController.h
//  SubViewProject
//
//  Created by Elzes on 04.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray *myArray;
    NSString *sectionName;
}

@property (strong) UITableView *_tableView;
@property (strong) NSMutableArray *_myArray;
@property (strong) NSString *_sectionName;


@end
