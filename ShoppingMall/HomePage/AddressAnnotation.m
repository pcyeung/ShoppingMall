#import "AddressAnnotation.h"

@implementation AddressAnnotation
@synthesize coordinate;
@synthesize mall;

- (NSString *)subtitle{
	return [mall getMallAddress];
}

- (NSString *)title{
	return [mall getMallName];
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)c mall:(MockMall *)m {
	coordinate=c;
    mall = m;
	return self;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)c
{
    coordinate=c;
    return self;
}


@end