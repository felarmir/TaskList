//
//  TaskDataController.m
//  TaskList
//
//  Created by Denis Andreev on 22.06.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import "TaskDataController.h"

@implementation TaskDataController

-(id)init
{
    self = [super init];
    if (!self) return nil;
    
    [self initializeCoreData];
    
    return self;
}

-(void)initializeCoreData {
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"TaskList" withExtension:@"momd"];
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSAssert(mom != nil, @"Error init Data Model");
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [moc setPersistentStoreCoordinator:psc];
    [self setManagedObjectContext:moc];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentURL URLByAppendingPathComponent:@"TaskList.sqlite"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        NSError *error = nil;
        NSPersistentStoreCoordinator *psc = [[self managedObjectContext] persistentStoreCoordinator];
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
        NSAssert(store != nil, @"Eror ini PSC: %@\n%@", [error localizedDescription], [error userInfo]);
    });
    
}


@end
