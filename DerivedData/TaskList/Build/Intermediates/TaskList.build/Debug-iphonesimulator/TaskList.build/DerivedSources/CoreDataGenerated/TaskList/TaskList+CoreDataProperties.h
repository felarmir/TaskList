//
//  TaskList+CoreDataProperties.h
//  
//
//  Created by Denis Andreev on 21.06.16.
//
//

#import "TaskList+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface TaskList (CoreDataProperties)

+ (NSFetchRequest<TaskList *> *)fetchRequest;

@property (nonatomic) BOOL complate;
@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *taskDescription;

@end

NS_ASSUME_NONNULL_END
