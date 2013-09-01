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

#define API_KEY @"8d5a094b165e6d9d570f6640b4301b45:19:66347810"

#import "NYTimesAPIRequest.h";

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

- (void)testBasicHTTPRequest
{
    [super setUp];
    dispatch_semaphore_t holdOn = dispatch_semaphore_create(0);
    
    [NYTimesAPIRequest asyncRequest:@"http://www.google.com"
                             params:nil
                          onsuccess:^(NSURLResponse* response) {
                              NSLog(@"*****bow!*******");
                              dispatch_semaphore_signal(holdOn);
                          }
                            onerror:^(NSURLResponse* response, NSError *error) {
                                dispatch_semaphore_signal(holdOn);
                            }];


    dispatch_semaphore_wait(holdOn, DISPATCH_TIME_FOREVER);

    

}

@end
