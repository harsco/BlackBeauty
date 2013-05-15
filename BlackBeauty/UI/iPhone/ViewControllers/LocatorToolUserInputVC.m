//
//  LocatorToolUserInputVC.m
//  BlackBeauty
//
//  Created by Mahi on 5/6/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "LocatorToolUserInputVC.h"

@interface LocatorToolUserInputVC ()

@end

@implementation LocatorToolUserInputVC

@synthesize byUserInputLocationButton,byUserLocationButton;

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
    
    
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    self.byUserInputLocationButton = nil;
    self.byUserLocationButton = nil;
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    RELEASE_TO_NIL(byUserLocationButton);
    RELEASE_TO_NIL(byUserInputLocationButton);
}

-(IBAction)onUserLocationButtonClicked:(id)sender
{
    //testLocationResultsVC* testVC = [[testLocationResultsVC alloc] init];
    
    testLocationResultsVC* testVC = [[testLocationResultsVC alloc] initWithUserPreference:MyLocation];
    [self.navigationController pushViewController:testVC animated:YES];
    
    [testVC release];
}
-(IBAction)onUserInputLocationClicked:(id)sender
{
//    LocationManager* loc = [[LocationManager alloc] init];
//    
//    [loc doForwardGeoCodingOfPlace:@"tx,75038"];
//    
//    NSLog(@"yes");
    
    testLocationResultsVC* testVC = [[testLocationResultsVC alloc] initWithUserPreference:OtherLocation];
    [self.navigationController pushViewController:testVC animated:YES];
    
    [testVC release];
}

@end
