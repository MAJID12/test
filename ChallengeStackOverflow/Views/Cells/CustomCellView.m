//
//  CustomCellView.m
//  ChallengeStackOverflow
//
//  Created by CHAIBI  on 28/02/2016.
//  Copyright (c) 2016 CHAIBI . All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "CustomCellView.h"

#pragma mark - Types

#pragma mark - Defines & Constants

#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface

@interface CustomCellView ()

#pragma mark - Private Properties
@property (nonatomic, weak)IBOutlet UILabel* titleLabel;
@property (nonatomic, weak)IBOutlet UIImageView* profileView;

@end

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation CustomCellView

#pragma mark - Setup & Teardown


#pragma mark - Superclass Overrides

-(void)drawRect:(CGRect)rect
{
    
}

-(void)layoutSubviews
{
    
}

#pragma mark - Public methods
- (void)setupWithTitle:(NSString*)title imageUrl:(NSString*)imageUrl
{
    self.titleLabel.text = title;
    
}
#pragma mark - Private methods

#pragma mark - XXXDataSource / XXXDelegate methods

@end
