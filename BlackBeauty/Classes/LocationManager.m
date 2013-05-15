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


-(void)getResellersNearMYLocation
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
        
    }
    else{
        
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        [locationManager startUpdatingLocation];
        
    }

}

-(void)getResellersNearThePlace:(NSString*)place
{
    [self doForwardGeoCodingOfPlace:place];
    
}


-(void)updateLocationsSetToUI
{
    if(delegate && [delegate respondsToSelector:@selector(didGetLocationOfUser:)])
    {
        [delegate didGetDesiredLocations:[[AppStorage getInstance] getResellersNearMe:locationDesired]];
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
        [delegate didGetDesiredLocations:[[AppStorage getInstance] getResellersNearMe:locationDesired]];
    }
    
//    if(delegate && [delegate respondsToSelector:@selector(didGetLocationOfUser:)])
//    {
//        [delegate didGetLocationOfUser:locationOfUser];
//    }
    
    [locationOfUser release];
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    if(delegate && [delegate respondsToSelector:@selector(didFailToGetLocationOfUser:)])
    {
        [delegate didFailToGetLocationOfUser:[error localizedDescription]];
    }
}

-(void)doForwardGeoCodingOfPlace:(NSString*)place
{
    CLGeocoder* geoCoder = [[CLGeocoder alloc] init];
    locationDesired = [[Location alloc] init];
    
  /*  NSDictionary *locationDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                        place, kABPersonAddressStateKey,
                                        @"United States", kABPersonAddressCountryKey,
                                        @"us", kABPersonAddressCountryCodeKey,

                                        nil];

    [geoCoder geocodeAddressDictionary:locationDictionary completionHandler:^(NSArray* placemarks, NSError* error){
        
        NSLog(@"Received placemarks: %@", placemarks);
        NSLog(@"error is %@",[error localizedDescription]);
        
        if(error)
        {
            NSLog(@"error is %@%d",[error localizedDescription],[error code]);
            
            NSString* errorString = @"";
            
            if([error code] == 8)
                errorString = @"Unable to Determine Locations Please check the address entered";
            else if ([error code] == kCLErrorNetwork)
                errorString = @"Please check Netwrork Connection";
            
            if(delegate && [delegate respondsToSelector:@selector(didFailToGetLocationOfUser:)])
            {
                [delegate didFailToGetLocationOfUser:errorString];
            }
        }
        
        else
        {
            for (CLPlacemark* aPlacemark in placemarks)
            {
                // Process the placemark.
                
                // NSLog(@"count is %d",[placemarks count]);
                CLPlacemark *placemark = [placemarks objectAtIndex:0];
                CLLocation *location = placemark.location;
                CLLocationCoordinate2D coordinate = location.coordinate;
                NSLog(@"%f%f", coordinate.latitude,coordinate.longitude);
                
                
                
                locationDesired.Latitude = coordinate.latitude;
                locationDesired.Longitude = coordinate.longitude;
                
                [self updateLocationsSetToUI];
                
            }
            
        }

        
    }];*/
    
    
    
    //NSLog(@"place is %@",[place stringByAppendingFormat:@"%@",@",United States"]);
    
    
   // [place stringByAppendingFormat:@"%@",@",United States"]
    
    
    [geoCoder geocodeAddressString:place
                 completionHandler:^(NSArray* placemarks, NSError* error){
                     
                     
                     NSLog(@"Received placemarks: %@", placemarks);
                     
                     if(error)
                     {
                          NSLog(@"error is %@%d",[error localizedDescription],[error code]);
                         
                         NSString* errorString = @"";
                         
                         if([error code] == 8)
                          errorString = @"Unable to Determine Locations Please check the address entered";
                         else if ([error code] == kCLErrorNetwork)
                              errorString = @"Please check Netwrork Connection";
                        
                         
                         if(delegate && [delegate respondsToSelector:@selector(didFailToGetLocationOfUser:)])
                         {
                             [delegate didFailToGetLocationOfUser:errorString];
                         }
                     }
                     
                     else
                     {
                         for (CLPlacemark* aPlacemark in placemarks)
                         {
                             // Process the placemark.
                             
                            // NSLog(@"count is %d",[placemarks count]);
                             CLPlacemark *placemark = [placemarks objectAtIndex:0];
                             CLLocation *location = placemark.location;
                             CLLocationCoordinate2D coordinate = location.coordinate;
                             NSLog(@"%f%f", coordinate.latitude,coordinate.longitude);
                             
                             
                             if((coordinate.latitude < 18.000 || coordinate.latitude > 48.987386) || (coordinate.longitude < -124.626080 || coordinate.longitude > -62.361014) )
                             {
                                 
                                 NSString* errorString = @"Please Select a location in US"; 
                                 if(delegate && [delegate respondsToSelector:@selector(didFailToGetLocationOfUser:)])
                                 {
                                     [delegate didFailToGetLocationOfUser:errorString];
                                 }
                             }
                             
                             else{
                                 
                                 locationDesired.Latitude = coordinate.latitude;
                                 locationDesired.Longitude = coordinate.longitude;
                                 
                                 [self updateLocationsSetToUI];

                                 
                             }
                             
                                                         
                         }
 
                     }
                     
                    }]; 
    
    
    
}

@end
