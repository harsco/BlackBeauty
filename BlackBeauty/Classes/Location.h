//
//  Location.h
//  BlackBeauty
//
//  Created by Mahi on 5/2/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//Class which represents a Location which could be widely used across the app
//Instances might some time not have all the details except needed for the context

#import <Foundation/Foundation.h>

@interface Location : NSObject
{
    double Latitude;
    double Longitude;
    NSString* name;
    NSString* address;
    NSString* telephone;
    NSString* email;
    NSString* webSite;
    double distanceFromInterestedLocation;
}


@property(nonatomic)double Latitude;
@property(nonatomic)double Longitude;
@property(nonatomic,retain) NSString* name;
@property(nonatomic,retain) NSString* address;
@property(nonatomic,retain) NSString* telephone;
@property(nonatomic,retain) NSString* email;
@property(nonatomic,retain) NSString* webSite;
@property(nonatomic) double distanceFromInterestedLocation;
@end
