//
//  LocatorToolUserInputVC.h
//  BlackBeauty
//
//  Created by Mahi on 5/6/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "testLocationResultsVC.h"
#import "LocationManager.h"

@interface LocatorToolUserInputVC : UIViewController
{
    UIButton* byUserLocationButton;
    UIButton* byUserInputLocationButton;
    
}

@property(nonatomic,retain)IBOutlet UIButton* byUserLocationButton;
@property(nonatomic,retain)IBOutlet UIButton* byUserInputLocationButton;


-(IBAction)onUserLocationButtonClicked:(id)sender;
-(IBAction)onUserInputLocationClicked:(id)sender;

@end
