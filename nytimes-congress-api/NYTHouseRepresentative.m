//
//  NYTHouseRepresentative.m
//  nytimes-congress-api
//
//  Created by David Collins on 9/2/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "NYTHouseRepresentative.h"

@implementation NYTHouseRepresentative

@synthesize district;

- (NSString*) districtString
{
    NSString* districtNumber = [self district];
    NSString* suffix;

    switch ([districtNumber integerValue]) {
            // show senate view
        case 1:
            suffix = @"st";
            break;
        case 2:
            suffix = @"nd";
            break;
        case 3:
            suffix = @"rd";
        default:
            suffix = @"th";
            break;
    }
    
    suffix = [suffix stringByAppendingString:@" district"];
    return [district stringByAppendingString:suffix];
}
@end
