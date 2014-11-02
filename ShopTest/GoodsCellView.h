//
//  GoodsCellView.h
//  TestTask
//
//  Created by admin on 01.11.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsCellView : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *shortTextLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@end
