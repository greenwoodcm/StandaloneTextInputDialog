//
//  KeyboardAccessoryView.m
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/8/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import "KeyboardAccessoryView.h"

@implementation KeyboardAccessoryView

-(id)init
{
    self = [super init];
    if(self)
    {
        self.container = [[[NSBundle mainBundle] loadNibNamed:@"KeyboardAccessoryView" owner:self options:nil] objectAtIndex:0];
        [self addSubview:self.container];
        
        //[self.accessoryTextField setInputAccessoryView:self.container];
    }
    return self;
}

@end
