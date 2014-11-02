//
//  CteateGoodsViewController.m
//  TestTask
//
//  Created by admin on 01.11.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "CteateGoodsViewController.h"
#import "GoodsItem.h"
#import "GoodsManager.h"

@interface CteateGoodsViewController ()

@end

@implementation CteateGoodsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameTextField.text = @"";
    self.textTextField.text = @"";
    self.priceTextField.text = @"";
    self.countTextField.text = @"";
    
    self.ErrorLabel.hidden = true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SaveGoodsItem:(id)sender {
    if ([self checkFillingFields])
    {
        GoodsItem *item = [[GoodsItem alloc] init];
        item.name = self.nameTextField.text;
        item.text = self.textTextField.text;
        item.count = [self.countTextField.text intValue];
        item.price = [self.priceTextField.text floatValue];
        
        [self performSelector:@selector(saveData:) withObject:item afterDelay:5];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else
    {
        [self showError];
    }
}

-(Boolean)checkFillingFields
{
    Boolean result = true;
    
    if ([self.nameTextField.text isEqualToString:@""])
    {
        result = false;
    }
    
    if ([self.priceTextField.text floatValue] <= 0) {
        result = false;
    }
    
    return result;
}

-(void)saveData:(id)item
{
    [[GoodsManager sharedGoodsManager] addGoods:item];
}

-(void)showError
{
    self.ErrorLabel.hidden = false;
    self.ErrorLabel.text = @"Ошибка: проверьте правильность заполнения данных";
    [self.ErrorLabel sizeToFit];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return YES;
}

@end
