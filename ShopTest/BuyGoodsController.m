//
//  FirstViewController.m
//  TestTask
//
//  Created by admin on 01.11.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "BuyGoodsController.h"
#import "GoodsManager.h"
#import "GoodsCellView.h"
#import "GoodDetailViewController.h"

@interface BuyGoodsController ()

@end

@implementation BuyGoodsController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView) name:@"saveGoods" object:nil];
}

-(void)updateView
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [GoodsManager sharedGoodsManager].goods.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *buy_goods_identifyer = @"GoodsCellView";
    GoodsItem *item = [[GoodsManager sharedGoodsManager].goods objectAtIndex:indexPath.row];
    
    GoodsCellView *cell = [tableView dequeueReusableCellWithIdentifier:buy_goods_identifyer];
    if (!cell)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"GoodsCellView" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.nameLabel.text = item.name;
    cell.shortTextLabel.text = item.text;
    cell.priceLabel.text = [NSString stringWithFormat:@"$ %0.2f",  item.price];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetailGoodsItem"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        GoodDetailViewController *destViewController = segue.destinationViewController;
        destViewController.goodsItem = [[GoodsManager sharedGoodsManager].goods objectAtIndex:indexPath.row];
    }
}

@end
