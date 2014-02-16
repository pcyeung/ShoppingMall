//
//  MockMall.m
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 2/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import "MockMall.h"
#import <Sonic/SonicBluetoothCodeHeard.h>
#import <Sonic/SonicCodeHeard.h>
#import <Sonic/SonicContent.h>

@implementation MockMall

@synthesize mallName = _mallName;
@synthesize mallAddress = _mallAddress;
@synthesize adsText = _adsText;

- (id)initMallWithName:(NSString*)name address:(NSString*)address ads:(NSString*)ads bonusPoints:(int)bp  mallId:(int)mid beaconId:(int)bid latitude:(float)latitude longitude:(float)longtitude {
    self = [super init];
    if (self) {
        _mallName = name;
        _mallAddress = address;
        _adsText = ads;
        bonusPoints = bp;
        beaconId = bid;
        mallId = mid;
        coordinates.latitude = latitude;
        coordinates.longitude = longtitude;
    }
    return self;
}

+ (NSArray*)getAllMallData {
    static NSArray *allMalls;
    if (allMalls == nil) {
        allMalls =
            [NSArray arrayWithObjects:
             [[MockMall alloc]initMallWithName:@"时代广场" address:@"Wanchai" ads:@"赠送烤鸡腿" bonusPoints:10 mallId:1 beaconId:802396 latitude:22.278151 longitude:114.181706],
             [[MockMall alloc]initMallWithName:@"世贸中心" address:@"Causeway Bay" ads:@"赠送电影票" bonusPoints:15 mallId:2 beaconId:802399 latitude:22.281528 longitude:114.184219],
             nil];
    }
    return allMalls;
}

+ (NSDictionary*)getBeaconIdMap {
    static NSDictionary *beaconIdMap;
    if (beaconIdMap == nil) {
        NSArray* allMalls = [MockMall getAllMallData];
        NSMutableArray* beaconIds = [[NSMutableArray alloc]init];
        for (MockMall* mall in allMalls) {
            [beaconIds addObject:[[NSNumber alloc]initWithInt:[mall getBeaconId]]];
        }
        beaconIdMap = [[NSDictionary alloc]initWithObjects:allMalls forKeys:beaconIds];
    }
    return beaconIdMap;
}

+ (void)load {
    [super load];
    [MockMall getAllMallData];
}

+ (MockMall*)getMallWithSonicCode:(SonicCodeHeard*)code {
    int beaconCode = -1;
    if ([code isKindOfClass:[SonicBluetoothCodeHeard class]]) {
        SonicBluetoothCodeHeard* blueHeard = (SonicBluetoothCodeHeard*) code;
        beaconCode = [blueHeard beaconCode];
    } else if ([code isKindOfClass:[SonicAudioHeardCode class]]) {
        SonicAudioHeardCode* audioHeard = (SonicAudioHeardCode*) code;
        beaconCode = [audioHeard beaconCode];
    }
    
    if (beaconCode == -1) {
        return [[MockMall alloc]initMallWithName:@"Unrecognized" address:[NSString stringWithFormat:@"%d", beaconCode] ads:@"Free books" bonusPoints:5 mallId:-1 beaconId:-1 latitude:0 longitude:0];
    }

    NSNumber* beaconNumber = [[NSNumber alloc]initWithInt:beaconCode];
    NSDictionary* beaconMap = [MockMall getBeaconIdMap];
    MockMall* mall = [beaconMap objectForKey:beaconNumber];
    return mall;
}

- (int) getBonusPoints {
    return bonusPoints;
}

- (int) getMallId {
    return mallId;
}

- (int) getBeaconId {
    return beaconId;
}

- (CLLocationCoordinate2D) getCoordinates {
    return coordinates;
}

@end
