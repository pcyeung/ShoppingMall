//
//  SonicBluetoothCodeHeard.h
//  sonicnotify
//
//  Created by Alex Bell on 11/25/13.
//  Copyright (c) 2013 Sonic Notify, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SonicCodeHeard.h"
#import <CoreLocation/CoreLocation.h>

@interface SonicBluetoothCodeHeard : SonicCodeHeard <NSCopying>{
    int _rssiValue;
    CLProximity _proximity;
    CLLocationAccuracy _accuracy;
    BOOL _fromiBeacon;
    BOOL _securityBeacon;
}

/**
 * RSSI Value that was decoded, returns nil if none
 */
@property (nonatomic, assign) int rssiValue;

/**
 * Proximity for beacon decoded
 */
@property (nonatomic, assign) CLProximity proximity;

/**
 * Accuracy of beacons
 */
@property (nonatomic, assign) CLLocationAccuracy accuracy;

/**
 * Boolean true if code heard using iBeacon, false if just regular BLE
 */
@property (nonatomic, assign) BOOL fromiBeacon;

/**
 * Boolean true if code heard using security beacon
 */
@property (nonatomic, assign) BOOL securityBeacon;

@end
