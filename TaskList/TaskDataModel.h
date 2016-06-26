//
//  TaskDataModel.h
//  TaskList
//
//  Created by Denis Andreev on 22.06.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface TaskDataModel : NSManagedObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *taskDescription;
@property (nonatomic, strong) NSNumber *complate;

@end
