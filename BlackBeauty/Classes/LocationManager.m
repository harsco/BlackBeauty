//
//  LocationManager.m
//  BlackBeauty
//
//  Created by Mahi on 4/30/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager
@synthesize locationManager;
@synthesize delegate;

-(void)getLocationCoordinates
{
    if([CLLocationManager locationServicesEnabled] == NO)
    {
        UIAlertView *servicesDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Location Services Disabled" message:@"You currently have all location services for this device disabled. If you proceed, you will be asked to confirm whether location services should be reenabled." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [servicesDisabledAlert show];
        [servicesDisabledAlert release];
        
        
        locationManager = [[CLLocationManager alloc] init];
        
        
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        [locationManager startUpdatingLocation];
        
//        CLLocation *location = [locationManager location];
//        
//        // Configure the new event with information from the location
//        CLLocationCoordinate2D coordinate = [location coordinate];
//        
//        NSString *latitude = [NSString stringWithFormat:@"%f", coordinate.latitude];
//        NSString *longitude = [NSString stringWithFormat:@"%f", coordinate.longitude];
//        
//        // NSLog(@"dLatitude : %@", latitude);
//        //NSLog(@"dLongitude : %@",longitude);
//        
//        NSMutableDictionary* locationDictionary = [[NSMutableDictionary alloc] init];
//        
//        [locationDictionary setValue:latitude forKey:@"latitude"];
//        [locationDictionary setValue:longitude forKey:@"longitude"];
//       // return locationDictionary;

    }
    else{
        
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        [locationManager startUpdatingLocation];
        
    }
    
    

}


-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    //Checking if the location info is recent and accurate
    //Then form a dict of location and throw it back using the protocol
       
     NSTimeInterval locationAge = -[newLocation.timestamp timeIntervalSinceNow];
    
    if (locationAge > 5.0) return;
    
    if (newLocation.horizontalAccuracy < 0) return;
    
    NSString *latitude = [NSString stringWithFormat:@"%f", newLocation.coordinate.latitude];
    NSString *longitude = [NSString stringWithFormat:@"%f", newLocation.coordinate.longitude];
    
    NSLog(@"dLatitude : %@", latitude);
    NSLog(@"dLongitude : %@",longitude);
    
    [locationManager stopUpdatingLocation];
    
    //NSMutableDictionary* locationDictionary = [[NSMutableDictionary alloc] init];
    
    Location* locationOfUser = [[Location alloc] init];
    
    locationOfUser.Latitude = newLocation.coordinate.latitude;
    locationOfUser.Longitude = newLocation.coordinate.longitude;

//    [locationDictionary setValue:latitude forKey:@"latitude"];
//    [locationDictionary setValue:longitude forKey:@"longitude"];
           // return locationDictionary;
    
    if(delegate && [delegate respondsToSelector:@selector(didGetLocationOfUser:)])
    {
        [delegate didGetLocationOfUser:locationOfUser];
    }
    
}

@end
