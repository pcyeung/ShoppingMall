//
//  GiftDetailPageViewController.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MockGift.h"
#import "MockMall.h"

@interface QRConfirmViewController : BaseViewController{
    IBOutlet UIButton *MyAccountBtn;
    IBOutlet UIButton *backBtn;
    IBOutlet UIButton *shoppingMallListBtn;
    IBOutlet UIButton *giftBtn;
    
    IBOutlet UILabel *mallLabel;
    IBOutlet UILabel *giftNameLabel;
    IBOutlet UIImageView *giftImage;
    IBOutlet UIImageView *brandImage;
    
    IBOutlet UITextView *sizeText;
    
    IBOutlet UIImageView *qrImage;
    IBOutlet UIScrollView *scrollView;
}
- (IBAction)myAccountBtnClick;
- (IBAction)backBtnClick;
- (IBAction)shoppingMallBtnClick;
- (IBAction)giftBtnClick;

@property(strong, nonatomic) MockMall *mall;
@property(strong, nonatomic) MockGift *gift;

- (void)initWithGift:(MockGift*)gift mall:(MockMall*)mall;


@end
