//
//  nytimes_congress_apiTests.m
//  nytimes-congress-apiTests
//
//  Created by David Collins on 8/31/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SenTestingKit/SenTestingKit.h>

@interface nytimes_congress_apiTests : XCTestCase

@end


#import "NYTAPIRequest.h"
#import "nytimes_congress_api.h"

@implementation nytimes_congress_apiTests

- (void)setUp
{
    // Put setup code here. This method is called before the invocation of each test method in the class.

}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBasicAPIRequest
{
    dispatch_semaphore_t holdOn = dispatch_semaphore_create(0);
    NSString *url = @"http://api.nytimes.com/svc/politics/v3/us/legislative/congress/113/house/bills/passed.json?api-key=";
    url = [url stringByAppendingString:API_KEY];
    
    [NYTAPIRequest asyncRequest:url
                             params:nil
                          onsuccess:^(NSURLResponse* response, NSData* urlData) {
                              NSError *jsonParsingError = nil;

                              NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:urlData options:0 error:&jsonParsingError];

                              if (jsonParsingError) {
                                  NSLog(@"JSON ERROR: %@", [jsonParsingError localizedDescription]);
                              } else {
                                  NSString *status = [dict objectForKey:@"status"];
                                  XCTAssertTrue([status isEqualToString:(@"OK")], @"API call successful");
                              }
                              dispatch_semaphore_signal(holdOn);
                          }
                            onerror:^(NSURLResponse* response, NSError *error) {
                                XCTFail(@"API Request failed");
                                dispatch_semaphore_signal(holdOn);
                            }];

    dispatch_semaphore_wait(holdOn, DISPATCH_TIME_FOREVER);
}

@end
