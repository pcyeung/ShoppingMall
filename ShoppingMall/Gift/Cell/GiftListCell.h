//
//  GiftListCell.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MockGift.h"
#import "MockMall.h"

@interface GiftListCell : UITableViewCell {
    IBOutlet UILabel *points;
    IBOutlet UILabel *mallName;
    IBOutlet UILabel *giftName;
}

- (void) initWithGift:(MockGift*)gift mall:(MockMall*)mall;

@end
