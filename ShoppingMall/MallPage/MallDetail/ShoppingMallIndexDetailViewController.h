//
//  ShoppingMallIndexDetailViewController.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MockMall.h"

@interface ShoppingMallIndexDetailViewController : BaseViewController {
    IBOutlet UIButton *MyAccountBtn;
    IBOutlet UIButton *backBtn;
    IBOutlet UIButton *shoppingMallListBtn;
    IBOutlet UIButton *giftBtn;
    IBOutlet UIButton *shoppingMallBannerBtn;
    IBOutlet UIButton *numberOfGiftBtn;
    
    IBOutlet UILabel *mallName;
    IBOutlet UILabel *mallAddress;
    
    IBOutlet UIImageView *adButton1;
    IBOutlet UIImageView *adButton2;
    IBOutlet UIImageView *adButton3;
    IBOutlet UIImageView *adButton4;
    IBOutlet UIImageView *adButton5;
}

@property(strong, nonatomic) MockMall *mall;

- (IBAction)backBtnClick;
- (IBAction)myAccountBTnClick;

- (IBAction)shoppingMallBtnClick;
- (IBAction)numberOfGiftBtnClick;
- (IBAction)giftBtnClick;

- (void)initWithMall:(MockMall*)mall;



@end
