//
//  SonicContent.h
//  sonicnotify
//
//  Created by Matt Isaacs on 3/4/13.
//  Copyright (c) 2013 Sonic Notify, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Sonic.h"

@class SonicActivation;

/**
 * SonicContent is an object that contains all the pieces that make up Sonic Content. Sonic Content can be created in the Sonic Notify CMS as well as through Sonic Notify CMS REST API calls. The content from the CMS is then delivered to the device in response to Sonic Notify triggers.
 */
@interface SonicContent : NSObject


/**
 *  Alias represents the types of different content such as URL_CONTENT
 */
@property (nonatomic, retain) NSString * alias;
/**
 *  The minimum date that the content is to be deployed at
 */
@property (nonatomic, retain) NSDate * deployDate;
/**
 *  Array containing values in the fields property
 */
@property (nonatomic, retain) NSString * fields;
/**
 *  Unique identifier which represents that specific piece of content on the device
 */
@property (nonatomic, assign) SonicId identifier;
/**
 *  Boolean specifying if the content has been activated, which means that it is available for delivery.
 */
@property (nonatomic, assign) BOOL isActivated;
/**
 *  Boolean specifying if the content has been deployed, which means that it has been delivered in connection with a Sonic trigger
 */
@property (nonatomic, assign) BOOL isDeployed;
/**
 *  Boolean specifying if the content is pendingdisplay, this value is there to prevent engaging/delivering a piece of content while it is in the process of being delivered
 */
@property (nonatomic, assign) BOOL pendingDisplay;
/**
 *  The date when the content was last updated in the CMS
 */
@property (nonatomic, retain) NSDate * lastUpdated;
/**
 *  State sent from the CMS, ACTIVE or DELETED
 */
@property (nonatomic, retain) NSString * state;
/**
 *  Identifier of the program to which the content belongs
 */
@property (nonatomic, assign) SonicId programId;
/**
 *  Unique identifier for the activation to which the content is attached.
 */
@property (nonatomic, assign) SonicId activationId;

/**
 *  Dictionary of fields which are attached to the content. Fields are set in the CMS.
 */
- (NSDictionary *) fieldsDictionary;

@end


