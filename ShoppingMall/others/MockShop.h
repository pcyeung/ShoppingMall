//
//  MockShop.h
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 22/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MockShop : NSObject {
}

@property(strong, nonatomic) NSString *shopName;
@property(strong, nonatomic) NSString *logoImage;
@property(strong, nonatomic) NSString *adImage;

+ (MockShop*)getSampleShop;

@end
