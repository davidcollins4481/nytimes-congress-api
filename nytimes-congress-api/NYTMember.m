//
//  Member.m
//  nytimes-congress-api
//
//  Created by David Collins on 9/1/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "NYTMember.h"

@implementation NYTMember

@synthesize votes = _votes;

@synthesize memberId;
@synthesize firstName;
@synthesize lastName;
@synthesize party;
@synthesize state;

- (id) init
{
    self = [super init];
    if (!_votes) {
        _votes = [[NSMutableArray alloc] initWithCapacity:150];
    }
    
    return self;
}

- (NSMutableArray*) getVotes
{
    return [self votes];
}

- (void) addVote:(NYTVote *)vote
{
    // TODO: put at end
    [[self getVotes] insertObject: vote atIndex:0];
}

- (void) syncVotes: (APIRequestSuccessCallback) onSuccess
          onError: (APIRequestErrorCallback) onError
{
    NSString *url = API_BASE_URL;
    url = [url stringByAppendingString:CONGRESS_API_VERSION];
    url = [url stringByAppendingString:@"us/legislative/congress/"];
    url = [url stringByAppendingString:@"members/"];
    url = [url stringByAppendingString:[self memberId]];
    url = [url stringByAppendingString:@"/votes.json?api-key="];
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
                              // set the number of members
                              NSDictionary *memberVotes = [results objectForKey:@"votes"];
                              for (NSDictionary *vote in memberVotes) {
                                  NYTVote *v = [[NYTVote alloc] init];
                                  [v setMemberId:[vote objectForKey:@"member_id"]];
                                  [v setDescription:[vote objectForKey:@"description"]];
                                  [v setPosition:[vote objectForKey: @"position"]];
                                  //NSLog(@"Bill description: %@", [vote objectForKey:@"description"]);
                                  [self addVote: v];
                              }
                                   
                              if (onSuccess != nil) {
                                  onSuccess(response, urlData);
                              }
                          }

                      }
                        onerror:^(NSURLResponse* response, NSError *error) {
                            if (onError != nil) {
                                onError(response, error);
                            }
                        }];

    
}

- (NSString*) nameString
{
    return [NSString stringWithFormat: @"%@, %@", [self lastName],[self firstName]];
}

@end
