//
//  CommentInputAccessoryView.m
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/7/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import "StandaloneTextInputDialog.h"

@implementation StandaloneTextInputDialog
@synthesize accessoryView = _accessoryView;

-(id)initFromView:(UIView *)view
{
    self = [self init];
    if(self)
    {
        parentView = view;
        
        _hiddenView = [HiddenTextFieldView hiddenTextFieldView];
        [parentView addSubview:_hiddenView];
        
        // add the accessory view to the container's hidden text field
        _accessoryView = [KeyboardAccessoryView keyboardAccessoryView];
        _accessoryView.textField.delegate = self;
        [_hiddenView.hiddenTextField setInputAccessoryView:self.accessoryView];
        
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

-(void)addParentViewTapListener
{
    parentTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(masterViewTapped)];
    
    [parentView addGestureRecognizer:parentTap];
}

-(void)removeParentViewTapListener
{
    [parentView removeGestureRecognizer:parentTap];
}

-(void)masterViewTapped
{
    NSLog(@"Parent view tapped");
    
    [self textFieldShouldReturn:self.accessoryView.textField];
}

/*
 This is called when the hidden text field finally obtains first responder status.
 When this occurs, the keyboard is visible and we can shift first responder status
 to the accessory text field.
 */
-(void)changeFirstResponder
{
    NSLog(@"UIKeyboardDidShowNotification fired");
    [self.accessoryView.textField becomeFirstResponder];
}

-(UITextField*)textField
{
    return self.accessoryView.textField;
}

-(BOOL)isShowing
{
    return _isShowing;
}

-(void)show
{
    [_hiddenView.hiddenTextField becomeFirstResponder];
    _isShowing = YES;
    
    [self addParentViewTapListener];
}

#pragma UITextFieldDelegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([textField isEqual:self.accessoryView.textField])
    {
        NSString *textToReturn = self.accessoryView.textField.text;
        
        // dismiss the keyboard and accessory view
        [textField resignFirstResponder];
        
        // remove the hidden view from its superview because
        // we're done with this animation
        [_hiddenView removeFromSuperview];
        
        _isShowing = NO;
        
        [self removeParentViewTapListener];
        
        [self.delegate didCompleteWithText:textToReturn];
        [self removeKeyboardListener];
    }
    
    return NO;
}

@end
