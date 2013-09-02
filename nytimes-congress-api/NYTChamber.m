//
//  NYTChamber.m
//  nytimes-congress-api
//
//  Created by David Collins on 9/2/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "NYTChamber.h"

@implementation NYTChamber

- (NSMutableArray*) getMembers
{
    return members;
}

- (void) addMember:(NYTMember *)member
{
    [members addObject:member];
}

@end
