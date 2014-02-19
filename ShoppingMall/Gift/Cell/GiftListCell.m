//
//  GiftListCell.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "GiftListCell.h"

@implementation GiftListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) initWithGift:(MockGift*)gift mall:(MockMall*)mall {
    mallName.text = [mall mallName];
    giftName.text = [gift giftName];
    points.text = [NSString stringWithFormat:@"积分：%d", [gift getPoints]];
}


@end
