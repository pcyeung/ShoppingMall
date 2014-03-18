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
#import "AddressAnnotation.h"
#import "MockMall.h"
#import "ShoppingMallIndexDetailViewController.h"

#import "CheckInPageView.h"
#import <Sonic/Sonic.h>
#import "TCNavigationController.h"





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
- (IBAction)locate:(id)sender {
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    MKUserLocation *UserLocation = mapView.userLocation;
    span.latitudeDelta = 0.01;
    span.longitudeDelta = 0.01;
    CLLocationCoordinate2D location;
    location.latitude = UserLocation.coordinate.latitude;
    location.longitude = UserLocation.coordinate.longitude;
    region.span = span;
    region.center = location;
    [mapView setRegion:region animated:YES];
}

//Implementing map view location centering when view is initialized, but not tracking the user
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mapView.showsUserLocation = YES;
  //  mapView.mapType = MKMapTypeHybrid;
    mapView.delegate = self;
    
    NSArray* malls = [MockMall getAllMallData];
    for (MockMall* mall in malls) {
        CLLocationCoordinate2D coordinate = [mall getCoordinates];
        AddressAnnotation *addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:coordinate mall:mall];
        [mapView addAnnotation:addAnnotation];
        
        TCNavigationController *Controller;
        SonicCodeHeard *code;
        code.beaconCode = 802397;
        
        
        CheckInPageView *checkInPageView;
        checkInPageView=[[CheckInPageView alloc]initWithFrame:[[UIScreen mainScreen] bounds] sonicCode:code nibName:@"CheckInPageView5" controller:Controller];
        [checkInPageView show];


    }
}

- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)aUserLocation {

    // Do any additional setup after loading the view from its nib.
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
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
}

- (MKAnnotationView *) mapView:(MKMapView *)aMapView viewForAnnotation:(id <MKAnnotation>) annotation
{
    if (annotation == aMapView.userLocation)
    {
        return nil;
    }
    else{
        MKPinAnnotationView *newAnnotation = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinLocation"];
    
        newAnnotation.canShowCallout = YES;
        newAnnotation.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
        return newAnnotation;
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    ShoppingMallIndexDetailViewController* controller = (ShoppingMallIndexDetailViewController*)[self buttonClickGetClass:@"ShoppingMallIndexDetailViewController" iPhone5Nib:@"ShoppingMallIndexDetailViewController5" nib:@"ShoppingMallIndexDetailViewController"];
    id<MKAnnotation> annotation = [view annotation];
    [controller initWithMall:[(AddressAnnotation*)annotation mall]];
    [self popOrPush:@"ShoppingMallIndexDetailViewController" controller:controller];
    
}

- (IBAction)myAccountBtnClick {
    [self buttonClickToClass:@"MyAccountHomePageViewController" iPhone5Nib:@"MyAccountHomePageViewController5" nib:@"MyAccountHomePageViewController"];
  }

- (IBAction)listBtnClick {
    [self buttonClickToClass:@"HomePageListViewController" iPhone5Nib:@"HomePageListViewController5" nib:@"HomePageListViewController"];
}

- (IBAction)shoppingMallListBtnClick {   
}

- (IBAction)giftBtnClick{
    [self buttonClickToClass:@"GiftViewController" iPhone5Nib:@"GiftViewController5" nib:@"GiftViewController"];
}

@end
