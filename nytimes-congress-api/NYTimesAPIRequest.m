//
//  APIRequest.m
//  nytimes-congress-api
//
//  Created by David Collins on 8/31/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "NYTimesAPIRequest.h"

@implementation NYTimesAPIRequest

+ (void) asyncRequest: (NSString*) url
                   params:(NSDictionary *)params
                onsuccess:(APIRequestSuccessCallback)onsuccess
                  onerror:(APIRequestErrorCallback)onerror
{
    NSURL *apiUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:apiUrl];

    //NSString *s = @"asda";
    [NSURLConnection sendAsynchronousRequest:request
                             queue:[[NSOperationQueue alloc] init]//[NSOperationQueue mainQueue]
                 completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                     NSLog(@"wiwiiwiw");
                     if (error) {
                         // fire error handler
                         NSLog(@"error:%@", error.localizedDescription);
                         onerror(response, error);
                     } else {
                         // fire success handles
                         NSLog(@"SUCCESS");
                         onsuccess(response);
                     }
                 }];

}


@end
