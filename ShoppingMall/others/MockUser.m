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

-(void)addVisit:(NSString*)visit {
    [_visitHistory addObject:visit];
}

@end
