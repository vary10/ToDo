//
//  Event.h
//  ToDo
//
//  Created by Valery Girkin on 22.01.15.
//  Copyright (c) 2015 Valery Girkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * color;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * descrition;
@property (nonatomic, retain) NSNumber * priority;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * planned;
@property (nonatomic, retain) NSDate * createdAt;

@end
