//
//  HomeScreenVC.h
//  BlackBeauty
//
//  Created by Mahi on 4/30/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppStorage.h"
#import "LocationManager.h"
#import "testLocationResultsVC.h"
#import "ContactUs.h"
#import "DownloadVC.h"

@interface HomeScreenVC : UIViewController
{
    
}

-(IBAction)onFindBBToolClicked:(id)sender;
-(IBAction)onContactUsClicked:(id)sender;
-(IBAction)onDownloadSpecSheetClicked:(id)sender;

@end
