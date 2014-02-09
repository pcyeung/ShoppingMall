//
//  ShoppingMallIndexDetailViewController.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingMallIndexDetailViewController : UIViewController {
    IBOutlet UIButton *MyAccountBtn;
    IBOutlet UIButton *backBtn;
    IBOutlet UIButton *shoppingMallListBtn;
    IBOutlet UIButton *giftBtn;
}
- (IBAction)backBtnClick;
- (IBAction)myAccountBTnClick;

- (IBAction)shoppingMallListBtnClick;

@end
