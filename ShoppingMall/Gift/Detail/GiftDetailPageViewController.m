//
//  GiftDetailPageViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "GiftDetailPageViewController.h"
#import "MyAccountHomePageViewController.h"
#import "HomePageViewController.h"
#import "QRConfirmViewController.h"

@interface GiftDetailPageViewController ()

@end

@implementation GiftDetailPageViewController

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
    sizeText.text = [_gift giftSize];
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
    QRConfirmViewController* controller = (QRConfirmViewController*)[self buttonClickGetClass:@"QRConfirmViewController" iPhone5Nib:@"QRConfirmViewController5" nib:@"QRConfirmViewController"];
    [[MockUser sharedUserObject] addPrize:_gift mall:_mall controller:self.navigationController];
    [controller initWithGift:_gift mall:_mall];
    [self popOrPush:@"QRConfirmViewController" controller:controller];
    
    NSMutableArray *navigationArray = [[NSMutableArray alloc] init];
    for (UIViewController* tem in self.navigationController.viewControllers) {
        if ([tem isKindOfClass:[GiftDetailPageViewController class]]) {
            continue;
        }
        [navigationArray addObject:tem];
    }
    self.navigationController.viewControllers = navigationArray;
}

- (IBAction)giftBtnClick {
    [self buttonClickToClass:@"GiftViewController" iPhone5Nib:@"GiftViewController5" nib:@"GiftViewController"];
}

- (void)initWithGift:(MockGift*)gift mall:(MockMall*)mall {
    _gift = gift;
    _mall = mall;
}

@end
