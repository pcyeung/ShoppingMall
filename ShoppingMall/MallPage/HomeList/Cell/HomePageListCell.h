//
//  HomePageListCell.h
//  ShoppingMall
//
//  Created by Codeguesser on 2014/1/26.
//  Copyright (c) 2014年 Macie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MockMall.h"

@interface HomePageListCell : UITableViewCell {
    IBOutlet UILabel *name;
    IBOutlet UILabel *address;
}

- (void) initWithMall:(MockMall*)mall;

@end
