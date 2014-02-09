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
        [mallNameLabel setText:[[visitData mall] mallName]];
        
        NSString* dateString = [NSDateFormatter localizedStringFromDate:[visitData visitTime]
                                       dateStyle:NSDateFormatterShortStyle
                                       timeStyle:NSDateFormatterShortStyle];
        [checkInLabel setText:dateString];
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
