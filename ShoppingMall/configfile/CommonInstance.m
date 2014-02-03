//
//  CommonInstance.m
//  app
//
//  Created by Ben Ma on 12-10-29.
//  Copyright (c) 2012年 iBrand International Limited. All rights reserved.
//

#import "CommonInstance.h"
#import "Reachability.h"

@implementation CommonInstance
@synthesize connetStatus;
/*@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;*/
+(CommonInstance *)setStatus{
    static CommonInstance *status;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        status=[[CommonInstance alloc]init];
        
    });
    return status;
}

- (id)init {
    self = [super init];
    if (self) {
        [self setValue];
        [self performSelector:@selector(checkStatus)];
        //[self performSelectorInBackground:@selector(checkStatus) withObject:nil];
    }
    return self;
}

-(void)checkStatus{
    
    NSTimer *time=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(setValue) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:time forMode:NSDefaultRunLoopMode];
}

-(void)setValue{
    @autoreleasepool {
        Reachability *reach=[Reachability reachabilityWithHostname:@"www.baidu.com"];
        if ([reach currentReachabilityStatus]!=NotReachable) {
            connetStatus=@"Success";
        }else{
            connetStatus=@"Error";
        }
        NSLog(@"NetWork---------------%@",connetStatus);
    }

}

#pragma mark -
#pragma mark push
-(void)writerFilesForPush:(NSString *)message{
    NSFileManager *filemanager=[NSFileManager defaultManager];
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirector=[paths objectAtIndex:0];
    NSLog(@"%@",documentDirector);
    [filemanager changeCurrentDirectoryPath:documentDirector];
    NSString *path=[documentDirector stringByAppendingPathComponent:@"push.txt"];
    if(![filemanager fileExistsAtPath:@"push.txt"])
        [filemanager createFileAtPath:@"push.txt" contents:nil attributes:nil];
    else
        NSLog(@"yes");
    
    NSMutableData *writer=[[NSMutableData alloc]init];
    [writer appendData:[message dataUsingEncoding:NSUTF8StringEncoding]];
    [writer writeToFile:path atomically:YES];
}

-(NSMutableDictionary *)selectAllPush{
    NSFileManager *filemanager=[NSFileManager defaultManager];
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirector=[paths objectAtIndex:0];
    NSString *path=[documentDirector stringByAppendingPathComponent:@"push.txt"];
    [filemanager changeCurrentDirectoryPath:documentDirector];
    NSString *gdata2;
    if([filemanager fileExistsAtPath:@"push.txt"]){
        NSData *reader=[filemanager contentsAtPath:path];
        gdata2=[[NSString alloc]initWithData:reader encoding:NSUTF8StringEncoding];
        NSLog(@"%@",gdata2);
    }
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    if([gdata2 length]>0)
        arr=[NSMutableArray arrayWithArray:[gdata2 componentsSeparatedByString:@"\n"]];
   [dic setObject:arr forKey:@"content"];
    return dic;
}



#pragma mark -
#pragma mark api
-(NSData *)dataByRequestWithURLString:(NSString *)_url parameter:(NSString *)para{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];  
    [request setURL:[NSURL URLWithString:_url]]; 
   // NSLog(@"%@",para);
    [request setHTTPMethod:@"POST"];
    //将post数据转换为 NSASCIIStringEncoding 编码格式  
    NSData *body = [para dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];  
    
    [request setHTTPBody:body];  
    //NSError *error;
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
   // NSLog(@"%@",error);
    
    return returnData;
}

-(NSData *)dataByRequestWithURLString:(NSString *)_geturl{
    //第一步，创建URL
    
    NSURL *url = [NSURL URLWithString:_geturl];
    
    //第二步，通过URL创建网络请求
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    
    //第三步，连接服务器
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    return received;
}

#pragma mark - Core Data stack
/*
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
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"V9" withExtension:@"momd"];
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
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"V9.sqlite"]];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
       
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

#pragma mark -
#pragma mark selectLastDate(查询最后一条数据)
-(NSMutableArray *)selectLastDate{
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"ShoppingCart" inManagedObjectContext:[self managedObjectContext]];
    [request setEntity:entity];
    
    NSSortDescriptor *sortdescriptor=[[NSSortDescriptor alloc]initWithKey:@"id" ascending:NO];
    NSArray *sortdescriptors=[[NSArray alloc]initWithObjects:sortdescriptor, nil];
    [request setSortDescriptors:sortdescriptors];
    [request setFetchLimit:1];
    NSError *error;
    NSMutableArray *array=[NSMutableArray arrayWithArray:[[self managedObjectContext] executeFetchRequest:request error:&error] ];
    return array;
}

#pragma mark -
#pragma mark selectALLDate(查询全部数据)
-(NSMutableArray *)selectAllDate{
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"ShoppingCart" inManagedObjectContext:[self managedObjectContext]];
    [request setEntity:entity];
    
    NSSortDescriptor *sortdescriptor=[[NSSortDescriptor alloc]initWithKey:@"id" ascending:NO];
    NSArray *sortdescriptors=[[NSArray alloc]initWithObjects:sortdescriptor, nil];
    [request setSortDescriptors:sortdescriptors];
    NSError *error;
    NSMutableArray *array=[NSMutableArray arrayWithArray:[[self managedObjectContext] executeFetchRequest:request error:&error] ];
    return array;
}

#pragma mark -
#pragma mark selectDate(查询指定数据)
-(NSMutableArray *)selectDate:(int)sender selectDetail:(NSString *)detail{
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"ShoppingCart" inManagedObjectContext:[self managedObjectContext]];
    [request setEntity:entity];
    
    NSSortDescriptor *sortdescriptor=[[NSSortDescriptor alloc]initWithKey:@"id" ascending:NO];
     NSArray *sortdescriptors=[[NSArray alloc]initWithObjects:sortdescriptor, nil];
    [request setSortDescriptors:sortdescriptors];
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"pid=%d AND add_detail=%@",sender,detail];
    [request setPredicate:predicate];
    NSError *error;
    NSMutableArray *array=[NSMutableArray arrayWithArray:[[self managedObjectContext] executeFetchRequest:request error:&error] ];
    return array;
}
*/
@end
