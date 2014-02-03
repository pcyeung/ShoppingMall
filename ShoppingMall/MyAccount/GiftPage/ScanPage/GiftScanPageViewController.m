//
//  GiftScanPageViewController.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "GiftScanPageViewController.h"
#import "ConfirmationPageViewController.h"
#import "HomePageListViewController.h"
#import "MyAccountHomePageViewController.h"
#import "HomePageViewController.h"

@interface GiftScanPageViewController ()

@end

@implementation GiftScanPageViewController

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

-(void)viewWillAppear:(BOOL)animated{
    ZBarReaderView *readerView=[[ZBarReaderView alloc]init];
    readerView.frame=CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-100);
    readerView.torchMode=0;
    readerView.readerDelegate=self;
    readerView.allowsPinchZoom=NO;
    readerView.scanCrop=CGRectMake(0.1, 0.2, 0.8, 0.8);
    
    UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pick_bg@2x.png"]];
    image.frame = CGRectMake(20, 20, 280, readerView.frame.size.height-40);
    [readerView addSubview:image];
    
    
    _line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 280, 2)];
    _line.image = [UIImage imageNamed:@"line@2x.png"];
    [image addSubview:_line];
    //定时器，设定时间过1.5秒，
    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
    [self.view addSubview:readerView];
    
    [readerView start];
}

-(CGRect)getScanCrop:(CGRect)rect readerViewBounds:(CGRect)readerViewBounds{
    CGFloat x,y,width,height;
    x=rect.origin.x/readerViewBounds.size.width;
    y=rect.origin.y/readerViewBounds.size.height;
    width=rect.size.width/readerViewBounds.size.width;
    height=rect.size.height/readerViewBounds.size.height;
    NSLog(@"%f%f%f%f",x, y, width, height);
    return CGRectMake(x, y, width, height);
}

-(void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image{
    for (ZBarSymbol *symbol in symbols) {
        NSLog(@"%@",symbol.data);
        break;
    }
    ConfirmationPageViewController *confirmationPageView;
    if (iPhone5) {
        confirmationPageView=[[ConfirmationPageViewController alloc]initWithNibName:@"ConfirmationPageViewController5" bundle:nil];
    }else{
        confirmationPageView=[[ConfirmationPageViewController alloc]initWithNibName:@"ConfirmationPageViewController" bundle:nil];
    }
    [self.navigationController pushViewController:confirmationPageView animated:YES];
    [readerView stop];
}

-(void)animation1
{
    if (upOrdown == NO) {
        num ++;
        _line.frame = CGRectMake(30, 10+2*num, 220, 2);
        if (2*num == self.view.frame.size.height-160) {
            upOrdown = YES;
        }
    }
    else {
        num --;
        _line.frame = CGRectMake(30, 10+2*num, 220, 2);
        if (num == 0) {
            upOrdown = NO;
        }
    }
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

- (IBAction)shoppingMallListBtnClick {
    for (UIViewController *tem in self.navigationController.viewControllers) {
        if ([tem isKindOfClass:[HomePageViewController class]]) {
            [self.navigationController popToViewController:tem animated:YES];
        }
    }
    
}
@end
