//
//  TimelineListCell.h
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 4/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MockUser.h"

@interface TimelineListCell : UITableViewCell {
    IBOutlet UILabel *mallNameLabel;
    IBOutlet UILabel *checkInLabel;
}

-(id) initWithVisitData:(VisitData*)visitData;

@end
