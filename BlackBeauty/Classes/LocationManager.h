//
//  LocationManager.h
//  BlackBeauty
//
//  Created by Mahi on 4/30/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//Class which deals with all location related things like Geocoding,reverse Geo Coding interacting with Core Location etc..

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBookUI/AddressBookUI.h>
#import "Location.h"
#import "AppStorage.h"


@protocol locationProtocol ;


@interface LocationManager : NSObject<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    id <locationProtocol> delegate;
    
    Location* locationDesired;
}

@property (nonatomic, retain) CLLocationManager *locationManager;
@property(nonatomic,retain)id<locationProtocol>delegate;


-(void)getResellersNearMYLocation;
-(void)getResellersNearThePlace:(NSString*)place;
-(void)doForwardGeoCodingOfPlace:(NSString*)place;

@end


@protocol locationProtocol <NSObject>

-(void)didGetLocationOfUser:(Location*)locationDictionary;
-(void)didFailToGetLocationOfUser:(NSString*)error;
-(void)didGetDesiredLocations:(NSMutableArray*)desiredLocationsArray;

@end