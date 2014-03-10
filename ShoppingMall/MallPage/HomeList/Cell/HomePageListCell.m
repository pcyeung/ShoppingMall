//
//  HomePageListCell.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "HomePageListCell.h"

@implementation HomePageListCell

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

- (void)initWithMall:(MockMall *)mall {
    name.text = [mall mallName];
    // Change the logo if the mall is sogo
    if ([name.text isEqualToString:@"庄胜崇光"])
    {
        UIImage *sogoImg = [UIImage imageNamed:@"sogo.png"];
        [MallImg setImage:sogoImg];
    }
    if ([name.text isEqualToString:@"欧美汇"])
    {
        UIImage *ecMallImg = [UIImage imageNamed:@"ecmall.jpg"];
        [MallImg setImage:ecMallImg];
    }
    if ([name.text isEqualToString:@"北京APM"])
    {
        UIImage *ecMallImg = [UIImage imageNamed:@"apm.jpg"];
        [MallImg setImage:ecMallImg];
    }
    if ([name.text isEqualToString:@"未来广场"])
    {
        UIImage *ecMallImg = [UIImage imageNamed:@"future.jpg"];
        [MallImg setImage:ecMallImg];
    }
    address.text = [mall mallAddress];
    points.text = [NSString stringWithFormat:@"%d分", [mall getBonusPoints]];
    distance.text = [mall distance];
}

@end
