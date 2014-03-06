//
//  AddressAnnotation.h
//  ShoppingMall
//
//  Created by Teddy on 16/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "MockMall.h"


@interface AddressAnnotation : NSObject<MKAnnotation> {
	CLLocationCoordinate2D coordinate;
}

@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property (strong, nonatomic) MockMall *mall;


- (NSString *)subtitle;

- (NSString *)title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c;


-(id)initWithCoordinate:(CLLocationCoordinate2D)c mall:(MockMall*)m;

@end
