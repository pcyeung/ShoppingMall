//
//  RedeemedViewController.h
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 15/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "BaseViewController.h"

@interface RedeemedViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UIButton *backBtn;
    IBOutlet UITableView *list;
}
- (IBAction)backBtnClick;


@end
