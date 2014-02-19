//
//  MockGift.m
//  ShoppingMall
//
//  Created by KIEN-MAN NG on 19/2/14.
//  Copyright (c) 2014 Macie. All rights reserved.
//

#import "MockGift.h"

@implementation MockGift

@synthesize giftName = _giftName;
@synthesize giftImage = _giftImage;
@synthesize giftSize = _giftSize;
@synthesize giftDetail = _giftDetail;
@synthesize brandLogo = _brandLogo;
@synthesize giftConCode = _giftConCode;

- (id) initWithData:(NSDictionary*)dataDict {
    self = [super init];
    if (self) {
        _giftName = [dataDict objectForKey:@"name"];
        _giftImage = [dataDict objectForKey:@"icon"];
        _giftSize = [dataDict objectForKey:@"size"];
        _giftDetail = [dataDict objectForKey:@"detail"];
        _brandLogo = [dataDict objectForKey:@"logo"];
        _giftConCode = [dataDict objectForKey:@"conCode"];

        points = [(NSNumber*)[dataDict objectForKey:@"point"] intValue];
    }
    return self;
}

+ (NSArray*)getAllGiftData {
    static NSMutableArray *allGifts;
    if (allGifts == nil) {
        allGifts = [[NSMutableArray alloc]init];
        
        NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
        [dic setObject:@"优衣库" forKey:@"name"];
        [dic setObject:@"pic2.png" forKey:@"icon"];
        [dic setObject:@"商品尺码  商品属性\n尺码：均码\n材质：锌合金\n尺寸：长13.5cmx宽4.8cm\n工艺：电镀、镶嵌蓝宝石、滴油\n系列：第十季\n类型：配饰" forKey:@"size"];
        [dic setObject:@"【产地说明】本店所有商品均从美国采购，但不是所有商品都是在美国生产，美国购买并不代表美国生产。由于经济全球化和劳动力成本原因，美国市场在售的很多产品都是中国、越南、南美等地区生产。" forKey:@"detail"];
        [dic setObject:@80 forKey:@"point"];
        [dic setObject:@"logo1.png" forKey:@"logo"];
        [dic setObject:@"235564894XED" forKey:@"conCode"];
        [allGifts addObject:[[MockGift alloc]initWithData:dic]];

        [dic removeAllObjects];
        [dic setObject:@"H & M" forKey:@"name"];
        [dic setObject:@"logo4.png" forKey:@"icon"];
        [dic setObject:@"商品尺码  商品属性\n尺码：均码\n材质：锌合金\n尺寸：长13.5cmx宽4.8cm\n工艺：电镀、镶嵌蓝宝石、滴油\n系列：第十季\n类型：配饰" forKey:@"size"];
        [dic setObject:@"【产地说明】本店所有商品均从美国采购，但不是所有商品都是在美国生产，美国购买并不代表美国生产。由于经济全球化和劳动力成本原因，美国市场在售的很多产品都是中国、越南、南美等地区生产。" forKey:@"detail"];
        [dic setObject:@500 forKey:@"point"];
        [dic setObject:@"logo4.png" forKey:@"logo"];
        [dic setObject:@"784915AD" forKey:@"conCode"];
        [allGifts addObject:[[MockGift alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"Lee" forKey:@"name"];
        [dic setObject:@"logo3.png" forKey:@"icon"];
        [dic setObject:@"商品尺码  商品属性\n尺码：均码\n材质：锌合金\n尺寸：长13.5cmx宽4.8cm\n工艺：电镀、镶嵌蓝宝石、滴油\n系列：第十季\n类型：配饰" forKey:@"size"];
        [dic setObject:@"【产地说明】本店所有商品均从美国采购，但不是所有商品都是在美国生产，美国购买并不代表美国生产。由于经济全球化和劳动力成本原因，美国市场在售的很多产品都是中国、越南、南美等地区生产。" forKey:@"detail"];
        [dic setObject:@350 forKey:@"point"];
        [dic setObject:@"logo3.png" forKey:@"logo"];
        [dic setObject:@"123556489SD" forKey:@"conCode"];
        [allGifts addObject:[[MockGift alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"SEPHORA" forKey:@"name"];
        [dic setObject:@"h12_pic.png" forKey:@"icon"];
        [dic setObject:@"商品尺码  商品属性\n尺码：均码\n材质：锌合金\n尺寸：长13.5cmx宽4.8cm\n工艺：电镀、镶嵌蓝宝石、滴油\n系列：第十季\n类型：配饰" forKey:@"size"];
        [dic setObject:@"【产地说明】本店所有商品均从美国采购，但不是所有商品都是在美国生产，美国购买并不代表美国生产。由于经济全球化和劳动力成本原因，美国市场在售的很多产品都是中国、越南、南美等地区生产。" forKey:@"detail"];
        [dic setObject:@60 forKey:@"point"];
        [dic setObject:@"logo2.png" forKey:@"logo"];
        [dic setObject:@"235564894AD" forKey:@"conCode"];
        [allGifts addObject:[[MockGift alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"CASIO" forKey:@"name"];
        [dic setObject:@"pic2.png" forKey:@"icon"];
        [dic setObject:@"商品尺码  商品属性\n尺码：均码\n材质：锌合金\n尺寸：长13.5cmx宽4.8cm\n工艺：电镀、镶嵌蓝宝石、滴油\n系列：第十季\n类型：配饰" forKey:@"size"];
        [dic setObject:@"【产地说明】本店所有商品均从美国采购，但不是所有商品都是在美国生产，美国购买并不代表美国生产。由于经济全球化和劳动力成本原因，美国市场在售的很多产品都是中国、越南、南美等地区生产。" forKey:@"detail"];
        [dic setObject:@290 forKey:@"point"];
        [dic setObject:@"logo5.png" forKey:@"logo"];
        [dic setObject:@"84915RAD" forKey:@"conCode"];
        [allGifts addObject:[[MockGift alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"优衣库" forKey:@"name"];
        [dic setObject:@"pic2.png" forKey:@"icon"];
        [dic setObject:@"商品尺码  商品属性\n尺码：均码\n材质：锌合金\n尺寸：长13.5cmx宽4.8cm\n工艺：电镀、镶嵌蓝宝石、滴油\n系列：第十季\n类型：配饰" forKey:@"size"];
        [dic setObject:@"【产地说明】本店所有商品均从美国采购，但不是所有商品都是在美国生产，美国购买并不代表美国生产。由于经济全球化和劳动力成本原因，美国市场在售的很多产品都是中国、越南、南美等地区生产。" forKey:@"detail"];
        [dic setObject:@80 forKey:@"point"];
        [dic setObject:@"logo1.png" forKey:@"logo"];
        [dic setObject:@"884915TF" forKey:@"conCode"];
        [allGifts addObject:[[MockGift alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"优衣库" forKey:@"name"];
        [dic setObject:@"pic2.png" forKey:@"icon"];
        [dic setObject:@"商品尺码  商品属性\n尺码：均码\n材质：锌合金\n尺寸：长13.5cmx宽4.8cm\n工艺：电镀、镶嵌蓝宝石、滴油\n系列：第十季\n类型：配饰" forKey:@"size"];
        [dic setObject:@"【产地说明】本店所有商品均从美国采购，但不是所有商品都是在美国生产，美国购买并不代表美国生产。由于经济全球化和劳动力成本原因，美国市场在售的很多产品都是中国、越南、南美等地区生产。" forKey:@"detail"];
        [dic setObject:@300 forKey:@"point"];
        [dic setObject:@"logo1.png" forKey:@"logo"];
        [dic setObject:@"235564894AD" forKey:@"conCode"];
        [allGifts addObject:[[MockGift alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"优衣库" forKey:@"name"];
        [dic setObject:@"pic2.png" forKey:@"icon"];
        [dic setObject:@"商品尺码  商品属性\n尺码：均码\n材质：锌合金\n尺寸：长13.5cmx宽4.8cm\n工艺：电镀、镶嵌蓝宝石、滴油\n系列：第十季\n类型：配饰" forKey:@"size"];
        [dic setObject:@"【产地说明】本店所有商品均从美国采购，但不是所有商品都是在美国生产，美国购买并不代表美国生产。由于经济全球化和劳动力成本原因，美国市场在售的很多产品都是中国、越南、南美等地区生产。" forKey:@"detail"];
        [dic setObject:@30 forKey:@"point"];
        [dic setObject:@"235564894AD" forKey:@"conCode"];
        [dic setObject:@"logo1.png" forKey:@"logo"];
        [allGifts addObject:[[MockGift alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"优衣库" forKey:@"name"];
        [dic setObject:@"pic2.png" forKey:@"icon"];
        [dic setObject:@"商品尺码  商品属性\n尺码：均码\n材质：锌合金\n尺寸：长13.5cmx宽4.8cm\n工艺：电镀、镶嵌蓝宝石、滴油\n系列：第十季\n类型：配饰" forKey:@"size"];
        [dic setObject:@"【产地说明】本店所有商品均从美国采购，但不是所有商品都是在美国生产，美国购买并不代表美国生产。由于经济全球化和劳动力成本原因，美国市场在售的很多产品都是中国、越南、南美等地区生产。" forKey:@"detail"];
        [dic setObject:@180 forKey:@"point"];
        [dic setObject:@"logo1.png" forKey:@"logo"];
        [dic setObject:@"235564894AD" forKey:@"conCode"];
        [allGifts addObject:[[MockGift alloc]initWithData:dic]];
        
        [dic removeAllObjects];
        [dic setObject:@"优衣库" forKey:@"name"];
        [dic setObject:@"pic2.png" forKey:@"icon"];
        [dic setObject:@"商品尺码  商品属性\n尺码：均码\n材质：锌合金\n尺寸：长13.5cmx宽4.8cm\n工艺：电镀、镶嵌蓝宝石、滴油\n系列：第十季\n类型：配饰" forKey:@"size"];
        [dic setObject:@"【产地说明】本店所有商品均从美国采购，但不是所有商品都是在美国生产，美国购买并不代表美国生产。由于经济全球化和劳动力成本原因，美国市场在售的很多产品都是中国、越南、南美等地区生产。" forKey:@"detail"];
        [dic setObject:@280 forKey:@"point"];
        [dic setObject:@"logo1.png" forKey:@"logo"];
        [dic setObject:@"235564894AD" forKey:@"conCode"];
        [allGifts addObject:[[MockGift alloc]initWithData:dic]];
    }
    return allGifts;
}

+ (void)load {
    [super load];
    [MockGift getAllGiftData];
}

- (int) getPoints {
    return points;
}

@end
