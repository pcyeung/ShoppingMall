//
//  GiftViewController.h
//  ShoppingMall
//
//  Created by Teddy on 4/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface GiftViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
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