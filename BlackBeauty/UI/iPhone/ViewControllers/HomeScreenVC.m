//
//  HomeScreenVC.m
//  BlackBeauty
//
//  Created by Mahi on 4/30/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "HomeScreenVC.h"

@interface HomeScreenVC ()

@end

@implementation HomeScreenVC

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
    
    //Configure the Navigation Header programatically
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationController.navigationItem.title = @"Black Beauty";
    self.title = @"Black Beauty";

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Button Action Methods

-(IBAction)onFindBBToolClicked:(id)sender
{
    //[[AppStorage getInstance] getAllLocations];
    
    testLocationResultsVC* testVC = [[testLocationResultsVC alloc] init];
    
    [self.navigationController pushViewController:testVC animated:YES];
    
    [testVC release];
    
}
-(IBAction)onContactUsClicked:(id)sender
{
    ContactUs* testContact = [[ContactUs alloc] init];
    
    [self.navigationController pushViewController:testContact animated:YES];
    
    [testContact release];
    
}
-(IBAction)onDownloadSpecSheetClicked:(id)sender
{
    DownloadVC* download = [[DownloadVC alloc] init];
    
    [self.navigationController pushViewController:download animated:YES];
    
    [download release];
}

@end
