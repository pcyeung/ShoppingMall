//
//  HomePageViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/25.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "HomePageViewController.h"
#import "MyAccountHomePageViewController.h"
#import "HomePageListViewController.h"
#import "GiftViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

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

- (IBAction)myAccountBtnClick {
    MyAccountHomePageViewController *myAccountView;
    if (iPhone5) {
        myAccountView=[[MyAccountHomePageViewController alloc]initWithNibName:@"MyAccountHomePageViewController5" bundle:nil];
    }else{
        myAccountView=[[MyAccountHomePageViewController alloc]initWithNibName:@"MyAccountHomePageViewController" bundle:nil];
    }
    [self.navigationController pushViewController:myAccountView animated:YES];
}

- (IBAction)listBtnClick {
    HomePageListViewController *listPageView;
    if (iPhone5) {
        listPageView=[[HomePageListViewController alloc]initWithNibName:@"HomePageListViewController5" bundle:nil];
    }else{
        listPageView=[[HomePageListViewController alloc]initWithNibName:@"HomePageListViewController" bundle:nil];
    }
    [self.navigationController pushViewController:listPageView animated:YES];
}

- (IBAction)shoppingMallListBtnClick {
   
}

- (IBAction)giftBtnClick{
    GiftViewController *gift;
    if (iPhone5) {
        gift=[[GiftViewController alloc]initWithNibName:@"GiftViewController5" bundle:nil];
    }else{
        gift=[[GiftViewController alloc]initWithNibName:@"GiftViewController" bundle:nil];
    }
    [self.navigationController pushViewController:gift animated:YES];
}

@end
