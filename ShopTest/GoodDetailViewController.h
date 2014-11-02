//
//  GoodDetailViewController.h
//  TestTask
//
//  Created by admin on 01.11.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsItem.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface GoodDetailViewController : UIViewController<MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) GoodsItem *goodsItem;

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *shortTextLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UILabel *countLabel;
@property (nonatomic, weak) IBOutlet UIButton *buyButton;
@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

- (IBAction)shareGoodsItem:(id)sender;
- (IBAction)buyGoodsItem:(id)sender;


@end
