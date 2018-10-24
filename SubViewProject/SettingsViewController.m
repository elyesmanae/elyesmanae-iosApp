//
//  SettingsViewController.m
//  SubViewProject
//
//  Created by Elzes on 14.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize _tableContents = tableContents,
_array = array;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    tableContents = [[NSMutableDictionary alloc] init];
    NSMutableArray *about = [[NSMutableArray alloc] initWithObjects:@"A",@"B",@"D", nil];
    [tableContents setValue:about forKey:@"about"];
    NSMutableArray *new = [[NSMutableArray alloc] initWithObjects:@"C",@"D",@"D", nil];
    [tableContents setValue:new forKey:@"new"];
    NSMutableArray *end = [[NSMutableArray alloc] initWithObjects:@"E",@"F",@"D", nil];
    [tableContents setValue:end forKey:@"end"];
    dictAllKeys=[NSMutableArray arrayWithArray:[tableContents allKeys]];
    dictAllValues=[NSMutableArray arrayWithArray:[tableContents allValues]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0){
        return @"About";
    }
    else if (section == 1){
        return @"New";
    }
    else return @"End";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpletableIdentifier = @"tableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpletableIdentifier];
    if (cell == nil){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpletableIdentifier];
    }
   NSArray *listData = [tableContents allValues];
 //NSMutableArray *listData = [NSMutableArray arrayWithArray:[tableContents  allValues]];
    //cell.textLabel.text = [listData objectAtIndex:[indexPath row]];
    //cell.textLabel.text = (NSString*)[ (NSMutableArray*)[listData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = [tableContents objectForKey:[listData objectAtIndex:[indexPath section]]];
   // cell.textLabel.text = [NSString stringWithFormat:@"%@",about [indexPath.row]];
    //[cell.textLabel setText:[NSString stringWithFormat:@"%@",about [indexPath.row]]];
    cell.contentView.layer.cornerRadius = 5;
    cell.contentView.layer.masksToBounds = YES;
    
    return cell;
}


@end
