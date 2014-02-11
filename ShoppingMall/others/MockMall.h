//
//  MockMall.h
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 2/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Sonic/SonicAudioHeardCode.h>

@interface MockMall : NSObject {
    int bonusPoints;
    int mallId;
}

@property(strong, nonatomic) NSString *mallName;
@property(strong, nonatomic) NSString *mallAddress;
@property(strong, nonatomic) NSString *adsText;

- (id)initWithSonicCode:(SonicCodeHeard *)code;
- (int) getBonusPoints;
- (int) getMallId;

@end
