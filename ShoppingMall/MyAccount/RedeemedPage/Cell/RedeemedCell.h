//
//  RedeemedCell.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MockGift.h"
#import "MockMall.h"

@interface RedeemedCell : UITableViewCell {
    IBOutlet UILabel *descLabel;
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *mallLabel;
}

-(id) initWithGift:(MockGift*)gift mall:(MockMall*)mall status:(NSString*)status;

@end
