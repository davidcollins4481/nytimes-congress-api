//
//  NYTHouseOfRepsTests.m
//  nytimes-congress-api
//
//  Created by David Collins on 9/2/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NYTHouseOfRepresentatives.h"

@interface NYTHouseOfRepsTests : XCTestCase

@end

@implementation NYTHouseOfRepsTests

NYTHouseOfRepresentatives *house;


- (void)setUp
{
    [super setUp];
    house = [NYTHouseOfRepresentatives alloc];
    dispatch_semaphore_t holdOn = dispatch_semaphore_create(0);

    house = [house initWithCallbacksOnSuccess:
              ^(NSURLResponse* response, NSData* urlData) {
                  dispatch_semaphore_signal(holdOn);
              }
            onError: ^(NSURLResponse* response, NSError *error) {
                XCTFail(@"Error in API Request");
                dispatch_semaphore_signal(holdOn);
            }];

    
    dispatch_semaphore_wait(holdOn, DISPATCH_TIME_FOREVER);
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void) testStateHouseMembers
{
    NSMutableArray* OHReps = [house membersFromState:@"OH"];
    XCTAssertTrue([OHReps count] == 16, @"Sixteen Reps from Ohio");
}

@end
