//
//  TaskCell.h
//  TaskList
//
//  Created by Denis Andreev on 21.06.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TaskCellDelegate <NSObject>

-(void)didSelectCell:(NSIndexPath*)cellIndex;
-(void)didUnselectCell:(NSIndexPath*)cellIndex;

@end

@interface TaskCell : UITableViewCell

@property (nonatomic, assign) id<TaskCellDelegate> delegate;

@property (nonatomic, strong) IBOutlet UILabel *taskLabel;
@property (nonatomic, strong) IBOutlet UILabel *taskDate;
@property (nonatomic, strong) IBOutlet UIButton *taskSelectButon;
@property (nonatomic, strong) NSIndexPath *indexPath;

-(IBAction)selectTaskSelectButon:(id)sender;

@end
