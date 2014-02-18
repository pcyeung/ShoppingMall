//
//  MockUser.m
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 2/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//
// testing123
// TeddyKienManTest123413
// Great
// Great2

#import "MockUser.h"
#import "MyAccountHomePageViewController.h"
#import "RedeemedViewController.h"

@implementation PrizeData
@synthesize prizeName = _prizeName;

- (id) initWithPrizeName:(NSString*)name {
    self = [super init];
    if (self) {
        isRedeemed = NO;
        _prizeName = name;
    }
    return self;
}
- (bool) getIsRedeemed {
    return isRedeemed;
}
@end

@implementation VisitData
@synthesize visitTime = _visitTime;
@synthesize mall= _mall;

-(id) initWithCurrentTime:(MockMall*)mall {
    self = [super init];
    if (self) {
        _visitTime = [[NSDate alloc]init];
        _mall = mall;
    }
    return self;
}

@end

@implementation MockUser

@synthesize userName = _userName;
@synthesize visitHistory = _visitHistory;
@synthesize visitedMalls = _visitedMalls;

@synthesize prizeHistory = _prizeHistory;

+ (id)sharedUserObject {
    static MockUser *sharedUser = nil;
    @synchronized(self) {
        if (sharedUser == nil) {
            sharedUser = [[self alloc] init];
        }
    }
    return sharedUser;
}

- (id)init {
    self = [super init];
    if (self) {
        accountPoints = 0;
        _userName = @"Jason Chau";
        _visitHistory = [[NSMutableArray alloc] init];
        _visitedMalls = [[NSMutableDictionary alloc] init];
        _prizeHistory = [[NSMutableArray alloc] init];
    }
    return self;
}

-(int)getAccountPoints {
    return accountPoints;
}

-(void)setAccountPoints:(int)points {
    accountPoints = points;
}

-(void)addVisit:(MockMall*)mall controller:(UINavigationController*)controller {
    [_visitHistory addObject:[[VisitData alloc] initWithCurrentTime:mall]];

    NSInteger mallId = [mall getBeaconId];
    [_visitedMalls setObject:@"" forKey:[NSNumber numberWithInteger:mallId]];
    
    for (UIViewController *tem in controller.viewControllers) {
        if ([tem isKindOfClass:[MyAccountHomePageViewController class]]) {
            [(MyAccountHomePageViewController*)tem refreshData];
            return;
        }
    }
}

-(bool)hasVisited:(MockMall*)mall {
    NSInteger mallId = [mall getBeaconId];
    if ([_visitedMalls objectForKey:[NSNumber numberWithInteger:mallId]] != nil) {
        return YES;
    }    
    return NO;
}

-(void)addPrize:(NSString*)name controller:(UINavigationController*)controller {
    PrizeData* data = [[PrizeData alloc] initWithPrizeName:name];
    [_prizeHistory addObject:data];
    
    for (UIViewController *tem in controller.viewControllers) {
        if ([tem isKindOfClass:[RedeemedViewController class]]) {
            [(RedeemedViewController*)tem refreshData];
            return;
        }
    }
}

@end
