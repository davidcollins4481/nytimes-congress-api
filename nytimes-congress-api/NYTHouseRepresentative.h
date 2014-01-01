//
//  NYTHouseRepresentative.h
//  nytimes-congress-api
//
//  Created by David Collins on 9/2/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import "NYTMember.h"

@interface NYTHouseRepresentative : NYTMember

@property NSString* district;

- (NSString*) districtString;
@end
