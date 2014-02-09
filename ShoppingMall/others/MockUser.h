//
//  MockUser.h
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 2/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MockMall.h"

@interface MockUser : NSObject {
    int accountPoints;
}

@property(strong, nonatomic) NSString *userName;
@property(strong, nonatomic) NSMutableArray *visitHistory;
@property(strong, nonatomic) NSMutableDictionary *visitedMalls;


-(int)getAccountPoints;
-(void)setAccountPoints:(int)points;
-(void)addVisit:(MockMall*)mall;
-(bool)hasVisited:(MockMall*)mall;

@end
