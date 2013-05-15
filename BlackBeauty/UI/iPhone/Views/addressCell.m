//
//  addressCell.m
//  BlackBeauty
//
//  Created by Mahi on 5/3/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import "addressCell.h"

@implementation addressCell
@synthesize addressLabel,showMapButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
