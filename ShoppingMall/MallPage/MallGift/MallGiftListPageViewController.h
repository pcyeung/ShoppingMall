//
//  MallGiftListPageViewController.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/27.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface MallGiftListPageViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
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
