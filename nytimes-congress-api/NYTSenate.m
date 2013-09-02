//
//  Senate.m
//  nytimes-congress-api
//
//  Created by David Collins on 9/1/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "NYTSenate.h"
#import "nytimes_congress_api.h"
#import "NYTAPIRequest.h"

@interface NYTSenate ()

- (void) makeCall: (APIRequestSuccessCallback) onsuccess onerror: (APIRequestErrorCallback)onerror;

@end

@implementation NYTSenate

- (id) init
{
    self = [super init];
    [self makeCall: nil onError: nil];
    return self;
}

- (id) initWithCallbacksOnSuccess:(APIRequestSuccessCallback)onSuccess onError:(APIRequestErrorCallback) onError
{
    self = [super init];
    [self makeCall: onSuccess onError: onError];
    return self;
}

// http://api.nytimes.com/svc/politics/v3/us/legislative/congress/113/senate/members.json?api-key=430d5cc18be42a10d8dd643a0508efea:12:66347810
- (void) makeCall: (APIRequestSuccessCallback) onSuccess
          onError: (APIRequestErrorCallback) onError {

    // gotta be a better way to do this
    NSString *url = API_BASE_URL;
    url = [url stringByAppendingString:CONGRESS_API_VERSION];
    url = [url stringByAppendingString:@"us/legislative/congress/"];
    url = [url stringByAppendingString:CURRENT_CONGRESS];
    url = [url stringByAppendingString:@"senate/"];
    url = [url stringByAppendingString:@"members.json?api-key="];
    url = [url stringByAppendingString:API_KEY];

    [NYTAPIRequest asyncRequest:url
                         params:nil
                      onsuccess:^(NSURLResponse* response, NSData* urlData) {
                          
                          NSError *jsonParsingError = nil;
                          NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:urlData options:0 error:&jsonParsingError];
                          
                          if (jsonParsingError) {
                              NSLog(@"JSON ERROR: %@", [jsonParsingError localizedDescription]);
                          } else {
                              NSDictionary *results = [dict objectForKey:@"results"][0];
                              NSDictionary *members = [results objectForKey:@"members"];
                              for (NSDictionary * senator in members) {
                                  NYTMember * member = [[NYTMember alloc] init];
                                  [member setFirstName:[senator objectForKey:@"last_name"]];
                                  [self addMember:member];
                              }
                          }

                          if (onSuccess != nil) {
                              onSuccess(response, urlData);
                          }
                      }
                        onerror:^(NSURLResponse* response, NSError *error) {
                            if (onError != nil) {
                                onError(response, error);
                            }
                        }];
    
}

- (void) addMember: (NYTMember*) member
{
    
}

@end
