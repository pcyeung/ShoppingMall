//
//  LoginListViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/25.
//  Copyright (c) 2014年 Macie. All rights reserved.
//
#import <Sonic/SonicContent.h>

#import "LoginListViewController.h"
#import "HomePageViewController.h"
#import "MyAccountHomePageViewController.h"

@interface LoginListViewController ()

@end

@implementation LoginListViewController

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

- (IBAction)renrenBtnClick {
    HomePageViewController *HomePageView;
    if (iPhone5) {
        HomePageView=[[HomePageViewController alloc]initWithNibName:@"HomePageViewController5" bundle:nil];
    }else{
        HomePageView=[[HomePageViewController alloc]initWithNibName:@"HomePageViewController" bundle:nil];
    }
    [[Sonic sharedInstance] startListening];
    [self.navigationController pushViewController:HomePageView animated:YES];
}

- (IBAction)weiboBtnClick {
    HomePageViewController *HomePageView;
    if (iPhone5) {
        HomePageView=[[HomePageViewController alloc]initWithNibName:@"HomePageViewController5" bundle:nil];
    }else{
        HomePageView=[[HomePageViewController alloc]initWithNibName:@"HomePageViewController" bundle:nil];
    }
    [[Sonic sharedInstance] startListening];
    [self.navigationController pushViewController:HomePageView animated:YES];
}

- (IBAction)qqBtnClick {
    HomePageViewController *HomePageView;
    if (iPhone5) {
        HomePageView=[[HomePageViewController alloc]initWithNibName:@"HomePageViewController5" bundle:nil];
    }else{
        HomePageView=[[HomePageViewController alloc]initWithNibName:@"HomePageViewController" bundle:nil];
    }
    [[Sonic sharedInstance] startListening];
    [self.navigationController pushViewController:HomePageView animated:YES];
}
@end
