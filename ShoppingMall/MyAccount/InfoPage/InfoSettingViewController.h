//
//  InfoSettingViewController.h
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 12/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface InfoSettingViewController : BaseViewController {
    IBOutlet UIButton *myAccntBtn;
    IBOutlet UIButton *backBtn;
}

- (IBAction)myAccntBtnClick;
- (IBAction)backBtnClick;


@end
