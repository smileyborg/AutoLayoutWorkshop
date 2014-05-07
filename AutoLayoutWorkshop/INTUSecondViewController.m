//
//  INTUSecondViewController.m
//  AutoLayoutWorkshop
//
//  Created by Fox, Tyler on 5/6/14.
//  Copyright (c) 2014 Intuit Inc. All rights reserved.
//

#import "INTUSecondViewController.h"
#import "INTUSecondView.h"

@interface INTUSecondViewController ()

@end

@implementation INTUSecondViewController

- (UITabBarItem *)tabBarItem
{
    return [[UITabBarItem alloc] initWithTitle:@"2" image:[UIImage imageNamed:@"second"] selectedImage:nil];
}

- (void)viewDidLoad
{
    /** TODO: COMMENT OUT ONE OF THE BELOW LINES TO SWITCH BETWEEN CODE & NIB **/
    self.demoView = [INTUSecondView newAutoLayoutView]; // load view from code (red)
    self.demoView = [[[NSBundle mainBundle] loadNibNamed:@"INTUSecondViewIB" owner:nil options:nil] objectAtIndex:0]; // load view from nib (blue)
    
    
    [self.view addSubview:self.demoView];
    [self.view setNeedsUpdateConstraints]; // this fires up the Auto Layout engine
    
    [super viewDidLoad];
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    if (!self.didSetupConstraints) {
        
        self.widthConstraint = [self.demoView autoSetDimension:ALDimensionWidth toSize:300];
        self.heightConstraint = [self.demoView autoSetDimension:ALDimensionHeight toSize:300];
        [self.demoView autoCenterInSuperview];
        
        self.didSetupConstraints = YES;
    }
}

@end
