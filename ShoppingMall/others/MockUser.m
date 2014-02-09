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
        _visitHistory = [[NSMutableArray alloc] init];
        _visitedMalls = [[NSMutableDictionary alloc] init];
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
    [_visitedMalls setObject:@"" forKey:[NSNumber numberWithInteger:mallId]];
    NSLog([NSString stringWithFormat:@"add id: %d", [mall getMallId]]);

}

-(BOOL)hasVisited:(MockMall*)mall {
    NSInteger mallId = [mall getMallId];
    if ([_visitedMalls objectForKey:[NSNumber numberWithInteger:mallId]] != nil) {
        return YES;
    }
    
    NSString* debString = [_visitedMalls objectForKey:[NSNumber numberWithInteger:mallId]];
    NSLog([NSString stringWithFormat:@"add id: %@", debString]);
    return NO;
}

@end
