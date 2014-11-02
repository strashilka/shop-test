//
//  BuysViewController.m
//  TestTask
//
//  Created by admin on 01.11.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "HistoryViewController.h"
#import "GoodsManager.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)updateView
{
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView) name:@"saveGoods" object:nil];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [GoodsManager sharedGoodsManager].buys.count;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 80;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *buy_identifyer = @"buysCell";

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:buy_identifyer];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:buy_identifyer];
    }
    
    cell.textLabel.text = [[GoodsManager sharedGoodsManager].buys objectAtIndex:indexPath.row];
    
    return cell;
}

@end
