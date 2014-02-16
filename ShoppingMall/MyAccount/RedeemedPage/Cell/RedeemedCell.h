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
    IBOutlet UILabel *nameLabel;
}

-(id) initWithName:(NSString*)name status:(NSString*)status;

@end
