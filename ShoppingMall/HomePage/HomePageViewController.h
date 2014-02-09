//
//  HomePageViewController.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/25.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MockUser.h"
#import <MapKit/MapKit.h>


@interface HomePageViewController : UIViewController {
    IBOutlet UIButton *MyAccountBtn;
    IBOutlet UIButton *backBtn;
    IBOutlet UIButton *mapBTn;
    IBOutlet UIButton *listBtn;
    IBOutlet UIButton *shoppingMallListBtn;
    IBOutlet UIButton *giftBtn;
    IBOutlet MKMapView *mapView;
}

@property (strong, nonatomic) MockUser *user;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil user:(MockUser*)user;

- (IBAction)myAccountBtnClick;
- (IBAction)listBtnClick;
- (IBAction)shoppingMallListBtnClick;
- (IBAction)giftBtnClick;
//- (IBA)


@end
