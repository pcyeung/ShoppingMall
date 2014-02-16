//
//  ScanQRViewController.m
//  ShoppingMall
//
//  Created by Alex Cheung on 14/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ScanQRViewController.h"
#import "MyAccountHomePageViewController.h"
#import "HomePageViewController.h"
#import "MallGiftListPageViewController.h"
#import "RedeemedViewController.h"

@interface ScanQRViewController ()

@end

@implementation ScanQRViewController

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

- (void)refreshRedeemedList {
    for (UIViewController *tem in self.navigationController.viewControllers) {
        if ([tem isKindOfClass:[RedeemedViewController class]]) {
            [(RedeemedViewController*)tem refreshData];
            return;
        }
    }
}

- (IBAction)QRCodeBtnClick {
    // Handle the QR Code scan here
    [[MockUser sharedUserObject] addPrize:@"Book" controller:self.navigationController];
    [self buttonClickToClass:@"MallGiftConfirmationViewController" iPhone5Nib:@"MallGiftConfirmationViewController5" nib:@"MallGiftConfirmationViewController"];
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

- (IBAction)giftBtnClick {
    [self buttonClickToClass:@"GiftViewController" iPhone5Nib:@"GiftViewController5" nib:@"GiftViewController"];
}

@end
