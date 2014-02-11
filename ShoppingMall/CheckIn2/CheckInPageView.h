//
//  CheckInPageView.h
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 1/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Sonic/SonicAudioHeardCode.h>

#include "MockMall.h"
#include "MockUser.h"


@interface CheckInPageView : UIView {
    int clickCount;
    IBOutlet UILabel   *mallNameLabel;
    IBOutlet UILabel   *centerTextLabel;
    IBOutlet UIImageView *checkInTextImage;
    IBOutlet UIButton *okButton;
}

@property (strong, nonatomic) MockUser *user;
@property (strong, nonatomic) MockMall *mall;

- (id)initWithFrame:(CGRect)frame sonicCode:(SonicCodeHeard *) code nibName:(NSString *)nibName;
- (NSString*) pointBalanceText;

- (void)show;

-(IBAction)okButtonClick;

@end
