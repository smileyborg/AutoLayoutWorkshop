//
//  INTUFirstView.m
//  AutoLayoutWorkshop
//
//  Created by Fox, Tyler on 5/6/14.
//  Copyright (c) 2014 Intuit Inc. All rights reserved.
//

#import "INTUFirstView.h"

@interface INTUFirstView ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *amountLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIView *redImageView;

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation INTUFirstView

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
    self.nameLabel = [UILabel newAutoLayoutView];
    self.nameLabel.font = [UIFont boldSystemFontOfSize:17.0];
    self.nameLabel.text = @"Name";
    [self addSubview:self.nameLabel];
    
    self.amountLabel = [UILabel newAutoLayoutView];
    self.amountLabel.font = [UIFont systemFontOfSize:20.0];
    self.amountLabel.text = @"$123.45";
    [self addSubview:self.amountLabel];
    
    self.descriptionLabel = [UILabel newAutoLayoutView];
    self.descriptionLabel.font = [UIFont systemFontOfSize:17.0];
    self.descriptionLabel.text = @"Description";
    [self addSubview:self.descriptionLabel];
    
    self.dateLabel = [UILabel newAutoLayoutView];
    self.dateLabel.font = [UIFont italicSystemFontOfSize:14.0];
    self.dateLabel.text = @"12/31/2014";
    [self addSubview:self.dateLabel];
    
    self.redImageView = [UIView newAutoLayoutView];
    self.redImageView.backgroundColor = [UIColor redColor];
    [self addSubview:self.redImageView];
}

- (void)updateConstraints
{
    [super updateConstraints];
    
    if (!self.didSetupConstraints) {
        [self.redImageView autoSetDimensionsToSize:CGSizeMake(38.0, 38.0)];
        
        [self setupConstraints];
        
        self.didSetupConstraints = YES;
    }
}

- (void)setupConstraints
{
    /** TODO: ADD CONSTRAINTS HERE **/
    
}

@end
