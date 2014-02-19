//
//  GiftViewController.m
//  ShoppingMall
//
//  Created by Teddy on 4/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import "GiftViewController.h"
#import "GiftListCell.h"
#import "MyAccountHomePageViewController.h"
#import "GiftDetailPageViewController.h"
#import "HomePageViewController.h"
#import "MockGift.h"
#import "MockMall.h"

@interface GiftViewController ()

@end

@implementation GiftViewController

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

-(MockMall*) getMallForRow:(int)row {
    // Random but systematically select mall.
    NSArray* allMalls = [MockMall getAllMallData];
    int mallIndex = row % [allMalls count];
    return [allMalls objectAtIndex:mallIndex];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"GiftListCell" owner:self options:Nil];
    
    GiftListCell *cell=[nib objectAtIndex:0];
    MockGift* gift = [[MockGift getAllGiftData]objectAtIndex:[indexPath row]];
    [cell initWithGift:gift mall:[self getMallForRow:[indexPath row]]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MockGift* gift = [[MockGift getAllGiftData]objectAtIndex:[indexPath row]];
    GiftDetailPageViewController* controller = (GiftDetailPageViewController*)[self buttonClickGetClass:@"GiftDetailPageViewController" iPhone5Nib:@"GiftDetailPageViewController5" nib:@"GiftDetailPageViewController"];
    
    [controller initWithGift:gift mall:[self getMallForRow:[indexPath row]]];
    [self.navigationController pushViewController:controller animated:YES];
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
