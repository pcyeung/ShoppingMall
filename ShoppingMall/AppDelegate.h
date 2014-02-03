//
//  AppDelegate.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/25.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MockUser.h"
#import "TCNavigationController.h"

#import <Sonic/Sonic.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, SonicDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TCNavigationController *Controller;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) MockUser *user;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
