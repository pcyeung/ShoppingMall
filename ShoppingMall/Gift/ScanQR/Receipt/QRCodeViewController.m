//
//  QRCodeViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/2/15.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "QRCodeViewController.h"

@interface QRCodeViewController ()

@end

@implementation QRCodeViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
