//
//  ScanQRViewController.h
//  ShoppingMall
//
//  Created by Alex Cheung on 14/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MyAccountHomePageViewController.h"
#import "HomePageViewController.h"
#import "MallGiftListPageViewController.h"

@interface ScanQRViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UIButton *QRCodeBtn;
}
- (IBAction)QRCodeBtnClick;
- (IBAction)myAccountBtnClick;
- (IBAction)backBtnClick;
- (IBAction)shoppingMallBtnClick;
- (IBAction)giftBtnClick;

@end
