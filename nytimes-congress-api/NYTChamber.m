//
//  NYTChamber.m
//  nytimes-congress-api
//
//  Created by David Collins on 9/2/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "NYTChamber.h"

@interface NYTChamber ()
@property (nonatomic, retain) NSMutableArray* members; // private!!
@end

@implementation NYTChamber

- (NSMutableArray*) getMembers
{
    return [self getMembers];
}

- (void) addMember:(NYTMember *)member
{
    [[self getMembers] insertObject:member atIndex:[[self getMembers] count]];
}


@end
