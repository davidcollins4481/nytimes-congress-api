//
//  NYTChamber.m
//  nytimes-congress-api
//
//  Created by David Collins on 9/2/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "NYTChamber.h"
#import "NYTAPIRequest.h"

// private!!
@interface NYTChamber ()
- (void) makeCall: (APIRequestSuccessCallback) onsuccess onError: (APIRequestErrorCallback)onerror;
@end

@implementation NYTChamber

@synthesize members = _members;

- (id) init
{
    self = [super init];
    [self makeCall: nil onError: nil];
    return self;
}

- (id) initWithCallbacksOnSuccess:(APIRequestSuccessCallback)onSuccess onError:(APIRequestErrorCallback) onError
{
    self = [super init];
    if (!_members) {
        _members = [[NSMutableArray alloc] initWithCapacity:150];
    }
    [self makeCall: onSuccess onError: onError];
    return self;
}

- (NSMutableArray*) getMembers
{
    return [self members];
}

- (void) addMember:(NYTMember *)member
{
    NSMutableArray *members = [self getMembers];
    [members insertObject:member atIndex:[members count]];
}

- (NSMutableArray *) membersFromState: (NSString*) abbreviation
{
    NSMutableArray *stateMembers = [[NSMutableArray alloc] initWithCapacity:2];

    for (NYTMember *m in [self getMembers]) {
        if ([[m state] isEqualToString: abbreviation]) {
            [stateMembers insertObject:m atIndex:0];
        }
    }

    return stateMembers;
}

@end
