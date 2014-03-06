//
//  AppDelegate.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/25.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginListViewController.h"
#import "CheckInPageView.h"
#import "OpenUDID.h"

#import <Sonic/SonicContent.h>
#import <Sonic/SonicCodeHeard.h>
//#import "ZBarSDK.h"

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

static NSString * const kSonicNotifyGUID = @"M2I0MWEwMmEtYzE3OS00YTYwLTk0YTEtZWU2NmZhNDFiMDRm";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[Sonic sharedInstance] initializeWithApplicationGUID:kSonicNotifyGUID andDelegate:self];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [[NSUserDefaults standardUserDefaults]setObject:[OpenUDID value] forKey:@"UDID"];
    NSLog(@"%@",[OpenUDID value]);
    
    LoginListViewController *indexView;
    if (iPhone5) {
        indexView=[[LoginListViewController alloc]initWithNibName:@"LoginListViewController5" bundle:nil];
    }else{
        indexView=[[LoginListViewController alloc]initWithNibName:@"LoginListViewController" bundle:nil];
    }
    
    TCNavigationController *nav=[[TCNavigationController alloc]initWithRootViewController:indexView];
    nav.navigationBarHidden=YES;
    self.Controller=nav;
    self.window.rootViewController=self.Controller;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
 
    // fake checkin
    //[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(fakeHearCode) userInfo:nil repeats:YES];
    
   // [ZBarReaderView class];
    return YES;

}

/**
 * This is called when a sonic signal is heard and provides a GUID which is specific to this particular signal
 * only during the currently running process and provides the time interval as well if the signal has relative time.
 *
 * NOTE: this does not mean content is available
 *
 * @param sonic instance that heard the signal
 * @param code SonicCodeHeard Object for the value of the beacon
 *
 * @return whether or not you are interested in receiving content for this signal, it is the implementers responsibility for throttling
 *
 */
- (BOOL)sonic:(Sonic *)sonic didHearCode:(SonicCodeHeard *)code {
    if (![[MockUser sharedUserObject] getLoggedIn]) {
        return NO;
    }
    
    CheckInPageView *checkInPageView;
    if (iPhone5) {
        checkInPageView=[[CheckInPageView alloc]initWithFrame:[[UIScreen mainScreen] bounds] sonicCode:code nibName:@"CheckInPageView5" controller:_Controller];
    } else {
        checkInPageView=[[CheckInPageView alloc]initWithFrame:[[UIScreen mainScreen] bounds] sonicCode:code nibName:@"CheckInPageView" controller:_Controller];
    }
    if (checkInPageView != NULL) {
        [checkInPageView show];
        return YES;
    }
    return NO;
}

-(void) fakeHearCode {
    [self sonic:NULL didHearCode:NULL];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[Sonic sharedInstance] stopListening];
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ShoppingMall" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ShoppingMall.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
