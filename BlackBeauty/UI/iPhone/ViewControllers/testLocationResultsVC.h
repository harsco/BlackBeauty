//
//  testLocationResultsVC.h
//  BlackBeauty
//
//  Created by Mahi on 5/2/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationManager.h"
#import "AppStorage.h"
#import "addressCell.h"
#import "addressViewCell.h"
#import "AppleMapsViewController.h"

@interface testLocationResultsVC : UIViewController<UITableViewDataSource,UITableViewDelegate,locationProtocol,UISearchBarDelegate>
{
    IBOutlet UITableView* locationResultsTable;
    IBOutlet UISearchBar* locationsSearchBar;
    
    UIAlertView* fetchingResultsAlert;
    
    NSMutableArray* locationsDetails;
    NSArray* locations;
    
    LocationManager* locManagerObj;
    
    int userInput;
}

@property(nonatomic,retain)IBOutlet UISearchBar* locationsSearchBar;


-(id)initWithUserPreference:(USERPREFERENCE)userPreference;
-(void)getResellersNearThePlace:(NSString*)place;

@end
