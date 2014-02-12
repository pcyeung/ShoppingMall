//
//  CheckInPageView.m
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 1/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import "CheckInPageView.h"
#import "MyAccountHomePageViewController.h"

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


-(IBAction)okButtonClick {
    if (clickCount == 0) {
        NSString* path = [[NSBundle mainBundle] pathForResource:@"check_in2" ofType:@"png"];
        UIImage* newCheckInTextImage = [[UIImage alloc]initWithContentsOfFile:path];
        [checkInTextImage setImage:newCheckInTextImage];

        [centerTextLabel setText:[_mall adsText]];
    } else {
        __block UIWindow *animationWindow = _window;
            
        [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationCurveEaseOut animations:^() {
            animationWindow.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
            animationWindow.alpha = 0.0f;
        } completion:^(BOOL finished) {
            _window.hidden = YES;
            _window = nil;
        }];
    }
    clickCount++;
}

- (id)initWithFrame:(CGRect)frame sonicCode:(SonicCodeHeard *) code nibName:(NSString *)nibName
{
    _user = [MockUser sharedUserObject];
    _mall = [[MockMall alloc] initWithSonicCode:code];
    if ([_user hasVisited:_mall] == YES) {
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

- (void) showWithController:(UINavigationController*)controller {
    [self showAnimated:YES withController:controller];
}

- (void) refreshAccountInfoWithController:(UINavigationController*)controller {
    for (UIViewController *tem in controller.viewControllers) {
        if ([tem isKindOfClass:[MyAccountHomePageViewController class]]) {
            [(MyAccountHomePageViewController*)tem refreshData];
            return;
        }
    }
}

- (void) showAnimated:(BOOL)animated withController:(UINavigationController*)controller {
    [_user addVisit:_mall];
    int accountPoints = [_user getAccountPoints];
    accountPoints += [_mall getBonusPoints];
    [_user setAccountPoints:accountPoints];
    [self refreshAccountInfoWithController:controller];
    
    NSString* pointBalanceText = [NSString stringWithFormat:@"+ %dpts!  Balance:%d", [_mall getBonusPoints], accountPoints];
    [mallNameLabel setText:[_mall mallName]];
    [centerTextLabel setText:pointBalanceText];
    
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
