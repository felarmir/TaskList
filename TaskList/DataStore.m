//
//  DataStore.m
//  TaskList
//
//  Created by Denis Andreev on 21.06.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import "DataStore.h"
#import "AppDelegate.h"
#import "TaskDataController.h"
#import "TaskDataModel.h"

@implementation DataStore
{
    TaskDataController *dataController;
}


+(DataStore*)instance {
    static DataStore *storeInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        storeInstance = [[self alloc] init];
    });
    return storeInstance;
}


-(NSArray*)dataArray {
    dataController = [[TaskDataController alloc] init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TaskList" inManagedObjectContext:[dataController managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *dataArray = [[dataController managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Fetch Data Error");
    } else {
        return dataArray;
    }
    
    return nil;
}

-(BOOL)addData:(NSDate*)date name:(NSString*)name taskDescription:(NSString*)taskDescription complite:(BOOL)complite{
    TaskDataModel *dataRow = [NSEntityDescription insertNewObjectForEntityForName:@"TaskList" inManagedObjectContext:[dataController managedObjectContext]];
    dataRow.name = name;
    dataRow.date = date;
    dataRow.taskDescription = taskDescription;
    dataRow.complate = complite;
    
    NSError *error = nil;
    [dataRow.managedObjectContext save:&error];
    if (error) {
        return NO;
    }
    return YES;
}

@end
