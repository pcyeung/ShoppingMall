//
//  Sonic.h
//  SonicNotify
//
//  Created by Ryan Mannion on 11/8/11.
//  Copyright (c) 2011 Sonic Notify, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

//Core Macros
#define SONIC_DEPRECATED __attribute__((deprecated))

//Notifications are used on delegate callbacks to enabled linked functionality
FOUNDATION_EXPORT NSString *const SonicNotificationDidHearCode;
FOUNDATION_EXPORT NSString *const SonicNotificationDidReceiveActications;
FOUNDATION_EXPORT NSString *const SonicNotificationDidReceiveLocalNotification;
FOUNDATION_EXPORT NSString *const SonicNotificationPreferencesUpdated;
FOUNDATION_EXPORT NSString *const SonicNotificationReset;
FOUNDATION_EXPORT NSString *const SonicNotificationRegionUpdated;
FOUNDATION_EXPORT NSString *const SonicNotificationLocationMessage;
FOUNDATION_EXPORT NSString *const SonicNotificationCustomPayload;
FOUNDATION_EXPORT NSString *const SonicNotificationAdWillAppear;
FOUNDATION_EXPORT NSString *const SonicNotificationAdDidClose;
FOUNDATION_EXPORT NSString *const SonicUserInfoChannelCode;
FOUNDATION_EXPORT NSString *const SonicUserInfoCustomPayload;
FOUNDATION_EXPORT NSString *const SonicUserInfoContentId;

//Define Id Field Type
typedef long long int SonicId;

//Declare these classes as they are used in delegates
@class Sonic;
@class SonicContent;
@class SonicActivation;
@class SonicLocation;
@class SonicCodeHeard;
@class SonicBluetoothCodeHeard;
@class SonicAudioHeardCode;

/**
* The SDK must be in one of the following statuses.
* Note that each status implies that certain functionality maybe disabled.
*/
typedef enum {
    SonicSdkStatusNotInitialized, /**< We have not been able to determine the status of the SDK, either the program is starting or there hasn't been any network connectivity.  Delegate will not receive any code or activation calls. **/
    SonicSdkStatusDisabled,        /**< This SDK is disabled, the delegate will not receive any code or activation calls. **/
    SonicSdkStatusTrial,           /**< This SDK is in a trial (developer) mode, a message will appear to the user.  Delegate will receive code and activation calls. **/
    SonicSdkStatusEnabled          /**< This SDK is fully enabled, the delegate will receive all applicable calls. **/
} SonicSdkStatus;



/**
* Sonic delegate used for responding to sonic events, it includes several core functions
*
* - Responding to the fact that a signal is in range
* - Responding to a specific signal with the appropriate time index relative to the program
* - Respond to receiving activations (content)
* - Respond to content being deleted
* - Respond to offline content caching
*
*/
@protocol SonicDelegate <NSObject>
@optional

/**
* Callback used to provide the state of the bluetooth radio on the device.
*
* @param sonic - the configured running instance of sonic notify
* @param state - integer wich corresponds to CBCentralManager state
*
* @return BOOL - boolean is whether or not sonic notify should continue to try to use bluetooth. If the state is that bluetooth is not turned on,
* continuing to pass back true will continue to ask the user to enable the radio
*/

//Not yet implemented
- (BOOL)sonic:(Sonic *)sonic withBluetoothState:(NSNumber *)state ;


/**
* This is called when a sonic signal is heard
*
* NOTE: this does not mean content is available
*
* @param sonic instance that heard the signal
*
* @return whether or not you are interested in receiving content for this signal, it is the implementers responsibility for throttling
*@deprecated
*
*/
- (BOOL) sonicDidHearCode: (Sonic *)sonic;

/**
* This is called when a sonic signal is heard with the code that was heard
*
* NOTE: this does not mean content is available
*
* @param sonic instance that heard the signal
* @param code that was heard
*
* @return whether or not you are interested in receiving content for this signal, it is the implementers responsibility for throttling
*
*@deprecated
*/
- (BOOL) sonicDidHearCode: (Sonic *)sonic withValue: (NSNumber *) code;


