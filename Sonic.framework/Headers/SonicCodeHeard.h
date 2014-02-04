
//
//  SonicCodeHeard.h
//  sonicnotify
//
//  Created by Alex Bell on 11/25/13.
//  Copyright (c) 2013 Sonic Notify, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SonicCodeHeard : NSObject {
    long _beaconCode;
    long _timeCodeHeard;
    NSArray * _codesHeard;
}

/**
 * Code that was heard by the beacon
 */
@property (nonatomic, assign) long beaconCode;
/**
 * The time that the code was heard
 */
@property (nonatomic, assign) long timeCodeHeard;
/**
 * Array of codes heard
 */
@property (nonatomic, retain) NSArray * codesHeard;



@end