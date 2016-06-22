//
//  TaskDataController.h
//  TaskList
//
//  Created by Denis Andreev on 22.06.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface TaskDataController : NSObject

@property (strong) NSManagedObjectContext *managedObjectContext;

@end
