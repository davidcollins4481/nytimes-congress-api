//
//  APIRequest.m
//  nytimes-congress-api
//
//  Created by David Collins on 8/31/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "NYTAPIRequest.h"

@implementation NYTAPIRequest

+ (void) asyncRequest: (NSString*) url
                   params:(NSDictionary *)params
                onsuccess:(APIRequestSuccessCallback)onsuccess
                  onerror:(APIRequestErrorCallback)onerror
{
    NSURL *apiUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:apiUrl];

    [NSURLConnection sendAsynchronousRequest:request
                             queue:[[NSOperationQueue alloc] init]//[NSOperationQueue mainQueue]
                 completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                     // TODO: better response handling. See:
                     // http://stackoverflow.com/questions/9270447/how-to-use-sendasynchronousrequestqueuecompletionhandler

                     NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                     NSInteger status = [httpResponse statusCode];

                     if (status == 200) {
                         // fire success handles
                         NSLog(@"success");
                         onsuccess(response, data);
                     } else {
                         NSLog(@"error:%@", error.localizedDescription);
                         onerror(response, error);
                     }
                 }];
}


@end
