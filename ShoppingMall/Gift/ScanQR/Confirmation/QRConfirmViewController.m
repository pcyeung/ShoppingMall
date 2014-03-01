//
//  GiftDetailPageViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "QRConfirmViewController.h"
#import "MyAccountHomePageViewController.h"
#import "HomePageViewController.h"
#import "ScanQRViewController.h"

@interface QRConfirmViewController ()

@end

@implementation QRConfirmViewController

@synthesize mall = _mall;
@synthesize gift = _gift;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mallLabel.text = [_mall mallName];
    giftNameLabel.text = [_gift giftName];
    giftImage.image = [UIImage imageNamed:[_gift giftImage]];
    brandImage.image = [UIImage imageNamed:[_gift brandLogo]];
    descriptionLabel.text = [_gift giftDetail];
    sizeLabel.text = [_gift giftSize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)myAccountBtnClick {
    [self buttonClickToClass:@"MyAccountHomePageViewController" iPhone5Nib:@"MyAccountHomePageViewController5" nib:@"MyAccountHomePageViewController"];
}

- (IBAction)shoppingMallBtnClick {
    [self buttonClickToClass:@"HomePageViewController" iPhone5Nib:@"HomePageViewController5" nib:@"HomePageViewController"];
}


- (IBAction)scanBtnClick {
    [self buttonClickToClass:@"QRCodeViewController" iPhone5Nib:@"QRCodeViewController5" nib:@"QRCodeViewController"];
        return;
}

- (IBAction)giftBtnClick {
    [self buttonClickToClass:@"GiftViewController" iPhone5Nib:@"GiftViewController5" nib:@"GiftViewController"];
}

- (void)initWithGift:(MockGift*)gift mall:(MockMall*)mall {
    _gift = gift;
    _mall = mall;
}

@end