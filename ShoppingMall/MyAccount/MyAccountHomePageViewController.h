//
//  MyAccountHomePageViewController.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/25.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MockUser.h"

@interface MyAccountHomePageViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UIButton *MyAccountBtn;
    IBOutlet UIButton *backBtn;
    IBOutlet UIButton *shoppingMallListBtn;
    IBOutlet UIImageView *accountIcon;
    IBOutlet UIButton *infoBtn;
    IBOutlet UIButton *friendsBtn;
    IBOutlet UIButton *giftListBtn;
    IBOutlet UIButton *giftBtn;
    
    IBOutlet UILabel *userNameLabel;
    IBOutlet UILabel *pointBalanceLabel;
    IBOutlet UITableView *timelineList;
}

@property (strong, nonatomic) MockUser *user;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (void)refreshData;

- (IBAction)backBtnClick;
- (IBAction)infoBtnClick;
- (IBAction)friendsBtnClick;
- (IBAction)giftListBTnClick;

- (IBAction)shoppingMallListBtnClick;

- (IBAction)giftBtnClick; //Teddy

@end
