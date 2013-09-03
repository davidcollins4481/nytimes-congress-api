//
//  NYTChamber.h
//  nytimes-congress-api
//
//  Created by David Collins on 9/2/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NYTMember.h"
#import "NYTAPIRequest.h"
#import "nytimes_congress_api.h"

@interface NYTChamber : NSObject

@property (nonatomic, strong) NSMutableArray* members;

- (id) initWithCallbacksOnSuccess: (APIRequestSuccessCallback) onSuccess
                          onError:(APIRequestErrorCallback) onError;

- (NSMutableArray*) getMembers;
- (void) addMember: (NYTMember *) member;

@end
