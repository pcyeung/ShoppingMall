//
//  ConfirmationPageViewController.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmationPageViewController : UIViewController{
    IBOutlet UIButton *MyAccountBtn;
    IBOutlet UIButton *backBtn;
    IBOutlet UIButton *mapBTn;
    IBOutlet UIButton *listBtn;
    IBOutlet UIButton *shoppingMallListBtn;
    IBOutlet UIButton *giftBtn;
    IBOutlet UILabel *shoppingmall;
    IBOutlet UIImageView *image;
    IBOutlet UILabel *giftName;
    IBOutlet UIImageView *logo;
    IBOutlet UILabel *size;
    IBOutlet UILabel *detail;
    IBOutlet UIScrollView *contentDetail;
    NSMutableDictionary *dic;
    IBOutlet UIButton *shareBtn;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withDic:(NSMutableDictionary *)sender;
- (IBAction)myAccountBtnClick;
- (IBAction)backBtnClick;
- (IBAction)mapBtnClick;
- (IBAction)listBTnClick;
- (IBAction)shoppingMallListBtnClick;
- (IBAction)giftBtnClick;
- (IBAction)redeemedBtnClick;
@end
