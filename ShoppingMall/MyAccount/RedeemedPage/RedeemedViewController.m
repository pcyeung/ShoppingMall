//
//  RedeemedViewController.m
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 15/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import "RedeemedViewController.h"
#include "RedeemedCell.h"

@interface RedeemedViewController ()

@end

@implementation RedeemedViewController

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
    if ([indexPath row] % 2 == 0) {
        return [[RedeemedCell alloc] initWithStatus:@"Redeemed"];
    }
    return [[RedeemedCell alloc] initWithStatus:@"Not redeemed"];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Not selectable
}

- (IBAction)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
