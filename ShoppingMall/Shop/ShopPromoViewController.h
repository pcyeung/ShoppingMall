//
//  ShopPromoViewController.h
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 23/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MockShop.h"

@interface ShopPromoViewController : BaseViewController {
    IBOutlet UIButton *backBtn;
    IBOutlet UIButton *MyAccountBtn;
    IBOutlet UIButton *shoppingMallListBtn;
    IBOutlet UIButton *giftListBtn;
}

@property (strong, nonatomic) MockShop *shop;

- (IBAction)backBtnClick;
- (IBAction)myAccountBTnClick;
- (IBAction)shoppingMallListBtnClick;
- (IBAction)giftListBtnClick;


-(void) initWithShop:(MockShop*)shop;

@end
