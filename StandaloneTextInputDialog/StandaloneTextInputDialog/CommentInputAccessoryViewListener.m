//
//  CommentInputAccessoryViewListener.m
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/8/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import "CommentInputAccessoryViewListener.h"

@implementation CommentInputAccessoryViewListener

-(id)initWithHiddenView:(HiddenTextFieldView*)hv andAccessoryView:(KeyboardAccessoryView*)av;
{
    self = [super init];
    if(self)
    {
        hiddenView = hv;
        accessoryView = av;
        
        [self initialize];
    }
    return self;
}

-(void)initialize
{
    // start listening for first responder change
    //[[NSNotificationCenter defaultCenter] addObserver:self
    //                                         selector:@selector(changeFirstResponder)
    //                                             name:UIKeyboardDidShowNotification
    //                                           object:nil];
    
    // set the accessory field's delegate
    accessoryView.accessoryTextField.delegate = self;
}

/*
 This is called when the hidden text field finally obtains first responder status.
 When this occurs, the keyboard is visible and we can shift first responder status
 to the accessory text field.
 */
-(void)changeFirstResponder
{
    [accessoryView.accessoryTextField becomeFirstResponder];
}

#pragma UITextFieldDelegate methods

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if([textField isEqual:accessoryView.accessoryTextField])
    {
        // this means we want to dismiss the view
        [accessoryView.accessoryTextField resignFirstResponder];
        [hiddenView.hiddenTextField resignFirstResponder];
        
        // remove the hidden view from its superview because
        // we're done with this animation
        [hiddenView removeFromSuperview];
    }
}

@end
