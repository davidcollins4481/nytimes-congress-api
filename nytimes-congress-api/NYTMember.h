//
//  Member.h
//  nytimes-congress-api
//
//  Created by David Collins on 9/1/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NYTAPIRequest.h"
#import "nytimes_congress_api.h"
#import "NYTVote.h"

@interface NYTMember : NSObject

@property (nonatomic, strong) NSMutableArray* votes;
@property NSString* memberId;
@property NSString* firstName;
@property NSString* lastName;
@property NSString* party;
@property NSString* state;

- (NSString*) nameString;
- (void) syncVotes: (APIRequestSuccessCallback) onsuccess onError: (APIRequestErrorCallback) onerror;
- (void) addVote: (NYTVote*) vote;

@end
