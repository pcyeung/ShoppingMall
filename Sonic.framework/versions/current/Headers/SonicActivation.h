//
//  SonicActivation.h
//  sonicnotify
//
//  Created by Matt Isaacs on 2/6/13.
//  Copyright (c) 2013 Sonic Notify, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SonicContent;
/**
 * The Sonic Activation is the object which contains a piece of content that was delivered and other information about the delivery. An activation is used by the CMS to count and sort analytics. It is also useful on the device to view information on pieces of content which may have been delivered multiple times. Each activation has one and only one piece of content tied to it.
 */
@interface SonicActivation : NSObject
/**
 *  Unique identifier which represents that specific piece of content on the device
 */
@property (nonatomic, readonly) SonicId identifier;
/**
 *  The unique indentifier of the content which is associated with this activation
 */
@property (nonatomic, assign) SonicId contentId;
/**
 * A boolean to specify whether the activation has been engaged or not, engagement means that the content has been shown to the user.
 */
@property (nonatomic, assign) BOOL engaged;
/**
 * The activation GUID is a unique across the device and CMS identifier of the activation
 */
@property (nonatomic, retain) NSString * guid;
/**
 * The Sonic Notify code (i.e. beacon code or trigger code) which was used to trigger the activation
 */
@property (nonatomic, assign) long long int code;
/**
 * Some sources of Sonic Notify triggers have timeIndexs which represent the millisecond point in certain Sonic Notify transmissions.
 */
@property (nonatomic, assign) long long int timeIndex;
/**
 * The single SonicContent attached to the activation
 */
@property (nonatomic, readonly) SonicContent * content;



@end
