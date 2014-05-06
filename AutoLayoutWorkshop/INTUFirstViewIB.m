//
//  INTUFirstViewIB.m
//  AutoLayoutWorkshop
//
//  Created by Fox, Tyler on 5/6/14.
//  Copyright (c) 2014 Intuit Inc. All rights reserved.
//

#import "INTUFirstViewIB.h"

@interface INTUFirstViewIB ()

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *amountLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UIView *redImageView;

@end

@implementation INTUFirstViewIB

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    
}

@end
