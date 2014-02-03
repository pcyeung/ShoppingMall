//
//  GiftScanPageViewController.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface GiftScanPageViewController : UIViewController<ZBarReaderDelegate,ZBarReaderViewDelegate>{
    IBOutlet UIButton *MyAccountBtn;
    IBOutlet UIButton *backBtn;
    IBOutlet UIButton *shoppingMallListBtn;
    IBOutlet UIButton *giftBtn;
    
    int num;
    BOOL upOrdown;
    NSTimer * timer;
}
@property (nonatomic, strong) UIImageView * line;
- (IBAction)myAccountBtnClick;
- (IBAction)backBtnClick;
- (IBAction)shoppingMallListBtnClick;
@end
