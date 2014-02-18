#import "AddressAnnotation.h"

@implementation AddressAnnotation
@synthesize coordinate;

- (NSString *)subtitle{
	return subtitle;
}

- (NSString *)title{
	return title;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)c
                  title:(NSString*)t
               SubTitle:(NSString*)s {
	coordinate=c;
    title = t;
    subtitle = s;
	return self;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)c
{
    coordinate=c;
    return self;
}


@end