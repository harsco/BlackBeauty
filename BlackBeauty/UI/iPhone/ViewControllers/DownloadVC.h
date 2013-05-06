//
//  DownloadVC.h
//  BlackBeauty
//
//  Created by Mahi on 4/15/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "quartzcore/QuartzCore.h"

@interface DownloadVC : UIViewController
{
    IBOutlet UIView* downloadView;
}

@property(nonatomic,retain)IBOutlet UIView* downloadView;

-(IBAction)downloadClicked:(id)sender;

@end
