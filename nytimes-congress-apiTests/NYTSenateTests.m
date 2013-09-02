//
//  NYTSenateTests.m
//  nytimes-congress-api
//
//  Created by David Collins on 9/1/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NYTSenate.h"
@interface NYTSenateTests : XCTestCase

@end

@implementation NYTSenateTests

NYTSenate *senate;

- (void)setUp
{
    [super setUp];
    senate = [NYTSenate alloc];

    dispatch_semaphore_t holdOn = dispatch_semaphore_create(0);
    
    senate = [senate initWithCallbacksOnSuccess:
              ^(NSURLResponse* response, NSData* urlData) {
                  dispatch_semaphore_signal(holdOn);
              }
              onError: ^(NSURLResponse* response, NSError *error) {
                  dispatch_semaphore_signal(holdOn);
              }];
    
    dispatch_semaphore_wait(holdOn, DISPATCH_TIME_FOREVER);
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample
{

    
}

@end
