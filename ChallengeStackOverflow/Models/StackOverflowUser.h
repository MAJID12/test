//
//  StackOverflowUser.h
//  ChallengeStackOverflow
//
//  Created by CHAIBI  on 28/02/2016.
//  Copyright (c) 2016 CHAIBI . All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import <Foundation/Foundation.h>

#pragma mark - Types

#pragma mark - Defines & Constants

#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface

@interface StackOverflowUser : NSObject

#pragma mark - Properties
@property (nonatomic, strong)NSString *lastUserName;
@property (nonatomic, strong)NSString *gravatarUrl;
@property (nonatomic, strong)NSDictionary *badges;

#pragma mark - Class Methods

#pragma mark - Instance Methods

@end
