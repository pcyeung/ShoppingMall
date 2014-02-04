//
//  SonicAudioHeardCode.h
//  sonicnotify
//
//  Created by Alex Bell on 11/25/13.
//  Copyright (c) 2013 Sonic Notify, Inc. All rights reserved.
//

#import "SonicCodeHeard.h"

@interface SonicAudioHeardCode : SonicCodeHeard <NSCopying>{
    long _timeInterval;
    int _customPayload;
}

/**
 * Time Interval that was decoded, returns nil if none
 */
@property (nonatomic, assign) long timeInterval;

/**
 * Custom Payload that was decoded, returns nil if none
 */
@property (nonatomic, assign) int customPayload;


@end
