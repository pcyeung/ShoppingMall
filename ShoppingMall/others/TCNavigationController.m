//
//  TCNavigationController.m
//  WSF
//
//  Created by Codeguesser on 13/3/18.
//  Copyright (c) 2013年 iBrand International Limited. All rights reserved.
//

#import "TCNavigationController.h"

@interface TCNavigationController ()

@end

@implementation TCNavigationController


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_6_0
//#if __IPAD_OS_VERSION_MAX_ALLOWED >= __IPAD_6_0

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortraitUpsideDown; //in the fact only landscape,check tcnavigationcontroller class method 1030
}

-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

#endif

@end
