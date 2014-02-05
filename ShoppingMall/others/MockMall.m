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
            case 0:
                _mallName = @"APM";
                _adsText = @"Free APM Burgers";
                bonusPoints = 20;
                mallId = 0;
                break;
            case 1:
                _mallName = @"World Trade";
                _adsText = @"World Trade Beer";
                bonusPoints = 10;
                mallId = 1;
                break;
            default:
                _mallName = [NSString stringWithFormat:@"%d",beaconCode];
                _adsText = @"Wings?";
                bonusPoints = 5;
                mallId = 2;
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
