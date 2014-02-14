//
//  ScanQRViewController.h
//  ShoppingMall
//
//  Created by Alex Cheung on 14/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import "BaseViewController.h"

@interface ScanQRViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UIButton *QRCodeBtn;
}
- (IBAction)QRCodeBtnClick;

@end
