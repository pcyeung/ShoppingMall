//
//  MockUser.h
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 2/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MockMall.h"
#import "MockGift.h"

// PrizeData
@interface PrizeData : NSObject {
    bool isRedeemed;
}
@property(strong, nonatomic) MockGift *prize;
@property(strong, nonatomic) MockMall *mall;

- (id) initWithPrize:(MockGift*)prize mall:(MockMall*)mall;
- (bool) getIsRedeemed;

@end

// VisitData
@interface VisitData : NSObject
@property(strong, nonatomic) NSDate *visitTime;
@property(strong, nonatomic) MockMall *mall;

-(id) initWithCurrentTime:(MockMall*)mall;

@end

// MockUser
@interface MockUser : NSObject {
    int accountPoints;
    bool loggedIn;
}

@property(strong, nonatomic) NSString *userName;
@property(strong, nonatomic) NSMutableArray *visitHistory;
@property(strong, nonatomic) NSMutableDictionary *visitedMalls;

@property(strong, nonatomic) NSMutableArray *prizeHistory;

+ (id)sharedUserObject;

-(int)getAccountPoints;
-(void)setAccountPoints:(int)points;

-(BOOL)getLoggedIn;
-(void)setLoggedIn:(BOOL)li;
    
-(void)addVisit:(MockMall*)mall controller:(UINavigationController*)controller;
-(bool)hasVisited:(MockMall*)mall;

-(void)addPrize:(MockGift*)prize mall:(MockMall*)mall controller:(UINavigationController*)controller;

@end
