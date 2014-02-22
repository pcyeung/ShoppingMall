//
//  MockShop.m
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 22/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import "MockShop.h"

@implementation MockShop

@synthesize shopName = _shopName;
@synthesize logoImage = _logoImage;
@synthesize adImage = _adImage;

- (id) initWithData:(NSDictionary*)dataDict {
    self = [super init];
    if (self) {
        _shopName = [dataDict objectForKey:@"shop"];
        _logoImage = [dataDict objectForKey:@"logo-image"];
        _adImage = [dataDict objectForKey:@"ad-image"];
    }
    return self;
}

+ (MockShop*)getSampleShop {
    static MockShop *theShop;
    if (theShop == nil) {
        NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
        [dic setObject:@"H&M" forKey:@"shop"];
        [dic setObject:@"logo4.png" forKey:@"logo-image"];
        [dic setObject:@"" forKey:@"ad-image"];
        theShop = [[MockShop alloc]initWithData:dic];
    }
    return theShop;
}


@end
