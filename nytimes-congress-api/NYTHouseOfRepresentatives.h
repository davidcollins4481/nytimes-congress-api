//
//  NYTHouseOfRepresentatives.h
//  nytimes-congress-api
//
//  Created by David Collins on 9/2/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "NYTAPIRequest.h"
#import "NYTSenator.h"
#import "NYTChamber.h"

@interface NYTHouseOfRepresentatives : NYTChamber

- (id) initWithCallbacksOnSuccess: (APIRequestSuccessCallback) onSuccess
                          onError:(APIRequestErrorCallback) onError;

@end
