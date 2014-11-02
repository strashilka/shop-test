//
//  GoodsCellView.m
//  TestTask
//
//  Created by admin on 01.11.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "GoodsCellView.h"

@implementation GoodsCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
