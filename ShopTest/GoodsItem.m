//
//  GoodsItem.m
//  TestTask
//
//  Created by admin on 01.11.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "GoodsItem.h"

@implementation GoodsItem

-(void)dealloc
{
    self.name = nil;
    self.text = nil;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {

        self.name = [decoder decodeObjectForKey:@"name"];
        self.text = [decoder decodeObjectForKey:@"text"];
        self.price = [[decoder decodeObjectForKey:@"price"] floatValue];
        self.count = [[decoder decodeObjectForKey:@"count"] intValue];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {

    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.text forKey:@"text"];
    [encoder encodeObject:[NSNumber numberWithFloat:self.price] forKey:@"price"];
    [encoder encodeObject:[NSNumber numberWithInt:self.count] forKey:@"count"];
}

@end
