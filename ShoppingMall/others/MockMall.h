//
//  MockMall.h
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 2/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Sonic/SonicAudioHeardCode.h>
#import <CoreLocation/CoreLocation.h>

@interface MockMall : NSObject {
    int bonusPoints;
    int beaconId;
    CLLocationCoordinate2D coordinates;
}

@property(strong, nonatomic) NSString *mallName;
@property(strong, nonatomic) NSString *mallAddress;
@property(strong, nonatomic) NSString *adsText;
@property(strong, nonatomic) NSString *distance;
@property(strong, nonatomic) NSString *icon;

+ (MockMall*)getMallWithSonicCode:(SonicCodeHeard *)code;
+ (NSArray*)getAllMallData;

- (int) getBonusPoints;
- (int) getBeaconId;
- (CLLocationCoordinate2D) getCoordinates;
- (NSString*) getMallName;
- (NSString*) getMallAddress;

@end
