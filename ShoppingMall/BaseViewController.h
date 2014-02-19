//
//  BaseViewController.h
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 12/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (UIViewController*)buttonClickGetClass:(NSString*)aClass iPhone5Nib:(NSString*)nib5 nib:(NSString*)nib;
- (void)buttonClickToClass:(NSString*)aClass iPhone5Nib:(NSString*)nib5 nib:(NSString*)nib;
- (void)popOrPush:(NSString*)aClass controller:(UIViewController*)controller;

@end
