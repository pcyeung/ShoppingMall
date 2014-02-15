//
//  RedeemedCell.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RedeemedCell : UITableViewCell {
    IBOutlet UILabel *descLabel;
}

-(id) initWithStatus:(NSString*)status;

@end
