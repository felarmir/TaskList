//
//  TaskList+CoreDataProperties.m
//  
//
//  Created by Denis Andreev on 26.06.16.
//
//

#import "TaskList+CoreDataProperties.h"

@implementation TaskList (CoreDataProperties)

+ (NSFetchRequest<TaskList *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"TaskList"];
}

@dynamic complate;
@dynamic date;
@dynamic name;
@dynamic taskDescription;

@end
