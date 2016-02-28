//
//  CSService.m
//  ChallengeStackOverflow
//
//  Created by CHAIBI  on 28/02/2016.
//  Copyright (c) 2016 CHAIBI . All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "CSService.h"
#import "Constants.h"


#pragma mark - Types

#pragma mark - Defines & Constants

#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface

@interface CSService ()

#pragma mark - Private Properties


@end

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation CSService

#pragma mark - Setup & Teardown

static CSService * _sharedInstance = nil;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
        _sharedInstance.baseURL = [NSURL URLWithString:AZServiceConfigBaseURL];
        
    });
    return _sharedInstance;
}


-(id)init
{
    self = [super init];
    if (self)
    {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    return self;
}

#pragma mark - Superclass Overrides

#pragma mark - Public methods
+ (void)fetchFirstPageDataWithSuccesCompletion:(CSServiceSuccessCompletion)succes
                              failureCompltion:(CSServiceFailureCompletion)failure{
    [[self sharedInstance] fetchFirstPageDataWithSuccesCompletion:succes
                                                 failureCompltion:failure];
}
#pragma mark - Private methods

@end
