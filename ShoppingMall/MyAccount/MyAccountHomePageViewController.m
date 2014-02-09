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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil user:(MockUser*)user
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _user = user;
        [userNameLabel setText:[_user userName]];
        
        int accountPoints = [_user getAccountPoints];
        [pointBalanceLabel setText:[NSString stringWithFormat:@"Balance:%d", accountPoints]];
        
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int userHistoryCount = [[_user visitHistory] count];
    return MIN(userHistoryCount, 10);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 //   [[_user visitHistory] objectAtIndex:<#(NSUInteger)#>
    
 //   TimelineListCell *cell = [[TimelineListCell alloc] initWithVisitData:[[_user visitHistory] ]
  //  -(id) initWithVisitData:(VisitData*)visitData

    
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"TimelineListCell" owner:self options:Nil];
    TimelineListCell *cell=[nib objectAtIndex:0];
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
