//
//  TableViewController.m
//  SubViewProject
//
//  Created by Elzes on 04.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import "TableViewController.h"


@implementation TableViewController

@synthesize _myArray = myArray,
_tableView = tableView,
_sectionName =sectionName ;

-(id) init {
    self = [super init];
    if(self){
   //     self.view.backgroundColor =  [UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.0f];
        
        tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.frame = CGRectMake(0, 0, 414, 450);
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
  
    myArray = [[NSMutableArray alloc]initWithObjects:
               @"New York",@"Los Angeles",@"Chicago",@"Boston", nil];
    sectionName = @"United States of America";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [myArray count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *cellId = @"SimpleTableId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSString *stringForCell;
    stringForCell = sectionName;
    cell.textLabel.text = [NSString stringWithFormat:@"%@",myArray[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *headerTitle = @"United States of America";
    return headerTitle;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   // [myArray addObject:myArray[indexPath.row]];
    NSLog(@"lalaaaaaalaaaaaaaaaaa!!1");
   /* DescriptionViewController *description = [[DescriptionViewController alloc] initWithNibName:@"DescriptionViewController" bundle:nil];
    [self.navigationController pushViewController:description animated:YES];*/
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [myArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationRight];
        [self._tableView reloadData];
    }
}



-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(nonnull NSIndexPath *)destinationIndexPath{
    
    [myArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
}

@end
