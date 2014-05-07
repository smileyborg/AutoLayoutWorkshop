//
//  INTUFirstViewController.m
//  AutoLayoutWorkshop
//
//  Created by Fox, Tyler on 5/6/14.
//  Copyright (c) 2014 Intuit Inc. All rights reserved.
//

/**
 Layout Spec for Exercise 1
 
 - All subviews near edges should remain exactly 20pt from sides of cell, 10pt from top/bottom of cell
 - All subviews should maintain at least 15pt padding between one another (horizontall & vertically)
 - Label frames should not be larger than their content; labels should not truncate unless necessary
 - Labels on the same "line" should have their text baseline aligned
 - The bottom of the red image view should be aligned with the baseline of the Description label
 - Name label should truncate before amount label if they run up against each other
 - Date label should never truncate
 - No label should exceed 70% of the overall width of the cell
 - If the cell is taller than required to fit the subviews, the extra vertical space should be allocated below the bottom-most subviews
 
 */

#import "INTUFirstViewController.h"
#import "INTUFirstView.h"

@interface INTUFirstViewController ()

@end

@implementation INTUFirstViewController

- (UITabBarItem *)tabBarItem
{
    return [[UITabBarItem alloc] initWithTitle:@"1" image:[UIImage imageNamed:@"first"] selectedImage:nil];
}

- (void)viewDidLoad
{
    /** TODO: COMMENT OUT ONE OF THE BELOW LINES TO SWITCH BETWEEN CODE & NIB **/
    self.demoView = [INTUFirstView newAutoLayoutView]; // load view from code (red)
    self.demoView = [[[NSBundle mainBundle] loadNibNamed:@"INTUFirstViewIB" owner:nil options:nil] objectAtIndex:0]; // load view from nib (blue)
    
    
    [self.view addSubview:self.demoView];
    [self.view setNeedsUpdateConstraints]; // this fires up the Auto Layout engine
    
    [super viewDidLoad];
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    if (!self.didSetupConstraints) {
        
        self.widthConstraint = [self.demoView autoSetDimension:ALDimensionWidth toSize:300];
        self.heightConstraint = [self.demoView autoSetDimension:ALDimensionHeight toSize:120];
        [self.demoView autoCenterInSuperview];
        
        self.didSetupConstraints = YES;
    }
}

@end
