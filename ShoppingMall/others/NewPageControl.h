//
//  NewPageControl.h
//  mic1
//
//  Created by admin on 12-5-3.
//  Copyright 2012 iBrand International Limited. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NewPageControl : UIPageControl{
	UIImage *imagePageStateNormal;
	UIImage *imagePageHightlighted;
}

@property (nonatomic,retain)UIImage *imagePageStateNormal;
@property (nonatomic,retain)UIImage *imagePageHightlighted;

@end