/**
* This is called when a sonic signal is heard and provides a GUID which is specific to this particular signal
* only during the currently running process and provides the time interval as well if the signal has relative time.
*
* NOTE: this does not mean content is available
*
* @param sonic instance that heard the signal
* @param codeGuid unique identifier for this signal that is only good for the current process
* @param timeInterval the relative time interval for the current signal (if applicable, i.e. movies, tv, etc)
*
* @return whether or not you are interested in receiving content for this signal, it is the implementers responsibility for throttling
* @deprecated
*/
- (BOOL) sonic: (Sonic *)sonic didHearCode: (NSString *) codeGuid withTimeInterval: (NSNumber *) timeInterval;

/**
 * This is called when a sonic signal is heard and provides a code heard object
 *
 * NOTE: this does not mean content is available
 *
 * @param sonic instance that heard the signal
 * @param codeHeard instance of the SonicCodeHeard
 *
 * @return whether or not you are interested in receiving content for this signal, it is the implementers responsibility for throttling
 *
 */
- (BOOL) sonic: (Sonic *)sonic didHearCode: (SonicCodeHeard *) code;


/**
* Did receive activations is called after URL#sonic:didHearCode:withTimeInterval returns YES.
*
* The server is then queried (or offline content prepared) and activations delivered
*
* @param sonic instance that received content
* @param activations instances of SonicActivation that contain, delivery time, content, etc
*/
- (void) sonic: (Sonic *)sonic didReceiveActivations: (NSArray *) activations;

/**
* When offline content is receive by Sonic and cached internally (sonic only caches the raw data)
* it is then passed to the delegate to have the implementing system cache whatever data is required.
*
* @param sonic instance that received content
* @param contents is an array of SonicContent that needs to have application level caching completed
*/
- (void) sonic: (Sonic *)sonic cacheOfflineContent: (NSArray *) contents;

/**
* When content is no longer required to be cached this method is executed for individual pieces of content
*
* @param sonic instance that received content
* @param identifier for content, this will match the SonicContent.identifier value provided in cacheOfflineContent
*/
- (void) sonic: (Sonic *)sonic deletedContentWithIdentifier: (NSInteger) identifier;

/**
* When the SDK status changes, this method is executed with the new status
*
* @param sonic instance that changed status
* @param status new status of the SDK
*/
- (void) sonic: (Sonic *)sonic didStatusChange: (SonicSdkStatus) status;

/**
* When the application has location enabled, and the user has broken a geo-fence this will be called with that location.
* It is not guaranteed that this is called when a user has entered a geo fence.
*
* @param sonic instance that changed status
* @param location of the geo fence entered
*/
- (void) sonic: (Sonic *)sonic didGeoFenceEntered: (SonicLocation *) location;

/**
* When the application has location enabled and the user has exited a geo-fence this will be called with that location.
* It is not guaranteed that this is called for each geo fence enter event.  For example the user turned off device while inside
* a geo fence.
*
* @param sonic instance that changed status
* @param location of the geo fence exited
*/
- (void) sonic: (Sonic *)sonic didGeoFenceExited: (SonicLocation *) location;

/**
* When the application has location enabled and Sonic has determined that an updated set of locations should be monitored.
*
* @param sonic instance that changed status
* @param locations of the geo fences to monitor
*/
- (void) sonic: (Sonic *)sonic didGeoFencesUpdated: (NSArray *) locations;

@end    

/**-----------------------------------------------------------------------------
 * @name Delegate
 * -----------------------------------------------------------------------------
 */



/** The `Sonic` class manages the interaction with the Core Sonic Notify system.
 *
 *  Notifications used in delegate calls are below
 *  -SonicNotificationDidHearCode;
 *  -SonicNotificationDidReceiveActications;
 *  -SonicNotificationDidReceiveLocalNotification;
 *  -SonicNotificationPreferencesUpdated;
 *  -SonicNotificationReset;
 *  -SonicNotificationRegionUpdated;
 *  -SonicNotificationLocationMessage;
 *  -SonicNotificationCustomPayload;
 *  -SonicNotificationAdWillAppear;
 *  -SonicNotificationAdDidClose;
 *  -SonicUserInfoChannelCode;
 *  -SonicUserInfoCustomPayload;
 *  -SonicUserInfoContentId;
 */
