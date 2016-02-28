//
//  CSService+FirstPageData.m
//  ChallengeStackOverflow
//
//  Created by CHAIBI  on 28/02/2016.
//  Copyright (c) 2016 CHAIBI . All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "CSService+FirstPageData.h"
#import "StackOverflowUser.h"

NSString *const CSServiceFirstPagePath = @"2.2/users?site=stackoverflow";

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation CSService (FirstPageData)

#pragma mark - Public methods

- (void)fetchFirstPageDataWithSuccesCompletion:(CSServiceSuccessCompletion)succes
                              failureCompltion:(CSServiceFailureCompletion)failure
        
{
    NSString *string      = [NSString stringWithFormat:@"%@%@", self.baseURL,CSServiceFirstPagePath];
    NSURL *url            = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        if (error) {
            failure(error);
        } else {
            
            succes([self parseStackOverFlowUsers:responseObject]);
        }
    }];
    [dataTask resume];
}


- (NSArray*)parseStackOverFlowUsers:(NSDictionary*)json
{
    NSMutableArray *usersList = [NSMutableArray new];
    NSArray *items = [json objectForKey:@"items"];
    
    [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *userObj = obj;
        StackOverflowUser *user = [StackOverflowUser new];
        user.lastUserName = userObj[@"display_name"];
        user.badges = userObj[@"badge_counts"];
        user.gravatarUrl = userObj[@"profile_image"];
        
        [usersList addObject:user];
    }];
    
    return usersList;
    
}

#pragma mark - Private methods

@end
