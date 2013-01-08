//
//  CommentInputAccessoryView.m
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/7/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import "CommentInputAccessoryView.h"

@implementation CommentInputAccessoryView

-(id)initFromView:(UIView *)view
{
    self = [self init];
    if(self)
    {
        parentView = view;
        
        hiddenView = [[HiddenTextFieldView alloc] init];
        [parentView addSubview:hiddenView];
        
        // add the accessory view to the container's hidden text field
        accessoryView = [[KeyboardAccessoryView alloc] init];
        //[parentView addSubview:accessoryView];
        [hiddenView.hiddenTextField setInputAccessoryView:accessoryView.container];
        
        // initialize the listener
        //listener = [[CommentInputAccessoryViewListener alloc] initWithHiddenView:hiddenView andAccessoryView:accessoryView];
        
        [self initializeDelegates];
        
    }
    return self;
}

-(void)initializeDelegates
{
    // start listening for first responder change
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeFirstResponder)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
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
    NSLog(@"UIKeyboardDidShowNotification fired");
    [accessoryView.accessoryTextField becomeFirstResponder];
}

-(void)show
{
    [hiddenView.hiddenTextField becomeFirstResponder];
}

#pragma UITextFieldDelegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([textField isEqual:accessoryView.accessoryTextField])
    {
        NSString *textToReturn = accessoryView.accessoryTextField.text;
        
        // dismiss the keyboard and accessory view
        [textField resignFirstResponder];
        
        // remove the hidden view from its superview because
        // we're done with this animation
        [hiddenView removeFromSuperview];
        
        [self.delegate didCompleteWithText:textToReturn];
    }
    
    return NO;
}

@end
