//
//  GoodDetailViewController.m
//  TestTask
//
//  Created by admin on 01.11.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "GoodDetailViewController.h"
#import "GoodsManager.h"


@interface GoodDetailViewController ()

@end

@implementation GoodDetailViewController

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
    
    [self updateView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView) name:@"saveGoods" object:nil];
}

-(void)updateView
{
    self.nameLabel.text = self.goodsItem.name;
    self.shortTextLabel.text = self.goodsItem.text;
    self.priceLabel.text = [NSString stringWithFormat:@"$ %0.2f",  self.goodsItem.price];
    self.countLabel.text = (self.goodsItem.count > 0) ? [NSString stringWithFormat:@"%d", self.goodsItem.count] : @"нет в наличии";
    
    self.buyButton.enabled = (self.goodsItem.count > 0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareGoodsItem:(id)sender {
    self.logoImage.hidden = false;
    self.buyButton.hidden = true;
    self.shareButton.hidden = true;
    
    NSData *data = [self createPDFfromUIView:self.view saveToDocumentsWithFileName:@"test.pdf"];
    [self sendEmailWithData:data];
    
    self.logoImage.hidden = true;
    self.buyButton.hidden = false;
    self.shareButton.hidden = false;
}

- (IBAction)buyGoodsItem:(id)sender {
    [[GoodsManager sharedGoodsManager] performSelector:@selector(buyGoods:) withObject:self.goodsItem afterDelay:3];
//  [self.navigationController popToRootViewControllerAnimated:YES];
    self.buyButton.enabled = false;
}

-(NSData *)createPDFfromUIView:(UIView*)aView saveToDocumentsWithFileName:(NSString*)aFilename
{
    // Creates a mutable data object for updating with binary data, like a byte array
    NSMutableData *pdfData = [NSMutableData data];
    
    // Points the pdf converter to the mutable data object and to the UIView to be converted
    UIGraphicsBeginPDFContextToData(pdfData, aView.bounds, nil);
    UIGraphicsBeginPDFPage();
    CGContextRef pdfContext = UIGraphicsGetCurrentContext();
    
    // draws rect to the view and thus this is captured by UIGraphicsBeginPDFContextToData
    
    [aView.layer renderInContext:pdfContext];
    
    // remove PDF rendering context
    UIGraphicsEndPDFContext();
    
    // Retrieves the document directories from the iOS device
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:aFilename];
    
    // instructs the mutable data object to write its context to a file on disk
    [pdfData writeToFile:documentDirectoryFilename atomically:YES];
    NSLog(@"documentDirectoryFileName: %@",documentDirectoryFilename);
    
    return pdfData;
}

-(void)sendEmailWithData:(NSData *)data_
{
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setSubject:@"Очень хороший товар"];
    [controller addAttachmentData:data_ mimeType:@"application/pdf" fileName:@"goods.pdf"];
    
    [controller setMessageBody:@"Посмотри, мне понавился этот товар" isHTML:YES];
    if (controller) [self presentViewController:controller animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"Cообщение отправлено!");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
