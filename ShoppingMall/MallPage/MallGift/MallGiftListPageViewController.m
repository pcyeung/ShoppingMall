//
//  MallGiftListPageViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/27.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "MallGiftListPageViewController.h"
#import "MallGiftListCell.h"
#import "MyAccountHomePageViewController.h"
#import "GiftDetailPageViewController.h"
#import "HomePageViewController.h"


@interface MallGiftListPageViewController ()

@end

@implementation MallGiftListPageViewController

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
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"MallGiftListCell" owner:self options:Nil];
    MallGiftListCell *cell=[nib objectAtIndex:0];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self buttonClickToClass:@"GiftDetailPageViewController" iPhone5Nib:@"GiftDetailPageViewController5" nib:@"GiftDetailPageViewController"];
 }

- (IBAction)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)myAccountBTnClick {
    [self buttonClickToClass:@"MyAccountHomePageViewController" iPhone5Nib:@"MyAccountHomePageViewController5" nib:@"MyAccountHomePageViewController"];
}

- (IBAction)shoppingMallListBtnClick {
    [self buttonClickToClass:@"HomePageViewController" iPhone5Nib:@"HomePageViewController5" nib:@"HomePageViewController"];
}

@end
