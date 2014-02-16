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

@interface MallAnnotation : NSObject<MKAnnotation> {
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
- (id) initFromMockMall:(MockMall*)mall;

@end


@interface HomePageViewController : BaseViewController {
    IBOutlet UIButton *MyAccountBtn;
    IBOutlet UIButton *backBtn;
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
