//
//  RedeemedCell.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "RedeemedCell.h"

@implementation RedeemedCell

-(void) initWithGift:(MockGift*)gift mall:(MockMall*)mall status:(NSString*)status {
    [descLabel setText:status];
    [nameLabel setText:[gift giftName]];
    [mallLabel setText:[mall mallName]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
