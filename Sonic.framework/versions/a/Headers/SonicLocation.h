//
//  SonicLocation.h
//  sonicnotify
//
//  Created by Matt Isaacs on 3/19/13.
//  Copyright (c) 2013 Sonic Notify, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sonic.h"

/**
 * Sonic Locatios are the objects which govern the geo-fence operation of the sdk. The geographic locations where the sdk starts and stops listening for Sonic triggers. The behaviour and actual geographic points are added in the CMS
 */
@interface SonicLocation : NSObject

/**
 * the identifier unique on the device for the Sonic Location
 */
@property (nonatomic, assign) SonicId identifier;
/**
 * The name of the location entered in the CMS
 */
@property (nonatomic, retain) NSString * name;
/**
 * The date at which the location is no longer valid and has expired
 */
@property (nonatomic, retain) NSDate * endTime;
/**
 *  The date at which the location starts being valid
 */
@property (nonatomic, retain) NSDate * startTime;
/**
 * the latitude of the location
 */
@property (nonatomic, assign) double latitude;
/**
 * the longitude of the location
 */
@property (nonatomic, assign) double longitude;
/**
 *  the range of the location which represents the radius from the center point
 */
@property (nonatomic, assign) double radius;
/**
 * the state of the location
 */
@property (nonatomic, retain) NSString * state;
/**
 * the program id to which the location belongs
 */
@property (nonatomic, assign) SonicId programId;

@end
