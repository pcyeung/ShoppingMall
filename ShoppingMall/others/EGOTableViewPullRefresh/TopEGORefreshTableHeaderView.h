//
//  TopEGORefreshTableHeaderView.h
//  SMARTIAPP
//
//  Created by Ben Ma on 12-10-17.
//  Copyright (c) 2012年 iBrand International Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum{
	TopEGOOPullRefreshPulling = 0,
	TopEGOOPullRefreshNormal,
	TopEGOOPullRefreshLoading,	
} TopEGOPullRefreshState;

@protocol TopEGORefreshTableHeaderDelegate;

@interface TopEGORefreshTableHeaderView : UIView {
	
	id _delegate;
	TopEGOPullRefreshState _state;
    
	UILabel *_lastUpdatedLabel;
	UILabel *_statusLabel;
	CALayer *_arrowImage;
	UIActivityIndicatorView *_activityView;
	
    
}

@property(nonatomic,assign) id <TopEGORefreshTableHeaderDelegate> delegate;

- (void)ToprefreshLastUpdatedDate;
- (void)TopegoRefreshScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)TopegoRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView;
- (void)TopegoRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;

@end
@protocol TopEGORefreshTableHeaderDelegate
- (void)TopegoRefreshTableHeaderDidTriggerRefresh:(TopEGORefreshTableHeaderView*)view;
- (BOOL)TopegoRefreshTableHeaderDataSourceIsLoading:(TopEGORefreshTableHeaderView*)view;
@optional
- (NSDate*)TopegoRefreshTableHeaderDataSourceLastUpdated:(TopEGORefreshTableHeaderView*)view;
@end
