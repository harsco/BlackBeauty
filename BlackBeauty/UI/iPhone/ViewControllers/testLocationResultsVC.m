//
//  testLocationResultsVC.m
//  BlackBeauty
//
//  Created by Mahi on 5/2/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "testLocationResultsVC.h"


@interface testLocationResultsVC ()

@end

@implementation testLocationResultsVC
@synthesize locationsSearchBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithUserPreference:(USERPREFERENCE)userPreference
{
    if(self = [super init])
    {
        userInput = userPreference;
    }
    
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //locationsDetails = [[NSArray alloc] initWithObjects:@"Apple",@"Orange",@"Kiwi", nil];
    locations = [[NSArray alloc] initWithObjects:@"hyd",@"BLR",@"DEL",@"MUM", nil];
    
    locManagerObj = [[LocationManager alloc] init];
    locManagerObj.delegate = self;
    
        
    
    if(userInput == MyLocation)
    {
       
        fetchingResultsAlert = [[UIAlertView alloc] initWithTitle:@"Fetching Locations" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
        
        UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc]
                                            initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        loading.frame=CGRectMake(125, 50, 36, 36);
        [loading startAnimating];
        [fetchingResultsAlert addSubview:loading];
        
        [loading release];
        
        [fetchingResultsAlert show];

        [locManagerObj getResellersNearMYLocation];
    }
    else if(userInput == OtherLocation)
    {
        
    }

    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [locationsDetails release];
    locationResultsTable = nil;
    locationsSearchBar = nil;
}

-(void)viewDidUnload
{
    [super viewDidUnload];
   [locationsDetails release];
    locationResultsTable = nil;
    locationsSearchBar = nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [locationsDetails count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	// NSString *MyIdentifier = [NSString stringWithFormat:@"MyIdentifier %i", i];
   // i++;
    
    NSString *MyIdentifier = @"";//[NSString stringWithFormat:@"MyIdentifier"];
    
    if(indexPath.section == 0)
    {
        MyIdentifier = @"cell1";
        
    }
    else if(indexPath.section == 1)
    {
        MyIdentifier = @"cell2";
    }
    else if(indexPath.section == 2)
    {
        MyIdentifier = @"cell3";
    }
    else if(indexPath.section == 3)
    {
        MyIdentifier = @"cell4";
    }
    else if(indexPath.section == 4)
    {
        MyIdentifier = @"cell5";
    }
    else if(indexPath.section == 5)
    {
        MyIdentifier = @"cell6";
    }
    
    //UITableViewCell *cell;
    
    if(indexPath.row == 0)
    {
        
         //NSLog(@"section and row is %d     %d",indexPath.section,indexPath.row);
        addressCell* cell1 = nil;// = (addressCell*)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell1 == nil) {
            // Load the top-level objects from the custom cell XIB.
            //NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Default_TableCell" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            //  cell = [topLevelObjects objectAtIndex:0];
            
           
                
                NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"addressCell" owner:self options:nil];
                cell1 = [topLevelObjects objectAtIndex:0];
                cell1.addressLabel.text = [[locationsDetails objectAtIndex:indexPath.section] name];
            
            
           // cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] autorelease];
            //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            //cell.accessoryView = nil;
        }
        
        return cell1;

    }
    
    else if (indexPath.row == 3)
    {
        //NSLog(@"section and row is %d     %d",indexPath.section,indexPath.row);
        addressCell* cell1 = nil;// = (addressCell*)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell1 == nil) {
            // Load the top-level objects from the custom cell XIB.
            //NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Default_TableCell" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            //  cell = [topLevelObjects objectAtIndex:0];
            
            
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"addressCell" owner:self options:nil];
            cell1 = [topLevelObjects objectAtIndex:0];
            cell1.addressLabel.text = [NSString stringWithFormat:@"%f miles",[[locationsDetails objectAtIndex:indexPath.section] distanceFromInterestedLocation]];
            
            
            [cell1.showMapButton setHidden:NO];
            
            [cell1.showMapButton setTag:indexPath.section ];
            
            [cell1.showMapButton addTarget:self action:@selector(onShowMapClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            // cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] autorelease];
            //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            //cell.accessoryView = nil;
        }
        
        return cell1;
    }
    else if (indexPath.row == 1)
    {
        //NSLog(@"section and row is %d     %d",indexPath.section,indexPath.row);
        addressViewCell* cell1 = nil;// = (addressCell*)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell1 == nil) {
            // Load the top-level objects from the custom cell XIB.
            //NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Default_TableCell" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            //  cell = [topLevelObjects objectAtIndex:0];
            
            
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"addressViewCell" owner:self options:nil];
            cell1 = [topLevelObjects objectAtIndex:0];
            cell1.addressViewLabel.text = [(Location*)[locationsDetails objectAtIndex:indexPath.section] address];
            //cell1.backgroundColor = [UIColor whiteColor];
            
            
            // cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] autorelease];
            //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            //cell.accessoryView = nil;
        }
        
        return cell1;
    }

    
    else
    {
        //NSLog(@"section and row is %d     %d",indexPath.section,indexPath.row);
        
        addressViewCell* cell1 = nil;// = (addressCell*)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell1 == nil) {
            // Load the top-level objects from the custom cell XIB.
            //NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Default_TableCell" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            //  cell = [topLevelObjects objectAtIndex:0];
            
            
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"addressViewCell" owner:self options:nil];
            cell1 = [topLevelObjects objectAtIndex:0];
            cell1.addressViewLabel.text = [[(Location*)[locationsDetails objectAtIndex:indexPath.section] telephone] stringByReplacingOccurrencesOfString:@" " withString:@""];
        }
        
            return cell1;
            
    }
    
	
    
    return nil;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    NSLog(@"section is %d",indexPath.section);
