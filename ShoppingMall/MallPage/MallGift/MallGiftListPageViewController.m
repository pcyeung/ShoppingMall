//
//  MallGiftListPageViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/27.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "MallGiftListPageViewController.h"
#import "GiftListCell.h"
#import "MyAccountHomePageViewController.h"
#import "GiftDetailPageViewController.h"
#import "HomePageViewController.h"


@interface MallGiftListPageViewController ()

@end

@implementation MallGiftListPageViewController

@synthesize mall = _mall;

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
    return MIN(10, [[MockGift getAllGiftData]count]);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"GiftListCell" owner:self options:Nil];
    
    GiftListCell *cell=[nib objectAtIndex:0];
    MockGift* gift = [[MockGift getAllGiftData]objectAtIndex:[indexPath row]];
    [cell initWithGift:gift mall:_mall];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MockGift* gift = [[MockGift getAllGiftData]objectAtIndex:[indexPath row]];
    GiftDetailPageViewController* controller = (GiftDetailPageViewController*)[self buttonClickGetClass:@"GiftDetailPageViewController" iPhone5Nib:@"GiftDetailPageViewController5" nib:@"GiftDetailPageViewController"];
    
    [controller initWithGift:gift mall:_mall redeemed:NO];
    [self popOrPush:@"GiftDetailPageViewController" controller:controller];
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

- (void) initWithMall:(MockMall*)mall {
    _mall = mall;
}

@end
