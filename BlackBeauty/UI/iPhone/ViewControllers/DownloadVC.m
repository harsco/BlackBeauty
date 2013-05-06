//
//  DownloadVC.m
//  BlackBeauty
//
//  Created by Mahi on 4/15/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "DownloadVC.h"

@interface DownloadVC ()

@end

@implementation DownloadVC
@synthesize downloadView;

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
    // Do any additional setup after loading the view from its nib.
    
    [self.downloadView.layer setMasksToBounds:YES];           //mask the extra area
    [self.downloadView.layer setCornerRadius:10.0];
    // [self.lineTable.layer setBorderColor:[[UIColor cyanColor] CGColor]];
    [self.downloadView.layer setBorderColor:[[UIColor orangeColor] CGColor]];
    [self.downloadView.layer setBorderWidth:1.0];
    
    self.title = @"Downloads";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)downloadClicked:(id)sender
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Download" message:@"Ability To Download Will Be Added Soon" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    [alert release];
}

@end