@interface Sonic : NSObject


/**-----------------------------------------------------------------------------
 * @name Core System Calls and Setup
 * -----------------------------------------------------------------------------
 */

/**
* The delegate that was initialized with the Sonic system
*/
@property (nonatomic, retain) id <SonicDelegate> delegate;

/**
* Get the Sonic singleton to execute operations on
*
* @return Sonic singleton reference
*/
+ (Sonic *) sharedInstance;


/**
* Initialize the sonic system with the application guid and a delegate that will receive all callbacks.
*
* @param applicationGuid unique identifier provided by Sonic
* @param delegate for Sonic callbacks
*/
- (void) initializeWithApplicationGUID: (NSString *) applicationGuid andDelegate: (id <SonicDelegate>) delegate;


/**
* Start audio sampling
*
* @return whether or not listening began
*/
- (BOOL) startListening;


/**
* Stop audio sampling
*/
- (void) stopListening;

/**
 * Force location service off, this is a good opt-out opportunity
 * for users
 *
 * @param forceLocationOff whether or not to fully disable location services
 */
- (void) forceLocationOff: (BOOL) forceLocationOff;

/**
 * Force background service off, this is a good opt-out opportunity
 * for users. This will shut off all decoding by Sonic Notify, both audio and bluetooth.
 *
 * @param forceBackgroundOff whether or not to fully disable background
 */
- (void) forceBackgroundOff: (BOOL) forceBackgroundOff;

/**
 * Reset all content, activations, cached content, etc
 */
- (void) reset;

/**
 * Retrieve the current status of the SDK.
 */
- (SonicSdkStatus) status;

/**
 * Used to provide sonic with the remote notification token information for push notifications where
 * required
 * @param tokenData token data from apple for remote notifications
 */
- (void) setRemoteNotificationToken: (NSData *) tokenData;

/**
 * Delegate method providing sonic with the more notification information that was sent.
 * @param userInfo notification information
 */
- (void) didReceiveRemoteNotification:(NSDictionary *)userInfo;

/**-----------------------------------------------------------------------------
 * @name Content Calls
 * -----------------------------------------------------------------------------
 */

/**
* Mark an activation as engaged
*
* @param content that was engaged
*/
- (void) engagedContent: (SonicContent *) content;

/**
 * Make a call to retrieve an activation for a SonicCodeHeard object
 *
 * @param code
 */
- (void) getActivationWithCodeHeard:(SonicCodeHeard *) code;

/**
* Retrieve an activation by GUID
*
* @param guid of activation to retrieve
*/
- (SonicActivation *) activationForGUID: (NSString *) guid;

/**
* Retrieve content identified by its id
* @param contentId of content to retrieve
*/
- (SonicContent *) contentForId: (SonicId) contentId;

/**-----------------------------------------------------------------------------
 * @name Properties
 * -----------------------------------------------------------------------------
 */
/**
* All of the current content in the system including non active content. This means any content that the SDK is aware of, which includes non activated cached content for future display
*/
@property (nonatomic, readonly) NSArray * allContent;

/**
* All of the active, triggered content in the system. For content to appear in the array it must have been delivered by the CMS to the device because a connected beacon was "heard"
*/
@property (nonatomic, readonly) NSArray * allActiveContent;

/**
* All of the future content in the system. Future content is content which has a SNSchedule in the future, which pertains to cached content in timeline programs which have delivery dates in the future.
*/
@property (nonatomic, readonly) NSArray * allScheduledContentInTheFuture;


/**
* Access the unique identifier for this device (NOT UDID).
*/
@property (nonatomic, retain, readonly) NSString * uuid;


@end
