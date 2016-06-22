//
//  TaskEditor.h
//  TaskList
//
//  Created by Denis Andreev on 22.06.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskEditor : UIViewController

@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) IBOutlet UIButton *dateButton;
@property (nonatomic, strong) IBOutlet UITextField *taskName;
@property (nonatomic, strong) IBOutlet UITextField *taskDescription;

@end
