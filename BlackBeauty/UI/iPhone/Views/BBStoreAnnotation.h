//
//  BBStoreAnnotation.h
//  BlackBeauty
//
//  Created by Mahi on 5/10/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface BBStoreAnnotation : NSObject<MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
//    NSString* title;
//    NSString* subTitle;
}

@property(nonatomic,readwrite)CLLocationCoordinate2D coordinate;
-(id)initWithLocation:(CLLocationCoordinate2D)location;
@property(nonatomic,retain)NSString* title;
@property(nonatomic,retain)NSString* subTitle;

@end
