//
//  NYTChamber.h
//  nytimes-congress-api
//
//  Created by David Collins on 9/2/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NYTMember.h"

@interface NYTChamber : NSObject {
    NSMutableArray *members;
}

- (NSMutableArray*) members;
- (NSMutableArray*) getMembers;
- (void) addMember: (NYTMember *) member;

@end
