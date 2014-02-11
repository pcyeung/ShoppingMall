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
    for (UIViewController *tem in self.navigationController.viewControllers) {
        if ([tem isKindOfClass:[MyAccountHomePageViewController class]]) {
            [self.navigationController popToViewController:tem animated:YES];
        }
    }
    
    MyAccountHomePageViewController *myAccountView;
    if (iPhone5) {
        myAccountView=[[MyAccountHomePageViewController alloc]initWithNibName:@"MyAccountHomePageViewController5" bundle:nil];
    }else{
        myAccountView=[[MyAccountHomePageViewController alloc]initWithNibName:@"MyAccountHomePageViewController" bundle:nil];
    }
    [self.navigationController pushViewController:myAccountView animated:YES];
}

- (IBAction)shoppingMallListBtnClick {
    
    // Original implementation - Problem:
    // Back to map view
    /*
    for (UIViewController *tem in self.navigationController.viewControllers) {
        if ([tem isKindOfClass:[HomePageViewController class]]) {
            [self.navigationController popToViewController:tem animated:YES];
        }
    }
    */
    
    // New implementation -
    // Go to mall list
    HomePageListViewController *mallPageListView;
    
    if (iPhone5) {
        mallPageListView=[[HomePageListViewController alloc]initWithNibName:@"HomePageListViewController5" bundle:nil];
    }else{
        mallPageListView=[[HomePageListViewController alloc]initWithNibName:@"HomePageListViewController" bundle:nil];
    }
    [self.navigationController pushViewController:mallPageListView animated:YES];
}

- (IBAction)numberOfGiftBtnClick {
    MallGiftListPageViewController *mallGiftListPageView;
    
    if (iPhone5) {
        mallGiftListPageView=[[MallGiftListPageViewController alloc]initWithNibName:@"MallGiftListPageViewController5" bundle:nil];
    }else{
        mallGiftListPageView=[[MallGiftListPageViewController alloc]initWithNibName:@"MallGiftListPageViewController" bundle:nil];
    }
    [self.navigationController pushViewController:mallGiftListPageView animated:YES];
}

- (IBAction)giftBtnClick {
    MallGiftListPageViewController *MallGiftListPageView;
    
    if (iPhone5) {
        MallGiftListPageView=[[MallGiftListPageViewController alloc]initWithNibName:@"MallGiftListPageViewController5" bundle:nil];
    }else{
        MallGiftListPageView=[[MallGiftListPageViewController alloc]initWithNibName:@"MallGiftListPageViewController" bundle:nil];
    }
    [self.navigationController pushViewController:MallGiftListPageView animated:YES];
}


@end
