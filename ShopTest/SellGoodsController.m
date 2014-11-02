//
//  SecondViewController.m
//  TestTask
//
//  Created by admin on 01.11.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "SellGoodsController.h"
#import "GoodsManager.h"
#import "CteateGoodsViewController.h"

@interface SellGoodsController ()

@end

@implementation SellGoodsController

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
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [GoodsManager sharedGoodsManager].goods.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *buy_goods_identifyer = @"GoodsCellView";
    GoodsItem *item = [[GoodsManager sharedGoodsManager].goods objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:buy_goods_identifyer];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] init];
    }
    
    cell.textLabel.text = item.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove the row from data model
    GoodsItem *item = [[GoodsManager sharedGoodsManager].goods objectAtIndex:indexPath.row];
    [[GoodsManager sharedGoodsManager] removeGoods:item];
}

@end
