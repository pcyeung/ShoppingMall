//
//  BaseViewController.m
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 12/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController*)buttonClickGetClass:(NSString*)aClass iPhone5Nib:(NSString*)nib5 nib:(NSString*)nib {
    Class class = NSClassFromString(aClass);
    for (UIViewController *tem in self.navigationController.viewControllers) {
        if ([tem isKindOfClass:class]) {
            return tem;
        }
    }
    
    UIViewController *viewController;
    if (iPhone5) {
        viewController=[[class alloc]initWithNibName:nib5 bundle:nil];
    }else{
        viewController=[[class alloc]initWithNibName:nib bundle:nil];
    }
    return viewController;
}

- (void)buttonClickToClass:(NSString*)aClass iPhone5Nib:(NSString*)nib5 nib:(NSString*)nib {
    Class class = NSClassFromString(aClass);
    for (UIViewController *tem in self.navigationController.viewControllers) {
        if ([tem isKindOfClass:class]) {
            [self.navigationController popToViewController:tem animated:YES];
            return;
        }
    }
    
    UIViewController *viewController;
    if (iPhone5) {
        viewController=[[class alloc]initWithNibName:nib5 bundle:nil];
    }else{
        viewController=[[class alloc]initWithNibName:nib bundle:nil];
    }
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