//    NSLog(@"array is %f",[[locationsDetails objectAtIndex:indexPath.section] Latitude]);
//    
//    AppleMapsViewController* mapview = [[AppleMapsViewController alloc] initWithLocation:[locationsDetails objectAtIndex:indexPath.section]];
//    
//    [self presentModalViewController:mapview animated:YES];
//    
//    [mapview release];
    
    
}


-(void)onShowMapClicked:(UIButton*)sender
{
    AppleMapsViewController* mapview = [[AppleMapsViewController alloc] initWithLocation:[locationsDetails objectAtIndex:sender.tag]];
    
    [self presentModalViewController:mapview animated:YES];
    
    [mapview release];
}

#pragma mark Search Bar Delegate

//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
//{
//    NSLog(@"text is %@",searchText);
//}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
{
   // NSLog(@"text is %@",searchBar.text);
    
    [searchBar resignFirstResponder];
    fetchingResultsAlert = [[UIAlertView alloc] initWithTitle:@"Fetching Locations" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc]
                                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    loading.frame=CGRectMake(125, 50, 36, 36);
    [loading startAnimating];
    [fetchingResultsAlert addSubview:loading];
    
    [loading release];
    
    [fetchingResultsAlert show];
    
   
    [locManagerObj getResellersNearThePlace:searchBar.text];
    
}

#pragma mark Protocol Callbacks
-(void)didGetLocationOfUser:(Location *)locationDictionary
{
    [fetchingResultsAlert dismissWithClickedButtonIndex:0 animated:YES];
    
    //[fetchingResultsAlert release];
    
     locationsDetails = [[[AppStorage getInstance] getResellersNearMe:locationDictionary] retain];
    
    //NSLog(@"count is %d",[locationsDetails count]);
    
    [locationResultsTable reloadData];
}

-(void)didFailToGetLocationOfUser:(NSString *)error
{
    //Log errors
    [fetchingResultsAlert dismissWithClickedButtonIndex:0 animated:YES];
    
    UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:@"Error!!!" message:error delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [errorAlert show];
    [errorAlert release];
}

-(void)didGetDesiredLocations:(NSMutableArray*)desiredLocationsArray
{
   // NSLog(@"count is %d",[desiredLocationsArray count]);
    [fetchingResultsAlert dismissWithClickedButtonIndex:0 animated:YES];
    
    locationsDetails = [desiredLocationsArray retain];
    
    [locationResultsTable reloadData];
}

@end
