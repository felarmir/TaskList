//
//  TaskCell.h
//  TaskList
//
//  Created by Denis Andreev on 21.06.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *taskLabel;
@property (nonatomic, strong) IBOutlet UILabel *taskDate;
@property (nonatomic, strong) IBOutlet UIButton *taskSelectButon;

-(IBAction)selectTaskSelectButon:(id)sender;

@end
