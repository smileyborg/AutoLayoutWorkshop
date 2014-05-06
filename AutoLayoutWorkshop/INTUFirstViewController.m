//
//  INTUFirstViewController.m
//  AutoLayoutWorkshop
//
//  Created by Fox, Tyler on 5/6/14.
//  Copyright (c) 2014 Intuit Inc. All rights reserved.
//

#import "INTUFirstViewController.h"
#import "INTUFirstView.h"

@interface INTUFirstViewController ()

@property (nonatomic, strong) UIView *firstView;

@end

@implementation INTUFirstViewController

- (UITabBarItem *)tabBarItem
{
    return [[UITabBarItem alloc] initWithTitle:@"1" image:[UIImage imageNamed:@"first"] selectedImage:nil];
}

- (void)viewDidLoad
{
    /** TODO: COMMENT OUT ONE OF THE BELOW LINES TO SWITCH BETWEEN CODE & NIB **/
    self.firstView = [INTUFirstView newAutoLayoutView]; // load view from code (red)
    self.firstView = [[[NSBundle mainBundle] loadNibNamed:@"INTUFirstViewIB" owner:nil options:nil] objectAtIndex:0]; // load view from nib (blue)
    
    
    [self.view addSubview:self.firstView];
    [self.view setNeedsUpdateConstraints]; // this fires up the Auto Layout engine
    
    [super viewDidLoad];
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    if (!self.didSetupConstraints) {
        
        self.widthConstraint = [self.firstView autoSetDimension:ALDimensionWidth toSize:300];
        self.heightConstraint = [self.firstView autoSetDimension:ALDimensionHeight toSize:120];
        [self.firstView autoCenterInSuperview];
        
        self.didSetupConstraints = YES;
    }
}

@end
