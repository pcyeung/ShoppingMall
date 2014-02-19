//
//  HomePageListViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "HomePageListViewController.h"
#import "HomePageListCell.h"
#import "MyAccountHomePageViewController.h"
#import "HomePageViewController.h"
#import "MallGiftListPageViewController.h"
#import "ShoppingMallIndexDetailViewController.h"

@interface HomePageListViewController ()

@end

@implementation HomePageListViewController

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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return MIN(10, [[MockMall getAllMallData]count]);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"HomePageListCell" owner:self options:Nil];
    
    HomePageListCell *cell=[nib objectAtIndex:0];
    MockMall* mall = [[MockMall getAllMallData]objectAtIndex:[indexPath row]];
    [cell initWithMall:mall];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MockMall* mall = [[MockMall getAllMallData]objectAtIndex:[indexPath row]];
    ShoppingMallIndexDetailViewController* controller = (ShoppingMallIndexDetailViewController*)[self buttonClickGetClass:@"ShoppingMallIndexDetailViewController" iPhone5Nib:@"ShoppingMallIndexDetailViewController5" nib:@"ShoppingMallIndexDetailViewController"];
    [controller initWithMall:mall];
    [self popOrPush:@"ShoppingMallIndexDetailViewController" controller:controller];
}

- (IBAction)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)myAccountBTnClick {
    [self buttonClickToClass:@"MyAccountHomePageViewController" iPhone5Nib:@"MyAccountHomePageViewController5" nib:@"MyAccountHomePageViewController"];
}

- (IBAction)shoppingMallListBtnClick {
    [self buttonClickToClass:@"HomePageViewController" iPhone5Nib:@"HomePageViewController" nib:@"HomePageViewController"];
}

@end
