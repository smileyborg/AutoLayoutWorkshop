//
//  INTUDemoViewController.m
//  AutoLayoutWorkshop
//
//  Created by Fox, Tyler on 5/6/14.
//  Copyright (c) 2014 Intuit Inc. All rights reserved.
//

#import "INTUDemoViewController.h"

#define DEVICE_IS_IPHONE    ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

@interface INTUDemoViewController ()

@property (nonatomic, strong) UILabel *widthLabel;
@property (nonatomic, strong) UILabel *heightLabel;

@end

@implementation INTUDemoViewController

- (void)setupControls
{
    UISlider *widthSlider = [UISlider newAutoLayoutView];
    widthSlider.minimumValue = 10.0f;
    widthSlider.maximumValue = DEVICE_IS_IPHONE ? 500.0 : 1000.0;
    widthSlider.value = (widthSlider.minimumValue + widthSlider.maximumValue) * 0.5;
    [widthSlider addTarget:self action:@selector(widthSliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:widthSlider];
    [widthSlider autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(20.0, 80.0, 0, 20.0) excludingEdge:ALEdgeBottom];
    
    self.widthLabel = [UILabel newAutoLayoutView];
    [self.view addSubview:self.widthLabel];
    [widthSlider autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.widthLabel withOffset:10.0];
    [self.widthLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:widthSlider];
    
    UISlider *heightSlider = [UISlider newAutoLayoutView];
    heightSlider.minimumValue = 10.0f;
    heightSlider.maximumValue = DEVICE_IS_IPHONE ? 500.0 : 1000.0;
    heightSlider.value = (heightSlider.minimumValue + heightSlider.maximumValue) * 0.5;
    [heightSlider addTarget:self action:@selector(heightSliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:heightSlider];
    [heightSlider autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:widthSlider withOffset:0.0];
    [heightSlider autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:widthSlider];
    [heightSlider autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:widthSlider];
    
    self.heightLabel = [UILabel newAutoLayoutView];
    [self.view addSubview:self.heightLabel];
    [heightSlider autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.heightLabel withOffset:10.0];
    [self.heightLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:heightSlider];
    
    UIButton *sizeToFitButton = [UIButton newAutoLayoutView];
    [sizeToFitButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [sizeToFitButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [sizeToFitButton setTitle:@"Size to Fit" forState:UIControlStateNormal];
    [sizeToFitButton addTarget:self action:@selector(sizeToFit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sizeToFitButton];
    [sizeToFitButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:heightSlider];
    [sizeToFitButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:heightSlider];
}

- (void)widthSliderChanged:(UISlider *)sender
{
    self.widthConstraint.constant = round(sender.value);
    self.widthLabel.text = [NSString stringWithFormat:@"W: %lu", (unsigned long)self.widthConstraint.constant];
}

- (void)heightSliderChanged:(UISlider *)sender
{
    self.heightConstraint.constant = round(sender.value);
    self.heightLabel.text = [NSString stringWithFormat:@"H: %lu", (unsigned long)self.heightConstraint.constant];
}

- (void)sizeToFit:(UIButton *)sender
{
    [self.widthConstraint autoRemove];
    [self.heightConstraint autoRemove];
    CGSize fittingSize = [self.demoView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    self.widthConstraint.constant = fittingSize.width;
    self.heightConstraint.constant = fittingSize.height;
    [self.demoView addConstraint:self.widthConstraint];
    [self.demoView addConstraint:self.heightConstraint];
    self.widthLabel.text = [NSString stringWithFormat:@"W: %lu", (unsigned long)self.widthConstraint.constant];
    self.heightLabel.text = [NSString stringWithFormat:@"H: %lu", (unsigned long)self.heightConstraint.constant];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupControls];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
