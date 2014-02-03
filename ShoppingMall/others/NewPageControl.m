//
//  NewPageControl.m
//  mic1
//
//  Created by admin on 12-5-3.
//  Copyright 2012 iBrand International Limited. All rights reserved.
//

#import "NewPageControl.h"

@interface NewPageControl (private)
-(void)updateDots;
@end


@implementation NewPageControl
@synthesize imagePageHightlighted,imagePageStateNormal;

-(void)setImagePageStateNormal:(UIImage *)image{
	imagePageStateNormal=image;
	[self updateDots];
}

-(void)setImagePageHightlighted:(UIImage *)image{
	imagePageHightlighted=image;
	[self updateDots];
}

-(void)updateDots{
	if(imagePageStateNormal || imagePageHightlighted){
		NSArray *subview=self.subviews;
		for (NSInteger i=0; i<[subview count]; i++) {
			UIImageView *dot=[subview objectAtIndex:i];
			dot.image=self.currentPage==i?imagePageStateNormal:imagePageHightlighted;
		}
	}
}

@end


