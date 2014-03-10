//
//  MockMall.m
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 2/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import "MockMall.h"
#import <Sonic/SonicBluetoothCodeHeard.h>
#import <Sonic/SonicCodeHeard.h>
#import <Sonic/SonicContent.h>

@implementation MockMall

@synthesize mallName = _mallName;
@synthesize mallAddress = _mallAddress;
@synthesize adsText = _adsText;
@synthesize distance = _distance;

- (id)initWithData:(NSDictionary*)dataDict {
    self = [super init];
    if (self) {
        _mallName = [dataDict objectForKey:@"name"];
        _mallAddress = [dataDict objectForKey:@"address"];
        _adsText = [dataDict objectForKey:@"ads-string"];
        bonusPoints = [(NSNumber*)[dataDict objectForKey:@"bonus-points"] intValue];
        beaconId = [(NSNumber*)[dataDict objectForKey:@"beacon-id"] intValue];
        _distance = [dataDict objectForKey:@"distance"];
        coordinates.latitude = [(NSNumber*)[dataDict objectForKey:@"latitude"] doubleValue];
        coordinates.longitude = [(NSNumber*)[dataDict objectForKey:@"longitude"] doubleValue];
    }
    return self;
}

+ (NSArray*)getAllMallData {
    static NSMutableArray *allMalls;
    if (allMalls == nil) {
        allMalls = [[NSMutableArray alloc]init];
        
        NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
        [dic setObject:@"欧美汇" forKey:@"name"];
        [dic setObject:@"EC Mall" forKey:@"en-name"];
        [dic setObject:@"海淀区中关村丹棱街甲1号" forKey:@"address"];
        [dic setObject:@"http://www.ecmall.com.cn/plus/list.php?tid=4" forKey:@"url"];
        //[dic setObject:@802396 forKey:@"beacon-id"];
        [dic setObject:@802397 forKey:@"beacon-id"];
        [dic setObject:@"" forKey:@"ads-string"];
        [dic setObject:@"100m" forKey:@"distance"];
        [dic setObject:@39.978987 forKey:@"latitude"];
        [dic setObject:@116.314895 forKey:@"longitude"];
        [dic setObject:@10 forKey:@"bonus-points"];
        [allMalls addObject:[[MockMall alloc]initWithData:dic]];

        [dic removeAllObjects];
        [dic setObject:@"颐堤港" forKey:@"name"];
        [dic setObject:@"Indigo" forKey:@"en-name"];
        [dic setObject:@"朝阳区酒仙桥路18号" forKey:@"address"];
        [dic setObject:@"http://www.indigobeijing.com/zh-CN/index.aspx" forKey:@"url"];
        [dic setObject:@802396 forKey:@"beacon-id"];
        [dic setObject:@"赠送烤鸡腿" forKey:@"ads-string"];
        [dic setObject:@"1km" forKey:@"distance"];
        [dic setObject:@39.969878 forKey:@"latitude"];
        [dic setObject:@116.491492 forKey:@"longitude"];
        [dic setObject:@10 forKey:@"bonus-points"];
        [allMalls addObject:[[MockMall alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"庄胜崇光" forKey:@"name"];
        [dic setObject:@"Sogo" forKey:@"en-name"];
        [dic setObject:@"西城区宣武门外大街8号" forKey:@"address"];
        [dic setObject:@"http://sogo.junefield.com/brand.php" forKey:@"url"];
        [dic setObject:@802390 forKey:@"beacon-id"]; //82398 before
        [dic setObject:@"" forKey:@"ads-string"];
        [dic setObject:@"100m" forKey:@"distance"];
        [dic setObject:@39.897252 forKey:@"latitude"];
        [dic setObject:@116.375663 forKey:@"longitude"];
        [dic setObject:@10 forKey:@"bonus-points"];
        [allMalls addObject:[[MockMall alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"远洋未来广场" forKey:@"name"];
        [dic setObject:@"We Life Plaza" forKey:@"en-name"];
        [dic setObject:@"朝阳区北四环东路73号" forKey:@"address"];
        [dic setObject:@"http://weibo.com/welifebj" forKey:@"url"];
        [dic setObject:@802399 forKey:@"beacon-id"];
        [dic setObject:@"赠送烤鸡腿" forKey:@"ads-string"];
        [dic setObject:@"10km" forKey:@"distance"];
        [dic setObject:@39.98881 forKey:@"latitude"];
        [dic setObject:@116.426947 forKey:@"longitude"];
        [dic setObject:@10 forKey:@"bonus-points"];
        [allMalls addObject:[[MockMall alloc]initWithData:dic]];

        
        [dic removeAllObjects];
        [dic setObject:@"芳草地" forKey:@"name"];
        [dic setObject:@"Parkview Green" forKey:@"en-name"];
        [dic setObject:@"朝阳区东大桥路9号" forKey:@"address"];
        [dic setObject:@"http://www.parkviewgreen.com/cn/shop/" forKey:@"url"];
        [dic setObject:@1 forKey:@"beacon-id"];
        [dic setObject:@"赠送烤鸡腿" forKey:@"ads-string"];
        [dic setObject:@"10km" forKey:@"distance"];
        [dic setObject:@39.919483 forKey:@"latitude"];
        [dic setObject:@116.448866 forKey:@"longitude"];
        [dic setObject:@10 forKey:@"bonus-points"];
        [allMalls addObject:[[MockMall alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"北京APM" forKey:@"name"];
        [dic setObject:@"Beijing APM" forKey:@"en-name"];
        [dic setObject:@"王府井大街138号" forKey:@"address"];
        [dic setObject:@"http://www.beijingapm.cn/templates/T_search/index.aspx?nodeid=9" forKey:@"url"];
        [dic setObject:@82398 forKey:@"beacon-id"];
        [dic setObject:@"赠送烤鸡腿" forKey:@"ads-string"];
        [dic setObject:@"10km" forKey:@"distance"];
        [dic setObject:@39.913244 forKey:@"latitude"];
        [dic setObject:@116.411841 forKey:@"longitude"];
        [dic setObject:@10 forKey:@"bonus-points"];
        [allMalls addObject:[[MockMall alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"乐天银泰" forKey:@"name"];
        [dic setObject:@"Lotte Yintai" forKey:@"en-name"];
        [dic setObject:@"东城区王府井大街88号" forKey:@"address"];
        [dic setObject:@"http://about.yintai.com/intime/bj.html" forKey:@"url"];
        [dic setObject:@3 forKey:@"beacon-id"];
        [dic setObject:@"赠送烤鸡腿" forKey:@"ads-string"];
        [dic setObject:@"5km" forKey:@"distance"];
        [dic setObject:@39.916242 forKey:@"latitude"];
        [dic setObject:@116.411745 forKey:@"longitude"];
        [dic setObject:@10 forKey:@"bonus-points"];
        [allMalls addObject:[[MockMall alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"银座" forKey:@"name"];
        [dic setObject:@"Ginza Mall" forKey:@"en-name"];
        [dic setObject:@"东城区东直门外大街48号" forKey:@"address"];
        [dic setObject:@"http://www.ginza-mall.com/shop/detail.aspx" forKey:@"url"];
        [dic setObject:@4 forKey:@"beacon-id"];
        [dic setObject:@"赠送烤鸡腿" forKey:@"ads-string"];
        [dic setObject:@"10km" forKey:@"distance"];
        [dic setObject:@22.278151 forKey:@"latitude"];
        [dic setObject:@114.181706 forKey:@"longitude"];
        [dic setObject:@10 forKey:@"bonus-points"];
        [allMalls addObject:[[MockMall alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"世贸天阶" forKey:@"name"];
        [dic setObject:@"The Place" forKey:@"en-name"];
        [dic setObject:@"朝阳区光华路9号" forKey:@"address"];
        [dic setObject:@"http://www.theplace.cn/" forKey:@"url"];
        [dic setObject:@5 forKey:@"beacon-id"];
        [dic setObject:@"赠送烤鸡腿" forKey:@"ads-string"];
        [dic setObject:@"10km" forKey:@"distance"];
        [dic setObject:@22.278151 forKey:@"latitude"];
        [dic setObject:@114.181706 forKey:@"longitude"];
        [dic setObject:@10 forKey:@"bonus-points"];
        [allMalls addObject:[[MockMall alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"西单大悦城" forKey:@"name"];
        [dic setObject:@"Joy City Xidan" forKey:@"en-name"];
        [dic setObject:@"西单北大街甲131号大悦城" forKey:@"address"];
        [dic setObject:@"http://www.xidanjoycity.com/about/index.html" forKey:@"url"];
        [dic setObject:@802399 forKey:@"beacon-id"];
        [dic setObject:@"赠送烤鸡腿" forKey:@"ads-string"];
        [dic setObject:@"500m" forKey:@"distance"];
        [dic setObject:@39.910846 forKey:@"latitude"];
        [dic setObject:@116.373271 forKey:@"longitude"];
        [dic setObject:@10 forKey:@"bonus-points"];
        [allMalls addObject:[[MockMall alloc]initWithData:dic]];
        
            }
    return allMalls;
}

+ (NSDictionary*)getBeaconIdMap {
    static NSDictionary *beaconIdMap;
    if (beaconIdMap == nil) {
        NSArray* allMalls = [MockMall getAllMallData];
        NSMutableArray* beaconIds = [[NSMutableArray alloc]init];
        for (MockMall* mall in allMalls) {
            [beaconIds addObject:[[NSNumber alloc]initWithInt:[mall getBeaconId]]];
        }
        beaconIdMap = [[NSDictionary alloc]initWithObjects:allMalls forKeys:beaconIds];
    }
    return beaconIdMap;
}

+ (void)load {
    [super load];
    [MockMall getAllMallData];
}

+ (MockMall*)getMallWithSonicCode:(SonicCodeHeard*)code {
    int beaconCode = -1;
    if ([code isKindOfClass:[SonicBluetoothCodeHeard class]]) {
        SonicBluetoothCodeHeard* blueHeard = (SonicBluetoothCodeHeard*) code;
        beaconCode = [blueHeard beaconCode];
    } else if ([code isKindOfClass:[SonicAudioHeardCode class]]) {
        SonicAudioHeardCode* audioHeard = (SonicAudioHeardCode*) code;
        beaconCode = [audioHeard beaconCode];
    }
    
    if (beaconCode == -1) {
        NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
        [dic setObject:@"Unrecognized" forKey:@"name"];
        [dic setObject:@"Unrecognized" forKey:@"en-name"];
        [dic setObject:@"Unrecognized" forKey:@"address"];
        [dic setObject:@"http://Unrecognized/Unrecognized" forKey:@"url"];
        [dic setObject:@-1 forKey:@"beacon-id"];
        [dic setObject:@"赠送X" forKey:@"ads-string"];
        [dic setObject:@0 forKey:@"latitude"];
        [dic setObject:@0 forKey:@"longitude"];
        [dic setObject:@1 forKey:@"bonus-points"];
        return [[MockMall alloc]initWithData:dic];
    }

    NSNumber* beaconNumber = [[NSNumber alloc]initWithInt:beaconCode];
    NSDictionary* beaconMap = [MockMall getBeaconIdMap];
    MockMall* mall = [beaconMap objectForKey:beaconNumber];
    return mall;
}

- (int) getBonusPoints {
    return bonusPoints;
}

- (int) getBeaconId {
    return beaconId;
}

- (CLLocationCoordinate2D) getCoordinates {
    return coordinates;
}

- (NSString*) getMallName
{
    return _mallName;
}

- (NSString*) getMallAddress
{
    return _mallAddress;
}


@end
