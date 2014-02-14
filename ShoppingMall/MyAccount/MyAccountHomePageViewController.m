//
//  MyAccountHomePageViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/25.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "MyAccountHomePageViewController.h"
#import "FriendsListPageViewController.h"
#import "HomePageViewController.h"
#import "TimelineListCell.h"
#import "GiftViewController.h"

@interface MyAccountHomePageViewController ()

@end

@implementation MyAccountHomePageViewController

@synthesize user = _user;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _user = [MockUser sharedUserObject];
    }
    return self;
}

- (void)loadView {
    [super loadView];
    [self refreshData];
}

- (void)refreshData {
    [userNameLabel setText:[_user userName]];
    int accountPoints = [_user getAccountPoints];
    [pointBalanceLabel setText:[NSString stringWithFormat:@"%d points", accountPoints]];
    [timelineList reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int userHistoryCount = [[_user visitHistory] count];
    return MIN(userHistoryCount, 10);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    int visitRow = [[_user visitHistory] count] - [indexPath row] - 1;
    assert(visitRow >= 0);
    VisitData* visitData = [[_user visitHistory] objectAtIndex:visitRow];
    TimelineListCell *cell = [[TimelineListCell alloc] initWithVisitData:visitData];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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

- (IBAction)infoBtnClick {
    [self buttonClickToClass:@"InfoSettingViewController" iPhone5Nib:@"InfoSettingViewController5" nib:@"InfoSettingViewController"];
}

- (IBAction)friendsBtnClick {
    [self buttonClickToClass:@"FriendsListPageViewController" iPhone5Nib:@"FriendsListPageViewController5" nib:@"FriendsListPageViewController"];
}

- (IBAction)giftListBTnClick {
}

- (IBAction)shoppingMallListBtnClick {
    [self buttonClickToClass:@"HomePageViewController" iPhone5Nib:@"HomePageViewController5" nib:@"HomePageViewController"];
}

- (IBAction)giftBtnClick{
    [self buttonClickToClass:@"GiftViewController" iPhone5Nib:@"GiftViewController5" nib:@"GiftViewController"];
}
@end
