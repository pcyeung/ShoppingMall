//
//  ConfirmationPageViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "ConfirmationPageViewController.h"
#import "HomePageListViewController.h"
#import "MyAccountHomePageViewController.h"
#import "HomePageViewController.h"
#import "HomePageListViewController.h"
#import "QRCodeViewController.h"

@interface ConfirmationPageViewController ()

@end

@implementation ConfirmationPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withDic:(NSMutableDictionary *)sender
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        dic=sender;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    shoppingmall.text=[[[NSUserDefaults standardUserDefaults]objectForKey:@"shoppingmall"] objectForKey:@"name"];
    giftName.text=[dic objectForKey:@"name"];
    image.image=[UIImage imageNamed:[dic objectForKey:@"icon"]];
    logo.image=[UIImage imageNamed:[dic objectForKey:@"logo"]];
    size.text=[dic objectForKey:@"size"];
    int number=ceilf((float)[size.text length]/20);
    NSString *str=[[dic objectForKey:@"size"] stringByReplacingOccurrencesOfString:@"\n" withString:@"#*n*#"];
    if ([[str componentsSeparatedByString:@"#*n*#"] count]>=3) {
        number=number+[[str componentsSeparatedByString:@"#*n*#"] count]-2;
    }else{
        number=number+[[str componentsSeparatedByString:@"#*n*#"] count];
    }
    NSLog(@"%d",number);
    size.numberOfLines=number;
    size.frame=CGRectMake(size.frame.origin.x, size.frame.origin.y, 280, 17*number);
    NSLog(@"%f",size.frame.size.height);
    
    detail.text=[NSString stringWithFormat:@"成功兑换\n%@",[dic objectForKey:@"conCode"]];
    detail.numberOfLines=2;
    detail.frame=CGRectMake(detail.frame.origin.x, size.frame.origin.y+size.frame.size.height+5, 280, 40);

    shareBtn.frame=CGRectMake(shareBtn.frame.origin.x, detail.frame.origin.y+detail.frame.size.height+5, shareBtn.frame.size.width, shareBtn.frame.size.height);
    
    CGSize thissize=CGSizeMake(320, shareBtn.frame.origin.y+shareBtn.frame.size.height);
    [contentDetail setContentSize:thissize];
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
    for (UIViewController *tem in self.navigationController.viewControllers) {
        if ([tem isKindOfClass:[MyAccountHomePageViewController class]]) {
            [self.navigationController popToViewController:tem animated:YES];
        }
    }
    
    MyAccountHomePageViewController *myAccountView;
    if (iPhone5) {
        myAccountView=[[MyAccountHomePageViewController alloc]initWithNibName:@"MyAccountHomePageViewController5" bundle:nil];
    }else{
        myAccountView=[[MyAccountHomePageViewController alloc]initWithNibName:@"MyAccountHomePageViewController" bundle:nil];
    }
    [self.navigationController pushViewController:myAccountView animated:YES];
}

- (IBAction)mapBtnClick {
}

- (IBAction)listBTnClick{
    HomePageListViewController *listPageView;
    if (iPhone5) {
        listPageView=[[HomePageListViewController alloc]initWithNibName:@"HomePageListViewController5" bundle:nil];
    }else{
        listPageView=[[HomePageListViewController alloc]initWithNibName:@"HomePageListViewController" bundle:nil];
    }
    [self.navigationController pushViewController:listPageView animated:YES];
}

- (IBAction)shoppingMallListBtnClick {
    for (UIViewController *tem in self.navigationController.viewControllers) {
        if ([tem isKindOfClass:[HomePageViewController class]]) {
            [self.navigationController popToViewController:tem animated:YES];
        }
    }
    
}

- (IBAction)giftBtnClick{
    HomePageListViewController *listPageView;
    if (iPhone5) {
        listPageView=[[HomePageListViewController alloc]initWithNibName:@"HomePageListViewController5" bundle:nil];
    }else{
        listPageView=[[HomePageListViewController alloc]initWithNibName:@"HomePageListViewController" bundle:nil];
    }
    [self.navigationController pushViewController:listPageView animated:YES];
}

- (IBAction)redeemedBtnClick {
    QRCodeViewController *QRCodeView;
    if (iPhone5) {
        QRCodeView=[[QRCodeViewController alloc]initWithNibName:@"QRCodeViewController5" bundle:nil];
    }else{
        QRCodeView=[[QRCodeViewController alloc]initWithNibName:@"QRCodeViewController" bundle:nil];
    }
    [self.navigationController pushViewController:QRCodeView animated:YES];
}

@end
