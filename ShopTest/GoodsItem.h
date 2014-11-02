//
//  GoodsItem.h
//  TestTask
//
//  Created by admin on 01.11.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsItem : NSObject<NSCoding>

@property (nonatomic, retain)NSString *name;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, assign) float price;
@property (nonatomic, assign) int count;

@end
