//
//  CommentInputAccessoryView.m
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/7/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import "StandaloneTextInputDialog.h"

@implementation StandaloneTextInputDialog

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
        accessoryView.accessoryTextField.delegate = self;
        [hiddenView.hiddenTextField setInputAccessoryView:accessoryView.container];
        
        [self addKeyboardListener];
    }
    return self;
}

-(void)addKeyboardListener
{
    // start listening for first responder change
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeFirstResponder)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
}

-(void)removeKeyboardListener
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

-(UITextField*)textField
{
    return accessoryView.accessoryTextField;
}

-(BOOL)isShowing
{
    return _isShowing;
}

-(void)show
{
    [hiddenView.hiddenTextField becomeFirstResponder];
    _isShowing = YES;
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
        
        _isShowing = NO;
        
        [self.delegate didCompleteWithText:textToReturn];
        [self removeKeyboardListener];
    }
    
    return NO;
}

@end
