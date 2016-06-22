//
//  TaskEditor.m
//  TaskList
//
//  Created by Denis Andreev on 22.06.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import "TaskEditor.h"
#import "DataStore.h"

@interface TaskEditor ()

@end

@implementation TaskEditor
{
    BOOL isDatePickerOpen;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Add Task"];
    [_dateButton setTitle:[self dateFormater:[NSDate date]] forState:UIControlStateNormal];
    isDatePickerOpen = NO;
}

-(void)viewDidLayoutSubviews {
    if(!_datePicker) {
        CGFloat buttonXPos = _dateButton.frame.origin.x;
        CGFloat buttonYPos = _dateButton.frame.origin.y;
        CGFloat buttonHead = _dateButton.frame.size.height;
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(buttonXPos, buttonYPos+buttonHead, self.view.frame.size.width-30, 200)];
        [_datePicker addTarget:self action:@selector(datePickerAction:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_datePicker];
        _datePicker.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)showHideAnimation{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.3;
    [_datePicker.layer addAnimation:animation forKey:nil];
}

-(IBAction)selectDateButton:(id)sender {
    if (!isDatePickerOpen) {
        [self showHideAnimation];
        _datePicker.hidden = NO;
        isDatePickerOpen = YES;
    } else {
        [self showHideAnimation];
        _datePicker.hidden = YES;
        isDatePickerOpen = NO;
    }
}

-(void)datePickerAction:(id)sender {
    [_dateButton setTitle:[self dateFormater:[_datePicker date]] forState:UIControlStateNormal];
}

-(NSString *)dateFormater:(NSDate*)date {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"MMM dd, yyyy HH:mm"];
    return [formater stringFromDate:date];
}

-(IBAction)addTaskAction:(id)sender {
   BOOL isOK =  [[DataStore instance] addData:[_datePicker date] name:_taskName.text taskDescription:_taskName.text complite:NO];
    if (!isOK) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Don't add Task" message:@"Tray again" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                [alert dismissViewControllerAnimated:YES completion:nil];
            }];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
