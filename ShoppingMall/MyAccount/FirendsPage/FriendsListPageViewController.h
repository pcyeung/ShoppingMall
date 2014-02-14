//
//  FriendsListPageViewController.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface FriendsListPageViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UIButton *backBtn;
    IBOutlet UIButton *serachBtn;
    IBOutlet UITextField *key;
    IBOutlet UIButton *cancelBtn;
    IBOutlet UITableView *list;
}
- (IBAction)backBtnClick;
@end
