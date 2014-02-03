//
//  LoginListViewController.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/25.
//  Copyright (c) 2014年 Macie. All rights reserved.
//
//Hello

#import <UIKit/UIKit.h>

@interface LoginListViewController : UIViewController{
    
    IBOutlet UIButton *renrenBtn;
    IBOutlet UIButton *weiboBtn;
    IBOutlet UIButton *qqBtn;
}
- (IBAction)renrenBtnClick;
- (IBAction)weiboBtnClick;
- (IBAction)qqBtnClick;

@end
