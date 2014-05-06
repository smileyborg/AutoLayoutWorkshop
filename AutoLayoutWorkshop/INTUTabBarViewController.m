//
//  INTUTabBarViewController.m
//  AutoLayoutWorkshop
//
//  Created by Fox, Tyler on 5/6/14.
//  Copyright (c) 2014 Intuit Inc. All rights reserved.
//

#import "INTUTabBarViewController.h"
#import "INTUFirstViewController.h"
#import "INTUSecondViewController.h"

@interface INTUTabBarViewController ()

@end

@implementation INTUTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewControllers = @[[[INTUFirstViewController alloc] init],
                             [[INTUSecondViewController alloc] init]];
    self.selectedIndex = 0;
}

@end
