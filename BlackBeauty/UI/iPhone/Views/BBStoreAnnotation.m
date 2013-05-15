//
//  BBStoreAnnotation.m
//  BlackBeauty
//
//  Created by Mahi on 5/10/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "BBStoreAnnotation.h"

@implementation BBStoreAnnotation
@synthesize coordinate,title,subTitle;


//- (CLLocationCoordinate2D)coordinate;
//{
//    CLLocationCoordinate2D theCoordinate;
//    theCoordinate.latitude = 42.004169;
//    theCoordinate.longitude = -71.333328;
//    return theCoordinate;
//}

//- (CLLocationCoordinate2D)coordinate;
//{
//    CLLocationCoordinate2D theCoordinate;
//    theCoordinate.latitude = 37.810000;
//    theCoordinate.longitude = -122.477450;
//    return theCoordinate;
//}


-(id)initWithLocation:(CLLocationCoordinate2D)location
{
    self = [self init];
	
	if (self != nil) {
		
		self.coordinate = location;
        
		
		self.subTitle = @"Monitored Region";
	}
    
	return self;
}

//- (NSString *)title
//{
//    return @"San Francisco";
//}
//
//// optional
//- (NSString *)subtitle
//{
//    return @"Founded: June 29, 1776";
//}

@end
