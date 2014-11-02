//
//  GoodsManager.m
//  TestTask
//
//  Created by admin on 01.11.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "GoodsManager.h"
#import "GoodsItem.h"

static GoodsManager *goods_manager;

@implementation GoodsManager
{
    NSMutableArray *goodsArray;
    NSMutableArray *buysArray;
}

+(GoodsManager *)sharedGoodsManager
{
    if (!goods_manager)
    {
        goods_manager = [[GoodsManager alloc] init];
    }
    
    return goods_manager;
}

-(id)init
{
    if (self = [super init])
    {
        goodsArray = [[NSMutableArray alloc] init];
        buysArray = [[NSMutableArray alloc] init];
    }
    
    [self load];
    return self;
}

-(void)dealloc
{
    goodsArray = nil;
    buysArray = nil;
}

-(NSArray *)goods
{
    return goodsArray;
}

-(NSArray *)buys
{
    return buysArray;
}

-(void)addGoods:(GoodsItem *)item
{
    if ([item isKindOfClass:[GoodsItem class]])
    {
        [goodsArray addObject:item];
        [self save];
    }
}

-(void)removeGoods:(GoodsItem *)item
{
    if ([item isKindOfClass:[GoodsItem class]])
    {
        [goodsArray removeObject:item];
        [self save];
    }
}

-(void)buyGoods:(GoodsItem *)item
{
    if ([item isKindOfClass:[GoodsItem class]])
    {
        if (item.count >= 1) {
            item.count--;
        }
        else
        {
            //[goodsArray removeObject:item];
        }
        
        [buysArray addObject:item.name];
        // занести в массив покупок
        
        [self save];
    }
}

-(void)load
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *encoded_goods = [defaults objectForKey:@"goods"];
    [goodsArray removeAllObjects];
    
    if (!encoded_goods)
    {
        [self createFakeGoods];
    }
    
    for (NSData *encodedObject in encoded_goods) {
        GoodsItem *item = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
        [goodsArray addObject:item];
    }
}

-(void)createFakeGoods
{
    GoodsItem *apple = [[GoodsItem alloc] init];
    apple.name = @"Яблоко";
    apple.text = @"Вкусное яблочко";
    apple.count = 10;
    apple.price = 5;
    [goodsArray addObject:apple];

    GoodsItem *table = [[GoodsItem alloc] init];
    table.name = @"Стол";
    table.text = @"Стол письменный";
    table.count = 1;
    table.price = 420;
    [goodsArray addObject:table];

    GoodsItem *dog = [[GoodsItem alloc] init];
    dog.name = @"Собака";
    dog.text = @"Собака злая";
    dog.count = 5;
    dog.price = 170;
    [goodsArray addObject:dog];

    GoodsItem *car = [[GoodsItem alloc] init];
    car.name = @"Машина";
    car.text = @"Автомобиль красный";
    car.count = 2;
    car.price = 7000;
    [goodsArray addObject:car];

    GoodsItem *dress = [[GoodsItem alloc] init];
    dress.name = @"Платье";
    dress.text = @"Платье для девочки";
    dress.count = 3;
    dress.price = 300;
    [goodsArray addObject:dress];
    
    [self save];
}

-(void)save
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *encoded_goods = [NSMutableArray array];
    for (GoodsItem *item in goodsArray) {
        NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:item];
        [encoded_goods addObject:encodedObject];
    }

    [defaults setObject:encoded_goods forKey:@"goods"];
    [defaults synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"saveGoods" object:nil];
}

@end
