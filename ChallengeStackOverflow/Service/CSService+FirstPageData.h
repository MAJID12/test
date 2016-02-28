//
//  CSService+FirstPageData.h
//  ChallengeStackOverflow
//
//  Created by CHAIBI  on 28/02/2016.
//  Copyright (c) 2016 CHAIBI . All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "CSService.h"


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface

@interface CSService (FirstPageData)

#pragma mark - Class Methods

#pragma mark - Instance Methods
- (void)fetchFirstPageDataWithSuccesCompletion:(CSServiceSuccessCompletion)succes
                              failureCompltion:(CSServiceFailureCompletion)failure;

@end
