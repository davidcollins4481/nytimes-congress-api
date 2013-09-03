//
//  NYTHouseOfRepresentatives.m
//  nytimes-congress-api
//
//  Created by David Collins on 9/2/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "NYTHouseOfRepresentatives.h"

@implementation NYTHouseOfRepresentatives

// TODO: Refactor this into NYTChamber.h
// http://api.nytimes.com/svc/politics/v3/us/legislative/congress/113/house/members.json?api-key=430d5cc18be42a10d8dd643a0508efea:12:66347810
- (void) makeCall: (APIRequestSuccessCallback) onSuccess
          onError: (APIRequestErrorCallback) onError {
    
    // gotta be a better way to do this
    NSString *url = API_BASE_URL;
    url = [url stringByAppendingString:CONGRESS_API_VERSION];
    url = [url stringByAppendingString:@"us/legislative/congress/"];
    url = [url stringByAppendingString:CURRENT_CONGRESS];
    url = [url stringByAppendingString:@"house/"];
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
                              NSDictionary *houseMembers = [results objectForKey:@"members"];
                              for (NSDictionary * rep in houseMembers) {
                                  NYTHouseRepresentative *member = [[NYTHouseRepresentative alloc] init];
                                  // NOTE: haven't decided on which properties will be standard
                                  // so setting these all individually for now
                                  [member setFirstName:[rep objectForKey:@"first_name"]];
                                  [member setMemberId:[rep objectForKey:@"id"]];
                                  [member setLastName:[rep objectForKey:@"last_name"]];
                                  [member setParty:[rep objectForKey:@"party"]];
                                  [member setState:[rep objectForKey:@"state"]];
                                  [member setDistrict:[rep objectForKey:@"district"]];
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
@end
