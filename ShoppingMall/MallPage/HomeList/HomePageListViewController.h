//
//  HomePageListViewController.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "BaseViewController.h"
#import <UIKit/UIKit.h>

@interface HomePageListViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UIButton *MyAccountBtn;
    IBOutlet UIButton *backBtn;
    IBOutlet UIButton *shoppingMallListBtn;
    IBOutlet UIButton *giftBtn;
    IBOutlet UITableView *list;
    
}

- (IBAction)backBtnClick;
- (IBAction)myAccountBTnClick;
- (IBAction)shoppingMallListBtnClick;


@end
