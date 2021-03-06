//
//  TimelineListCell.m
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 4/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import "TimelineListCell.h"

@implementation TimelineListCell

-(id) initWithVisitData:(VisitData*)visitData
{
    self = [super init];
    if (self) {
        NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"TimelineListCell" owner:self options:nil];
        [self addSubview:nibObjects[0]];

        MockMall* mall = [visitData mall];
        [mallNameLabel setText:[mall mallName]];
        [mallAddressLabel setText:[mall mallAddress]];
        NSString* dateString = [NSDateFormatter localizedStringFromDate:[visitData visitTime]
                                       dateStyle:NSDateFormatterShortStyle
                                       timeStyle:NSDateFormatterShortStyle];
        [checkInLabel setText:[NSString stringWithFormat:@"签到时间: %@", dateString]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
