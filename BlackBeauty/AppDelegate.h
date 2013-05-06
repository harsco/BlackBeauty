//
//  AppDelegate.h
//  BlackBeauty
//
//  Created by Mahi on 4/10/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//

//App Delegate launches the landing page which is a tab bar controller. The tab bar is an external Nib (rootTab.xib) which has tab bar controller.


#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic)IBOutlet UITabBarController* rootTab;

@property (strong, nonatomic) ViewController *viewController;

@end
