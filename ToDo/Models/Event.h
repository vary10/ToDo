//
//  Event.h
//  ToDo
//
//  Created by Valery Girkin on 24.12.14.
//  Copyright (c) 2014 Valery Girkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSString * color;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * description;
@property (nonatomic, retain) NSNumber * priority;

@end
