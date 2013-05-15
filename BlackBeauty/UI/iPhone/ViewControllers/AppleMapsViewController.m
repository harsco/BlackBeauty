//
//  AppleMapsViewController.m
//  BlackBeauty
//
//  Created by Mahi on 5/9/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "AppleMapsViewController.h"

@interface AppleMapsViewController ()

@end

@implementation AppleMapsViewController
@synthesize mapView,mapHeaderView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithLocation:(Location*)location
{
    if(self = [super init])
    {
        locationToBeShown = [location retain];
        NSLog(@"location coordinates are %f %f",locationToBeShown.Latitude,locationToBeShown.Longitude);
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIImage* image = [UIImage imageNamed:@"app_btn_back"];
    CGRect frameimg = CGRectMake(0, 0, image.size.width, image.size.height);
    
    UIButton *button = [[UIButton alloc] initWithFrame:frameimg];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onBackClick:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *backButton =[[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
    
    self.mapHeaderView.topItem.leftBarButtonItem = backButton;
    
    
//    CLLocationCoordinate2D coord = {.latitude =  locationToBeShown.Latitude, .longitude =  locationToBeShown.Longitude};
//    MKCoordinateSpan span = {.latitudeDelta =  0.2, .longitudeDelta =  0.2};
//    MKCoordinateRegion region = {coord, span};
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = locationToBeShown.Latitude;//37.786996;
    newRegion.center.longitude = locationToBeShown.Longitude;//-122.440100;
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    
    mapView.delegate = self;
    
    
   // [self prepareAnnotatinView];
    
    [self.mapView setRegion:newRegion animated:YES];
}

-(void)viewDidUnload
{
    [self.mapView setDelegate:nil];
    
    mapView = nil;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.mapView setDelegate:nil];
    
    mapView = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)onBackClick:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}


-(void)prepareAnnotatinView
{
    
//    
    CLLocationCoordinate2D tempCoordinate = CLLocationCoordinate2DMake(locationToBeShown.Latitude, locationToBeShown.Longitude);
//    
    //annotationView.coordinate = &(tempCoordinate);
    
    //[annotationView setCoordinate:&(tempCoordinate)];
    
    
    
    BBStoreAnnotation* annotationView = [[BBStoreAnnotation alloc] initWithLocation:tempCoordinate];
    
    annotationView.title = locationToBeShown.name;
    annotationView.subTitle = locationToBeShown.telephone;
    
    NSLog(@"telephone is %@",locationToBeShown.telephone);
//    
//    annotationView.title = locationToBeShown.name;
//    annotationView.subTitle = locationToBeShown.address;
    
   // NSArray* mapAnnotations = [NSArray arrayWithObject:annotationView];
    
    //[self.mapView removeAnnotations:self.mapView.annotations];  // remove any annotations that exist
    
    [mapView addAnnotation:annotationView];
    
    
}


#pragma mark Map View Delegates

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    [self prepareAnnotatinView];
}
- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error
{
    
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    static NSString *BridgeAnnotationIdentifier = @"bridgeAnnotationIdentifier";
    
    NSLog(@"annotation");
    
    MKPinAnnotationView *pinView =
    (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:BridgeAnnotationIdentifier];
    if (pinView == nil)
    {
        // if an existing pin view was not available, create one
        MKPinAnnotationView *customPinView = [[MKPinAnnotationView alloc]
                                              initWithAnnotation:annotation reuseIdentifier:BridgeAnnotationIdentifier];
        customPinView.pinColor = MKPinAnnotationColorPurple;
        customPinView.animatesDrop = YES;
        customPinView.canShowCallout = YES;
        
        // add a detail disclosure button to the callout which will open a new view controller page
        //
        // note: when the detail disclosure button is tapped, we respond to it via:
        //       calloutAccessoryControlTapped delegate method
        //
        // by using "calloutAccessoryControlTapped", it's a convenient way to find out which annotation was tapped
        //
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [rightButton addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
        customPinView.rightCalloutAccessoryView = rightButton;
        
        return customPinView;
    }
    
    else
    {
        pinView.annotation = annotation;
    }
    return pinView;
    
    

}

@end
