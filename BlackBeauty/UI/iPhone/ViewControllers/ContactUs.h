//
//  ContactUs.h
//  BlackBeauty
//
//  Created by Mahi on 4/12/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactUs : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView* contacts;
}

@property(nonatomic,retain)IBOutlet UITableView* contacts;

@end
