//
//  Senate.h
//  nytimes-congress-api
//
//  Created by David Collins on 9/1/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NYTAPIRequest.h"
#import "NYTSenator.h"
#import "NYTChamber.h"

@interface NYTSenate : NYTChamber

- (id) initWithCallbacksOnSuccess: (APIRequestSuccessCallback) onSuccess
                         onError:(APIRequestErrorCallback) onError;

- (void) addMember: (NYTMember *) member;

@end
