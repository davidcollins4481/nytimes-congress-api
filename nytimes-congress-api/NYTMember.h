//
//  Member.h
//  nytimes-congress-api
//
//  Created by David Collins on 9/1/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NYTMember : NSObject

@property NSString* memberId;
@property NSString* firstName;
@property NSString* lastName;
@property NSString* party;
@property NSString* state;

@end
