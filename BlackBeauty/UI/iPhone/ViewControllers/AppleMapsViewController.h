//
//  AppleMapsViewController.h
//  BlackBeauty
//
//  Created by Mahi on 5/9/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "BBStoreAnnotation.h"


@interface AppleMapsViewController : UIViewController<MKMapViewDelegate>
{
    IBOutlet MKMapView* mapView;
    IBOutlet UINavigationBar* mapHeaderView;
    
    Location* locationToBeShown;
}

@property(nonatomic,retain)IBOutlet MKMapView* mapView;
@property(nonatomic,retain)IBOutlet UINavigationBar* mapHeaderView;

-(id)initWithLocation:(Location*)location;

@end
