//
//  addressCell.h
//  BlackBeauty
//
//  Created by Mahi on 5/3/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addressCell : UITableViewCell
{
    IBOutlet UILabel* addressLabel;
     UIButton* showMapButton;
}

@property(nonatomic,retain)IBOutlet UILabel* addressLabel;
@property(nonatomic,retain)IBOutlet UIButton* showMapButton;


@end
