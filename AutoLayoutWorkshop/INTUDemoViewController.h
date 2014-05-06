//
//  INTUDemoViewController.h
//  AutoLayoutWorkshop
//
//  Created by Fox, Tyler on 5/6/14.
//  Copyright (c) 2014 Intuit Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface INTUDemoViewController : UIViewController

@property (nonatomic, strong) NSLayoutConstraint *widthConstraint;
@property (nonatomic, strong) NSLayoutConstraint *heightConstraint;

@property (nonatomic, assign) BOOL didSetupConstraints;

- (void)widthSliderChanged:(UISlider *)sender;
- (void)heightSliderChanged:(UISlider *)sender;

@end
