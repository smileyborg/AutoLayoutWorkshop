//
//  INTUSecondView.m
//  AutoLayoutWorkshop
//
//  Created by Fox, Tyler on 5/6/14.
//  Copyright (c) 2014 Intuit Inc. All rights reserved.
//

#import "INTUSecondView.h"

@interface INTUSecondView ()

@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIView *yellowView;

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation INTUSecondView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHue:1 saturation:0.1 brightness:1 alpha:1];
        
        [self loadView];
    }
    return self;
}

- (void)loadView
{
    self.greenView = [UIView newAutoLayoutView];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self addSubview:self.greenView];
    
    self.textLabel = [UILabel newAutoLayoutView];
    self.textLabel.text = @"Very Long Single Line Of Text";
    [self addSubview:self.textLabel];
    
    self.yellowView = [UIView newAutoLayoutView];
    self.yellowView.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.yellowView];
}

- (void)updateConstraints
{
    [super updateConstraints];
    
    if (!self.didSetupConstraints) {
        [self setupConstraints];
        
        self.didSetupConstraints = YES;
    }
}

- (void)setupConstraints
{
    [self.greenView autoSetDimensionsToSize:CGSizeMake(112.0, 90.0)];
    [self.greenView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20.0];
    [self.greenView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20.0];
    
    [self.textLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.greenView];
    [self.textLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.greenView withOffset:20.0];
    [self autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.textLabel withOffset:20.0 relation:NSLayoutRelationGreaterThanOrEqual];
    
    [self.yellowView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.greenView withOffset:8.0];
    [self.yellowView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 20.0, 20.0, 20.0) excludingEdge:ALEdgeTop];
}

@end
