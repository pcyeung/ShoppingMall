//
//  RedeemedViewController.m
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 15/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import "RedeemedViewController.h"
#import "RedeemedCell.h"
#import "MockUser.h"

@interface RedeemedViewController ()

@end

@implementation RedeemedViewController

@synthesize user = _user;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _user = [MockUser sharedUserObject];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self refreshData];
}

- (void)refreshData {
    [list reloadData];
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
    int prizeCount = [[_user prizeHistory] count];
    return MIN(prizeCount, 10);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    int prizeRow = [[_user prizeHistory] count] - [indexPath row] - 1;
    assert(prizeRow >= 0);

    PrizeData* prize = [[_user prizeHistory] objectAtIndex:prizeRow];

    NSString* redeemed;
    if ([prize getIsRedeemed]) {
        redeemed = @"Redeemed";
    } else {
        redeemed = @"Not redeemed";
    }
    return [[RedeemedCell alloc] initWithName:[prize prizeName] status:redeemed];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Not selectable
}

- (IBAction)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
