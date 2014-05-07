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
    /** SOLUTION BELOW **/
    
    static const CGFloat kTopBottomEdge = 10.0;
    static const CGFloat kLeftRightEdge = 20.0;
    static const CGFloat kPadding = 15.0;
    static const CGFloat kWidthMultiplier = 0.7;
    
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kLeftRightEdge];
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kTopBottomEdge relation:NSLayoutRelationGreaterThanOrEqual];
    
    [self.amountLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.nameLabel withOffset:kPadding relation:NSLayoutRelationGreaterThanOrEqual];
    [self.amountLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kTopBottomEdge];
    [self.amountLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kLeftRightEdge];
    [self.amountLabel autoAlignAxis:ALAxisBaseline toSameAxisOfView:self.nameLabel];
    [self.amountLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh + 1 forAxis:UILayoutConstraintAxisHorizontal];
    [self.amountLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self withMultiplier:kWidthMultiplier relation:NSLayoutRelationLessThanOrEqual];
    
    [self.redImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kLeftRightEdge];
    [self.redImageView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTopBottomEdge relation:NSLayoutRelationGreaterThanOrEqual];
    [self.redImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:kPadding];
    
    [self.descriptionLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.redImageView withOffset:kPadding];
    [self.descriptionLabel autoAlignAxis:ALAxisBaseline toSameAxisOfView:self.redImageView];
    [self.descriptionLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTopBottomEdge relation:NSLayoutRelationGreaterThanOrEqual];
    
    [self.dateLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kLeftRightEdge];
    [self.dateLabel autoAlignAxis:ALAxisBaseline toSameAxisOfView:self.descriptionLabel];
    [self.dateLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.descriptionLabel withOffset:kPadding relation:NSLayoutRelationGreaterThanOrEqual];
    [self.dateLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh + 1 forAxis:UILayoutConstraintAxisHorizontal];
    [self.dateLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self withMultiplier:kWidthMultiplier relation:NSLayoutRelationLessThanOrEqual];
    [self.dateLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTopBottomEdge relation:NSLayoutRelationGreaterThanOrEqual];
}

@end
