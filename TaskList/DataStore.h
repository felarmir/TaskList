//
//  DataStore.h
//  TaskList
//
//  Created by Denis Andreev on 21.06.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStore : NSObject

+(DataStore*)instance;
-(NSArray*)dataArray;
-(BOOL)addData:(NSDate*)date name:(NSString*)name taskDescription:(NSString*)taskDescription complite:(BOOL)complite;

@end
