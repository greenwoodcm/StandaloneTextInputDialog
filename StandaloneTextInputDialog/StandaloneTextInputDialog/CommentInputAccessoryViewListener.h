//
//  CommentInputAccessoryViewListener.h
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/8/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HiddenTextFieldView.h"

@interface CommentInputAccessoryViewListener : NSObject <UITextFieldDelegate>
{
    HiddenTextFieldView *hiddenView;
    KeyboardAccessoryView *accessoryView;
}

-(id)initWithHiddenView:(HiddenTextFieldView*)hv andAccessoryView:(KeyboardAccessoryView*)av;

@end
