//
//  CompanyViewController.m
//  SubViewProject
//
//  Created by Elzes on 14.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import "CompanyViewController.h"
#import "CompanyViewDetail.h"
#import "AppDelegate.h"

@interface CompanyViewController ()

@end

@implementation CompanyViewController

@synthesize fetchResultController;
@synthesize  
            _table = table,
            _array = array,
            _filteredData = filteredData,
            _searchBar = searchBar,
            _fetchrequest = fetchrequest;

- (void)viewDidLoad {
    [super viewDidLoad];
    self._searchBar.delegate = self;
    
    UINavigationBar *navBar =[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 414, 50)];
    UINavigationItem *items = [[UINavigationItem alloc] initWithTitle:@"Companies"];
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(onTapAdd:)];
    
    [items setRightBarButtonItem:addBtn];
    NSArray *myItems = [[NSArray alloc] initWithObjects:items, nil];
    [navBar setItems:myItems];
    [self.view addSubview:navBar];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0 , 50, 414, 50)];
    searchBar.placeholder = @"Search";
    [self.view addSubview:searchBar];
    [searchBar setUserInteractionEnabled:YES];
    searchBar.delegate = (id)self;
    [self filter:@""];
    
    table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    table.frame = CGRectMake(0, 100, 414, 736);
    table.delegate = self;
    table.dataSource = self;
      [self.view addSubview:table];
    _appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    fetchrequest =[[NSFetchRequest alloc] initWithEntityName:@"Company"];
    self._array = [[_appDelegate.managedObjectContext executeFetchRequest:fetchrequest error:nil] mutableCopy];
 
    [self._table reloadData];
   
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self filter:searchText];
}

-(void)filter:()searchText{
    filteredData =[[NSMutableArray alloc] init];
    //Create the fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    //Define the entity we loocking for
    if(_appDelegate.managedObjectContext == nil){
        NSLog(@"No company available ");
    }
    else{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Company" inManagedObjectContext:_appDelegate.managedObjectContext];
        [fetchRequest setEntity:entity];
        
    }
    //Define how the entity will be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES ];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    //Testing the user entry
    if(searchBar.text.length >0 ){
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name BEGINSWITH[cd] %@)",searchText];
        [fetchRequest setPredicate:predicate];
    }
    //Put the result on the new array an display it
    NSError *error;
    NSArray *loadedEntities = [_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    self._array = [[NSMutableArray alloc] initWithArray:loadedEntities];
    [self._table reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self._array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
 static NSString *idT = @"SimpleTableId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idT];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idT];
    }
    Company *item = [self._array objectAtIndex:indexPath.row];
    
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.service;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(1, 5, 50, 25)];
    img.image = [UIImage imageNamed:@"bars.png"];
    cell.imageView.image = img.image;
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        [_appDelegate.managedObjectContext deleteObject:[self._array objectAtIndex:indexPath.row]];
        [self ._array removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
    if(editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSManagedObject *object = [array objectAtIndex:indexPath.row];
    NSManagedObject *selectedObj = object;
   CompanyViewDetail *companyViewDetail = [[CompanyViewDetail alloc] init];
   //[self.navigationController pushViewController:companyViewDetail animated:YES];
   [self presentViewController:companyViewDetail animated:YES completion:nil];
    //Sending entity information to CompanyViewDetail for edit
    Company *item = [self._array objectAtIndex:indexPath.row];
    companyViewDetail._nameText.text = item.name;
    companyViewDetail._serviceText.text = item.service;
    companyViewDetail._adressText.text = item.adress;
    
    [_appDelegate.managedObjectContext deleteObject:selectedObj];
    [self ._array removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
}

-(void)onTapAdd:(UIBarButtonItem *)item{
   CompanyViewDetail *cDetail = [[CompanyViewDetail alloc] init];
   [self presentViewController:cDetail animated:YES completion:nil];
    
}

@end
