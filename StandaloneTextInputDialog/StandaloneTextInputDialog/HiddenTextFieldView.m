//
//  HiddenTextFieldView.m
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/8/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import "HiddenTextFieldView.h"

@implementation HiddenTextFieldView

+(id)hiddenTextFieldView
{
    HiddenTextFieldView *view = [[[NSBundle mainBundle] loadNibNamed:@"HiddenTextFieldView" owner:self options:nil] objectAtIndex:0];
    
    if([view isKindOfClass:[HiddenTextFieldView class]])
    {
        return view;
    }
    return nil;
}

@end
