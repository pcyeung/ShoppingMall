//
//  ShoppingMallIndexDetailViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "ShoppingMallIndexDetailViewController.h"
#import "MyAccountHomePageViewController.h"
#import "HomePageViewController.h"
#import "MallGiftListPageViewController.h"
#import "HomePageListViewController.h"

@interface ShoppingMallIndexDetailViewController ()

@end

@implementation ShoppingMallIndexDetailViewController

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

- (IBAction)myAccountBTnClick {
    [self buttonClickToClass:@"MyAccountHomePageViewController" iPhone5Nib:@"MyAccountHomePageViewController5" nib:@"MyAccountHomePageViewController"];
}

- (IBAction)shoppingMallListBtnClick {
    [self buttonClickToClass:@"HomePageListViewController" iPhone5Nib:@"HomePageListViewController5" nib:@"HomePageListViewController"];
}

- (IBAction)numberOfGiftBtnClick {
    [self buttonClickToClass:@"MallGiftListPageViewController" iPhone5Nib:@"MallGiftListPageViewController5" nib:@"MallGiftListPageViewController"];
}

- (IBAction)giftBtnClick {
    [self buttonClickToClass:@"MallGiftListPageViewController" iPhone5Nib:@"MallGiftListPageViewController5" nib:@"MallGiftListPageViewController"];
}


@end
