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

@interface testLocationResultsVC : UIViewController<UITableViewDataSource,UITableViewDelegate,locationProtocol>
{
    IBOutlet UITableView* locationResultsTable;
    
    UIAlertView* fetchingResultsAlert;
    
    NSMutableArray* locationsDetails;
    NSArray* locations;
}

@end
