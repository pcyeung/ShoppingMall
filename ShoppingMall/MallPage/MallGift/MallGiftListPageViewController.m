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
    GiftDetailPageViewController *giftDetailView;
    if (iPhone5) {
        giftDetailView=[[GiftDetailPageViewController alloc]initWithNibName:@"GiftDetailPageViewController5" bundle:nil];
    }else{
        giftDetailView=[[GiftDetailPageViewController alloc]initWithNibName:@"GiftDetailPageViewController" bundle:nil];
    }
    [self.navigationController pushViewController:giftDetailView animated:YES];
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

- (IBAction)shoppingMallListBtnClick {
    for (UIViewController *tem in self.navigationController.viewControllers) {
        if ([tem isKindOfClass:[HomePageViewController class]]) {
            [self.navigationController popToViewController:tem animated:YES];
        }
    }
}

@end
