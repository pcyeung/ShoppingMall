//
//  HomePageViewController.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/25.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "BaseViewController.h"
#import "MockMall.h"

@interface HomePageViewController : BaseViewController <MKMapViewDelegate> {
    IBOutlet UIButton *MyAccountBtn;
    IBOutlet UIButton *mapBTn;
    IBOutlet UIButton *listBtn;
    IBOutlet UIButton *shoppingMallListBtn;
    IBOutlet UIButton *giftBtn;
    IBOutlet MKMapView *mapView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

- (IBAction)myAccountBtnClick;
- (IBAction)listBtnClick;
- (IBAction)shoppingMallListBtnClick;
- (IBAction)giftBtnClick;

@end
