//
//  CommonInstance.h
//  app
//
//  Created by Ben Ma on 12-10-29.
//  Copyright (c) 2012年 iBrand International Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CommonInstance : NSObject<NSURLConnectionDataDelegate>{

}
@property (nonatomic,readonly)NSString *connetStatus;
+(CommonInstance *)setStatus;
-(void)checkStatus;
-(void)setValue;
-(NSData *)dataByRequestWithURLString:(NSString *)_url parameter:(NSString *)para;
-(NSData *)dataByRequestWithURLString:(NSString *)_geturl;
-(void)writerFilesForPush:(NSString *)message;
-(NSMutableDictionary *)selectAllPush;

/*
//for in-database
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
-(NSURL *)applicationDocumentsDirectory;

-(NSMutableArray *)selectDate:(int)sender  selectDetail:(NSString *)detail;
-(NSMutableArray *)selectLastDate;
-(NSMutableArray *)selectAllDate;*/
@end
