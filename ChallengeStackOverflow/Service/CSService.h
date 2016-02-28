//
//  CSService.h
//  ChallengeStackOverflow
//
//  Created by CHAIBI  on 28/02/2016.
//  Copyright (c) 2016 CHAIBI . All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

#pragma mark - Types

#pragma mark - Defines & Constants


typedef void(^CSServiceSuccessCompletion)(NSArray* users);
typedef void(^CSServiceFailureCompletion)(NSError* error);

#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface

@interface CSService : NSObject

#pragma mark - Properties

@property (nonatomic, strong) NSURL* baseURL;
@property (nonatomic, strong) AFURLSessionManager *manager;

/**
 The completion block that will be called after the operation end.
 */

#pragma mark - Class Methods

#pragma mark - Instance Methods
+ (void)fetchFirstPageDataWithSuccesCompletion:(CSServiceSuccessCompletion)succes
                              failureCompltion:(CSServiceFailureCompletion)failure;
@end
