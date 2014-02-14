//
//  GiftDetailPageViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "GiftDetailPageViewController.h"
#import "MyAccountHomePageViewController.h"
//#import "GiftScanPageViewController.h"
#import "HomePageViewController.h"

@interface GiftDetailPageViewController ()

@end

@implementation GiftDetailPageViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)myAccountBtnClick {
    [self buttonClickToClass:@"MyAccountHomePageViewController" iPhone5Nib:@"MyAccountHomePageViewController5" nib:@"MyAccountHomePageViewController"];
}

- (IBAction)shoppingMallBtnClick {
    [self buttonClickToClass:@"HomePageViewController" iPhone5Nib:@"HomePageViewController5" nib:@"HomePageViewController"];
}



- (IBAction)scanBtnClick {
    // Implement the action here
    [self buttonClickToClass:@"ScanQRViewController" iPhone5Nib:@"ScanQRViewController5" nib:@"ScanQRViewController"];
}

- (IBAction)giftBtnClick {
    [self buttonClickToClass:@"GiftViewController" iPhone5Nib:@"GiftViewController5" nib:@"GiftViewController"];
}


@end
