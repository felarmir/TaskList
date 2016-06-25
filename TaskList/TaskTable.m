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

@interface TaskTable ()<TaskCellDelegate>

@end

@implementation TaskTable
{
    NSMutableArray *taskData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    taskData = [NSMutableArray arrayWithArray:[[DataStore instance] dataArray]];
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
    cell.indexPath = indexPath;
    cell.delegate = self;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UIAlertController *deleteAlert = [UIAlertController alertControllerWithTitle:@"Delete" message:@"Are you wan't?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [deleteAlert dismissViewControllerAnimated:YES completion:nil];
            [self deleteRowFromBase:indexPath];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [deleteAlert dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [deleteAlert addAction:okAction];
        [deleteAlert addAction:cancelAction];
        [self presentViewController:deleteAlert animated:YES completion:nil];
    }
}

-(void)deleteRowFromBase:(NSIndexPath*)indexPath {
    TaskDataModel *tdm = [taskData objectAtIndex:indexPath.row];
    [tdm.managedObjectContext deleteObject:tdm];
    NSError *error = nil;
    [tdm.managedObjectContext save:&error];
    if (error) {
        NSLog(@"I can't delete!");
    } else {
        [taskData removeObjectAtIndex:indexPath.row];
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [self.tableView endUpdates];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

-(NSString *)dateFormater:(NSDate*)date {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"MMM dd, yyyy HH:mm"];
    return [formater stringFromDate:date];
}

-(void)didSelectCell:(NSIndexPath *)cellIndex {
    TaskCell *cell = [self.tableView cellForRowAtIndexPath:cellIndex];
    [cell.taskLabel setTextColor:[UIColor grayColor]];
    cell.taskLabel.font = [UIFont fontWithDescriptor:[self fontDeskriptorBoldItalic:cell.taskLabel] size:0];
    cell.taskDate.font = [UIFont fontWithDescriptor:[self fontDeskriptorBoldItalic:cell.taskDate] size:0];
    
}

-(void)didUnselectCell:(NSIndexPath *)cellIndex {
    TaskCell *cell = [self.tableView cellForRowAtIndexPath:cellIndex];
    
    [cell.taskLabel setTextColor:[UIColor blackColor]];
    cell.taskLabel.font = [UIFont fontWithDescriptor:[self fontDeskriptorVertical:cell.taskLabel] size:0];
    cell.taskDate.font = [UIFont fontWithDescriptor:[self fontDeskriptorVertical:cell.taskDate] size:0];
}

-(UIFontDescriptor*)fontDeskriptorBoldItalic:(UILabel*)label {
    UIFontDescriptor * fontD = [label.font.fontDescriptor
                                fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                | UIFontDescriptorTraitItalic];
    return fontD;
}

-(UIFontDescriptor*)fontDeskriptorVertical:(UILabel*)label {
    UIFontDescriptor * fontD = [label.font.fontDescriptor
                                fontDescriptorWithSymbolicTraits: UIFontDescriptorTraitVertical];
    return fontD;
}

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
