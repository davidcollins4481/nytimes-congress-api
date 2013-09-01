//
//  APIRequest.h
//  nytimes-congress-api
//
//  Created by David Collins on 8/31/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NYTimesAPIRequest : NSObject

/* Not sure if these will actually go here */
typedef void(^APIRequestSuccessCallback)(NSURLResponse* response, NSData *data);
typedef void(^APIRequestErrorCallback)(NSURLResponse* response, NSError *error);

+ (void) asyncRequest:(NSString*) url
              params:(NSDictionary*) params
           onsuccess:(APIRequestSuccessCallback) onsuccess
             onerror:(APIRequestErrorCallback) onerror;

@end
