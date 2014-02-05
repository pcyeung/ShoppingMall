//
//  MockUser.m
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 2/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import "MockUser.h"

@implementation MockUser

@synthesize userName = _userName;
@synthesize visitHistory = _visitHistory;
@synthesize visitedMalls = _visitedMalls;


- (id)init {
    self = [super init];
    if (self) {
        accountPoints = 0;
        _userName = @"Jason Chau";
    }
    return self;
}

-(int)getAccountPoints {
    return accountPoints;
}

-(void)setAccountPoints:(int)points {
    accountPoints = points;
}

-(void)addVisit:(MockMall*)mall {
    [_visitHistory addObject:[mall mallName]];
    NSInteger mallId = [mall getMallId];
    [_visitedMalls setObject:NULL forKey:[NSNumber numberWithInteger:mallId]];
}

-(BOOL)hasVisited:(MockMall*)mall {
    NSInteger mallId = [mall getMallId];
    if ([_visitedMalls objectForKey:[NSNumber numberWithInteger:mallId]] != nil) {
        return YES;
    }
    return NO;
}

@end
