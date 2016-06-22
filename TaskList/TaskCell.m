//
//  TaskCell.m
//  TaskList
//
//  Created by Denis Andreev on 21.06.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import "TaskCell.h"

@implementation TaskCell
{
    BOOL isSelectedTask;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    isSelectedTask = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(IBAction)selectTaskSelectButon:(id)sender{
    if (!isSelectedTask) {
        [self.taskSelectButon setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateNormal];
        isSelectedTask = YES;
    } else {
        [self.taskSelectButon setImage:nil forState:UIControlStateNormal];
        isSelectedTask = NO;
    }
}

@end
