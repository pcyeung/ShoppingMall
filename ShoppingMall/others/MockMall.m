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

- (id)initWithSonicCode:(SonicCodeHeard*)code {
    self = [super init];
    if (self) {
        // Initialization code
        int beaconCode = -1;
        if ([code isKindOfClass:[SonicBluetoothCodeHeard class]]) {
            SonicBluetoothCodeHeard* blueHeard = (SonicBluetoothCodeHeard*) code;
            beaconCode = [blueHeard beaconCode];
        } else if ([code isKindOfClass:[SonicAudioHeardCode class]]) {
            SonicAudioHeardCode* audioHeard = (SonicAudioHeardCode*) code;
            beaconCode = [audioHeard beaconCode];
        }
        
        switch (beaconCode) {
            case 802396:
                _mallName = @"时代广场";
                _mallAddress = @"Wanchai";
                _adsText = @"赠送烤鸡腿";
                bonusPoints = 10;
                mallId = 1;
                break;
            case 802399:
                _mallName = @"世贸中心";
                _mallAddress = @"Wanchai";
                _adsText = @"赠送电影票";
                bonusPoints = 15;
                mallId = 3;
                break;
            default:
                _mallName = [NSString stringWithFormat:@"Code %d",beaconCode];
                _mallAddress = @"Wanchai";
                _adsText = @"Free Wings?";
                bonusPoints = 5;
                mallId = 0;
                break;
        }
    }
    return self;
}

- (int) getBonusPoints {
    return bonusPoints;
}

- (int) getMallId {
    return mallId;
}

@end
