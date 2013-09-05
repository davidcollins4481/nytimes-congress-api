//
//  NYTVote.h
//  nytimes-congress-api
//
//  Created by David Collins on 9/4/13.
//  Copyright (c) 2013 David Collins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NYTVote : NSObject

/*
 {
     "member_id": "B000944",
     "chamber": "Senate",
     "congress": "113",
     "session": "1",
     "roll_call": "199",
     "bill": {
         "number": "S.1243",
         "bill_uri": "http:\/\/api.nytimes.com\/svc\/politics\/v3\/us\/legislative\/congress\/113\/bills\/s1243.json",
         "title": "Transportation, Housing and Urban Development, and Related Agencies Appropriations",
         "latest_action": "Senate floor actions. Status: Cloture on the measure not invoked in Senate by Yea-Nay Vote. 54 - 43. Record Vote Number: 199."
     },
     "description": "An original bill making appropriations for the Departments of Transportation, and Housing and Urban Development, and related agencies for the fiscal year ending September 30, 2014, and for other purposes.",
     "question": "On the Cloture Motion S. 1243",
     "date": "2013-08-01",
     "time": "12:41:00",
     "position": "Yes"
 },
 */

@property NSString* memberId;
@property NSString* date;
@property NSString* rollCall;
@property NSString* title;
@property NSString* position;
@property NSString* description;

@end
