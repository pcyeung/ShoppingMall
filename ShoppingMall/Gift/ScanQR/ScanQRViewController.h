//
//  ScanQRViewController.h
//  ShoppingMall
//
//  Created by Alex Cheung on 14/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MyAccountHomePageViewController.h"
#import "HomePageViewController.h"
#import "MallGiftListPageViewController.h"
#import "ZBarSDK.h"
#import "MockGift.h"

@interface ScanQRViewController : BaseViewController<ZBarReaderDelegate,ZBarReaderViewDelegate>{
    IBOutlet UIButton *backBtn;
    IBOutlet UIButton *scannedBtn;
    
    int num;
    BOOL upOrdown;
    NSTimer * timer;
    
    ZBarReaderView *readerView;
    NSMutableDictionary *dic;
}

@property (nonatomic, strong) MockMall * mall;
@property (nonatomic, strong) MockGift * gift;
@property (nonatomic, strong) UIImageView * line;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withDic:(NSMutableDictionary *)sender;
- (void) initWithGift:(MockGift*)gift mall:(MockMall*)mall;

- (IBAction)backBtnClick;
- (IBAction)scannedBtnClick;

@end
