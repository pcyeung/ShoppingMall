//
//  ScanQRViewController.m
//  ShoppingMall
//
//  Created by Alex Cheung on 14/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ScanQRViewController.h"
#import "MyAccountHomePageViewController.h"
#import "HomePageViewController.h"
#import "RedeemedViewController.h"
#import "QRConfirmViewController.h"
#import "GiftDetailPageViewController.h"

@implementation Scanner

@synthesize line = _line;

- (id)initWithWidth:(int)w height:(int)h {
    width = w;
    height = h;

    
    self = [super init];
    if (self != nil) {
        readerView=[[ZBarReaderView alloc]init];
        readerView.frame=CGRectMake(0, 50, width, height-100);
        readerView.torchMode = 0;
   //     readerView.readerDelegate = self;
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
   //     [self.view addSubview:readerView];
    }
    return self;
}

-(void)animation1
{
    if (upOrdown == NO) {
        num ++;
        _line.frame = CGRectMake(30, 10+2*num, 220, 2);
        if (2*num == height-160) {
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

- (ZBarReaderView*) getReaderView {
    return readerView;
}

- (void)stop {
    [readerView stop];
    [timer invalidate];
    timer = nil;
}

@end




@implementation ScanQRViewController

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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withDic:(NSMutableDictionary *)sender
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        dic=sender;
    }
    return self;
}

+ (Scanner*)getScannerWithWidth:(int)w height:(int)h {
    static Scanner* scanner;
    if (scanner == nil) {
        scanner = [[Scanner alloc] initWithWidth:w height:h];
    }
    return scanner;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    Scanner* scanner = [ScanQRViewController getScannerWithWidth:self.view.frame.size.width height:self.view.frame.size.height];
    readerView = [scanner getReaderView];
    readerView.readerDelegate=self;
    
    // Handle Single Tab action on the Scanning View
    UITapGestureRecognizer *singleTab = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scannedBtnClick)];
    singleTab.numberOfTapsRequired = 1;
    readerView.userInteractionEnabled = YES;
    [readerView addGestureRecognizer:singleTab];
    
    [self.view addSubview:readerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)viewWillAppear:(BOOL)animated{
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

- (IBAction)scannedBtnClick {
    QRConfirmViewController* controller = (QRConfirmViewController*)[self buttonClickGetClass:@"QRConfirmViewController" iPhone5Nib:@"QRConfirmViewController5" nib:@"QRConfirmViewController"];
    [[MockUser sharedUserObject] addPrize:_gift mall:_mall controller:self.navigationController];
    [controller initWithGift:_gift mall:_mall];
    [self popOrPush:@"QRConfirmViewController" controller:controller];
    
    // Remove the scanner and preview page.
    [readerView stop];

    NSMutableArray *navigationArray = [[NSMutableArray alloc] init];
    for (UIViewController* tem in self.navigationController.viewControllers) {
        if ([tem isKindOfClass:[ScanQRViewController class]] ||
            [tem isKindOfClass:[GiftDetailPageViewController class]]) {
            if ([tem isKindOfClass:[ScanQRViewController class]]) {
                [tem dismissViewControllerAnimated:NO completion:nil];
            }
            continue;
        }
        [navigationArray addObject:tem];
    }
    self.navigationController.viewControllers = navigationArray;
}

-(void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image{
    for (ZBarSymbol *symbol in symbols) {
        NSLog(@"%@",symbol.data);
        break;
    }
    
    [self scannedBtnClick];
}

- (void) initWithGift:(MockGift*)gift mall:(MockMall*)mall {
    _gift = gift;
    _mall = mall;
}



- (IBAction)backBtnClick {
    [readerView stop];

    [self.navigationController popViewControllerAnimated:YES];
}

@end
