//
//  MyAccountHomePageViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/25.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "MyAccountHomePageViewController.h"
#import "FriendsListPageViewController.h"
#import "GiftListViewController.h"
#import "HomePageViewController.h"
#import "TimelineListCell.h"

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
        [userNameLabel setText:[_user userName]];
        
        int accountPoints = [_user getAccountPoints];
        [pointBalanceLabel setText:[NSString stringWithFormat:@"%d points", accountPoints]];
        
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int userHistoryCount = [[_user visitHistory] count];
    return MIN(userHistoryCount, 10);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    int visitRow = [indexPath row];
    assert(visitRow < [[_user visitHistory] count]);
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
}

- (IBAction)friendsBtnClick {
    FriendsListPageViewController *friendsListView;
    if (iPhone5) {
        friendsListView=[[FriendsListPageViewController alloc]initWithNibName:@"FriendsListPageViewController5" bundle:nil];
    }else{
        friendsListView=[[FriendsListPageViewController alloc]initWithNibName:@"FriendsListPageViewController" bundle:nil];
    }
    [self.navigationController pushViewController:friendsListView animated:YES];
}

- (IBAction)giftListBTnClick {
    GiftListViewController *giftListView;
    if (iPhone5) {
        giftListView=[[GiftListViewController alloc]initWithNibName:@"GiftListViewController5" bundle:nil];
    }else{
        giftListView=[[GiftListViewController alloc]initWithNibName:@"GiftListViewController" bundle:nil];
    }
    [self.navigationController pushViewController:giftListView animated:YES];
}

- (IBAction)shoppingMallListBtnClick {
    for (UIViewController *tem in self.navigationController.viewControllers) {
        if ([tem isKindOfClass:[HomePageViewController class]]) {
            [self.navigationController popToViewController:tem animated:YES];
        }
    }
    
}
@end
