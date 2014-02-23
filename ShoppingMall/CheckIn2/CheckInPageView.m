//
//  CheckInPageView.m
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 1/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import "BaseViewController.h"
#import "CheckInPageView.h"
#import "MockShop.h"
#import "ShopPromoViewController.h"

#import <Sonic/SonicAudioHeardCode.h>
#import <Sonic/SonicBluetoothCodeHeard.h>
#import <Sonic/SonicCodeHeard.h>
#import <Sonic/SonicContent.h>

@interface CheckInPageView ()
@property(nonatomic, strong) UIWindow *window;
@end

@implementation CheckInPageView

@synthesize window = _window;
@synthesize user = _user;
@synthesize mall = _mall;
@synthesize controller = _controller;

-(void)closePopup {
    __block UIWindow *animationWindow = _window;
    
    [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationCurveEaseOut animations:^() {
        animationWindow.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
        animationWindow.alpha = 0.0f;
    } completion:^(BOOL finished) {
        _window.hidden = YES;
        _window = nil;
    }];
}

-(IBAction)okButtonClick {
    if (clickCount == 0) {
        NSString* path = [[NSBundle mainBundle] pathForResource:@"check_in2" ofType:@"png"];
        UIImage* newCheckInTextImage = [[UIImage alloc]initWithContentsOfFile:path];
        [checkInTextImage setImage:newCheckInTextImage];
        [topTextLabel setText:@"商场优惠"];
        
        NSArray* shops = [MockShop getSampleShops];
        [self enableButton:adButton1 withShop:[shops objectAtIndex:0]];
        [self enableButton:adButton2 withShop:[shops objectAtIndex:1]];
        [self enableButton:adButton3 withShop:[shops objectAtIndex:2]];
        [self enableButton:adButton4 withShop:[shops objectAtIndex:3]];

    } else {
        [self closePopup];
    }
    clickCount++;
}

-(IBAction)adButton1Click {
    [self closePopup];
    
    ShopPromoViewController* controller = (ShopPromoViewController*)[BaseViewController buttonClickGetClass:@"ShopPromoViewController" iPhone5Nib:@"ShopPromoViewController5" nib:@"ShopPromoViewController" navController:_controller];
    [controller initWithShop:[[MockShop getSampleShops] objectAtIndex:0]];
    [BaseViewController popOrPush:@"ShopPromoViewController" controller:controller navController:_controller];
}

- (id)initWithFrame:(CGRect)frame sonicCode:(SonicCodeHeard *) code nibName:(NSString *)nibName controller:(UINavigationController *)controller
{
    _user = [MockUser sharedUserObject];
    _mall = [MockMall getMallWithSonicCode:code];
    _controller = controller;
    if (_mall == nil || [_user hasVisited:_mall] == YES) {
        return NULL;
    }

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
        [self addSubview:nibObjects[0]];
        clickCount = 0;
    }
    return self;
}

- (void) show {
    [self showAnimated:YES];
}

- (void) disableButton:(UIButton*)button {
    button.enabled = NO;
    [button setBackgroundImage:nil forState:UIControlStateNormal];
    [button setImage:nil forState:UIControlStateNormal];
}

- (void) enableButton:(UIButton*)button withShop:(MockShop*)shop {
    button.enabled = YES;
    [button setBackgroundImage:[UIImage imageNamed:[shop logoImage]] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[shop logoImage]] forState:UIControlStateNormal];
}

- (void) showAnimated:(BOOL)animated {
    [self disableButton:adButton1];
    [self disableButton:adButton2];
    [self disableButton:adButton3];
    [self disableButton:adButton4];

    [topTextLabel setText:@""];
    
    int accountPoints = [_user getAccountPoints];
    accountPoints += [_mall getBonusPoints];
    [_user setAccountPoints:accountPoints];
    [_user addVisit:_mall controller:_controller];
    
    NSString* pointBalanceText = [NSString stringWithFormat:@"加%d分!  总分:%d", [_mall getBonusPoints], accountPoints];
    [mallNameLabel setText:[_mall mallName]];
    [topTextLabel setText:pointBalanceText];
    
	_window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.windowLevel = UIWindowLevelAlert;
    _window.backgroundColor = [UIColor clearColor];
	self.center = CGPointMake(CGRectGetMidX(_window.bounds), CGRectGetMidY(_window.bounds));
	[_window addSubview:self];
	[_window makeKeyAndVisible];
	
	if (animated) {
		_window.transform = CGAffineTransformMakeScale(1.5, 1.5);
		_window.alpha = 0.0f;
		
		__block UIWindow *animationWindow = _window;
		
		[UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationCurveEaseIn animations:^() {
			animationWindow.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
			animationWindow.alpha = 1.0f;
		} completion:nil];
	}
}



@end
