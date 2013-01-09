//
//  KeyboardAccessoryView.m
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/8/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import "KeyboardAccessoryView.h"

@implementation KeyboardAccessoryView

+(id)keyboardAccessoryView
{
    KeyboardAccessoryView *view = [[[NSBundle mainBundle] loadNibNamed:@"KeyboardAccessoryView" owner:self options:nil] objectAtIndex:0];
    if([view isKindOfClass:[KeyboardAccessoryView class]])
    {
        return view;
    }
    return nil;
}

@end
