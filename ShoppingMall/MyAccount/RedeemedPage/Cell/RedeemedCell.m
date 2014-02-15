//
//  RedeemedCell.m
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import "RedeemedCell.h"

@implementation RedeemedCell

-(id) initWithStatus:(NSString*)status
{
    self = [super init];
    if (self) {
        NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"RedeemedCell" owner:self options:nil];
        [self addSubview:nibObjects[0]];
        
        [descLabel setText:status];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
