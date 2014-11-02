//
//  GoodsManager.h
//  TestTask
//
//  Created by admin on 01.11.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodsItem.h"

@interface GoodsManager : NSObject

@property (nonatomic, readonly)NSArray *goods;
@property (nonatomic, readonly)NSArray *buys;

+(GoodsManager *)sharedGoodsManager;

-(void)addGoods:(GoodsItem *)item;
-(void)removeGoods:(GoodsItem *)item;
-(void)buyGoods:(GoodsItem *)item;

@end
