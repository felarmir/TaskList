//
//  TaskTable.m
//  TaskList
//
//  Created by Denis Andreev on 21.06.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import "TaskTable.h"
#import "TaskCell.h"
#import "DataStore.h"
#import "TaskDataModel.h"

@interface TaskTable ()

@end

@implementation TaskTable
{
    NSArray *taskData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

}

-(void)viewWillAppear:(BOOL)animated {
    taskData = [[DataStore instance] dataArray];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [taskData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * IDENTIFER = @"taskCell";
    TaskCell *cell = [tableView dequeueReusableCellWithIdentifier:IDENTIFER forIndexPath:indexPath];
    if (!cell) {
        cell = [[TaskCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IDENTIFER];
    }
    
    TaskDataModel *tdm = [taskData objectAtIndex:indexPath.row];
    
    cell.taskLabel.text = tdm.name;
    cell.taskDate.text = [self dateFormater:tdm.date];
    [cell.taskSelectButon setImage:nil forState:UIControlStateNormal];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

-(NSString *)dateFormater:(NSDate*)date {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"MMM dd, yyyy HH:mm"];
    return [formater stringFromDate:date];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
