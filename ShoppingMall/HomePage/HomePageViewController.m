//
//  HomePageViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/25.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "HomePageViewController.h"
#import "MyAccountHomePageViewController.h"
#import "HomePageListViewController.h"
#import "GiftViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        mapView = [[MKMapView alloc]init];
        [mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    }
    return self;
}

/*
//Override mapView class to provide location centering when user location updated
//Not Using at this moment
 - (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)aUserLocation {
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocationCoordinate2D location;
    location.latitude = aUserLocation.coordinate.latitude;
    location.longitude = aUserLocation.coordinate.longitude;
    region.span = span;
    region.center = location;
    [aMapView setRegion:region animated:YES];
}*/

//Implementing map view location centering when view is initialized, but not tracking the user
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    MKUserLocation *UserLocation = mapView.userLocation;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocationCoordinate2D location;
    location.latitude = UserLocation.coordinate.latitude;
    location.longitude = UserLocation.coordinate.longitude;
    region.span = span;
    region.center = location;
    [mapView setRegion:region animated:YES];
    }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
}



- (IBAction)myAccountBtnClick {
    MyAccountHomePageViewController *myAccountView;
    if (iPhone5) {
        myAccountView=[[MyAccountHomePageViewController alloc]initWithNibName:@"MyAccountHomePageViewController5" bundle:nil];
    }else{
        myAccountView=[[MyAccountHomePageViewController alloc]initWithNibName:@"MyAccountHomePageViewController" bundle:nil];
    }
    [self.navigationController pushViewController:myAccountView animated:YES];
}

- (IBAction)listBtnClick {
    HomePageListViewController *listPageView;
    if (iPhone5) {
        listPageView=[[HomePageListViewController alloc]initWithNibName:@"HomePageListViewController5" bundle:nil];
    }else{
        listPageView=[[HomePageListViewController alloc]initWithNibName:@"HomePageListViewController" bundle:nil];
    }
    [self.navigationController pushViewController:listPageView animated:YES];
}

- (IBAction)shoppingMallListBtnClick {
   
}

- (IBAction)giftBtnClick{
    GiftViewController *gift;
    if (iPhone5) {
        gift=[[GiftViewController alloc]initWithNibName:@"GiftViewController5" bundle:nil];
    }else{
        gift=[[GiftViewController alloc]initWithNibName:@"GiftViewController" bundle:nil];
    }
    [self.navigationController pushViewController:gift animated:YES];
}

@end
