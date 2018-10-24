//
//  TableViewController.m
//  SubViewProject
//
//  Created by Elzes on 04.09.18.
//  Copyright © 2018 Elzes. All rights reserved.
//

#import "TableViewController.h"
#import "DescriptionViewController.h"

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
               @"Berlin",@"Munich",@"Frankfort",@"Karlsruhe", nil];
    sectionName = @"I want to travel to";
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
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(1, 5, 50, 25)];
    //Add an image to the cell
    // img.image = [UIImage imageNamed:@"airplane.png"];
    cell.imageView.image = img.image;
    //cell.accessoryType = UITableViewCellAccessoryDetailButton;
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *headerTitle = sectionName;
    return headerTitle;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.title = [myArray objectAtIndex:indexPath.row];
   [myArray addObject:myArray[indexPath.row]];
  DescriptionViewController  *desc = [DescriptionViewController new];
    [self presentViewController:desc animated:YES completion:nil];
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
