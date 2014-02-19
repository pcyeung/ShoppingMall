//
//  MockGift.h
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 19/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MockGift : NSObject {
    int points;
}

@property(strong, nonatomic) NSString *giftName;
@property(strong, nonatomic) NSString *giftImage;
@property(strong, nonatomic) NSString *giftSize;
@property(strong, nonatomic) NSString *giftDetail;
@property(strong, nonatomic) NSString *brandLogo;
@property(strong, nonatomic) NSString *giftConCode;

+ (NSArray*)getAllGiftData;
- (int) getPoints;

@end
