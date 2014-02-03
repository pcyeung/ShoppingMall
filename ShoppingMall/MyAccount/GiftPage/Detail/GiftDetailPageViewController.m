//
//  GiftDetailPageViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "GiftDetailPageViewController.h"
#import "MyAccountHomePageViewController.h"
#import "HomePageListViewController.h"
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

- (IBAction)mapBtnClick {
}

- (IBAction)listBTnClick{
    HomePageListViewController *listPageView;
    if (iPhone5) {
        listPageView=[[HomePageListViewController alloc]initWithNibName:@"HomePageListViewController5" bundle:nil];
    }else{
        listPageView=[[HomePageListViewController alloc]initWithNibName:@"HomePageListViewController" bundle:nil];
    }
    [self.navigationController pushViewController:listPageView animated:YES];
}

- (IBAction)shoppingMallListBtnClick {
    for (UIViewController *tem in self.navigationController.viewControllers) {
        if ([tem isKindOfClass:[HomePageViewController class]]) {
            [self.navigationController popToViewController:tem animated:YES];
        }
    }
    
}

- (IBAction)scanBtnClick {
//    GiftScanPageViewController *scanPageView;
//    if (iPhone5) {
//        scanPageView=[[GiftScanPageViewController alloc]initWithNibName:@"GiftScanPageViewController5" bundle:nil];
//    }else{
//        scanPageView=[[GiftScanPageViewController alloc]initWithNibName:@"GiftScanPageViewController" bundle:nil];
//    }
//    [self.navigationController pushViewController:scanPageView animated:YES];
}


@end
