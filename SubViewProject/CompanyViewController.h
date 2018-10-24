//
//  CompanyViewController.h
//  SubViewProject
//
//  Created by Elzes on 14.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyViewDetail.h"
#import "AppDelegate.h"
#import "Company+CoreDataClass.h"


@interface CompanyViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
    UITableView *table;
    NSMutableArray *array;
    UISearchBar *searchBar;
    UISearchController *searchController;
    NSMutableArray *filteredData;
    NSFetchRequest *fetchrequest;
}
@property (strong,nonatomic) UITableView *_table;
@property (strong,nonatomic) NSMutableArray *_array;
@property (strong,nonatomic) UISearchBar *_searchBar;
@property (strong,nonatomic) UISearchController *_searchController;
@property (strong,nonatomic) NSMutableArray *_filteredData;
//coreData
@property (retain,nonatomic) NSFetchRequest *_fetchrequest;
@property (retain,nonatomic) NSFetchedResultsController *fetchResultController;
@property (retain,nonatomic) AppDelegate *appDelegate;


@end

