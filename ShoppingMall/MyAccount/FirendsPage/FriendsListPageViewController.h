//
//  FriendsListPageViewController.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsListPageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UIButton *MyAccountBtn;
    IBOutlet UIButton *backBtn;
    IBOutlet UIButton *serachBtn;
    IBOutlet UITextField *key;
    IBOutlet UIButton *cancelBtn;
    IBOutlet UITableView *list;
}
- (IBAction)backBtnClick;
- (IBAction)myAccountBTnClick;
@end
