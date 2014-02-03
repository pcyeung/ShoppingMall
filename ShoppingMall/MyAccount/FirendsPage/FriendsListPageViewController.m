//
//  FriendsListPageViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "FriendsListPageViewController.h"
#import "FriendsListCell.h"
#import "MyAccountHomePageViewController.h"
#import "GiftListViewController.h"

@interface FriendsListPageViewController ()

@end

@implementation FriendsListPageViewController

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
    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"FriendsListCell" owner:self options:Nil];
    FriendsListCell *cell=[nib objectAtIndex:0];
    return cell;
}

- (IBAction)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)myAccountBTnClick {
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
@end
