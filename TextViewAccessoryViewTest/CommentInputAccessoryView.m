//
//  CommentInputAccessoryView.m
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/7/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import "CommentInputAccessoryView.h"

@implementation CommentInputAccessoryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initFromView:(UIView *)view
{
    self = [self init];
    if(self)
    {
        parentView = view;
        
        // initialize the container
        container = [[[NSBundle mainBundle] loadNibNamed:@"CommentInputAccessoryContainer" owner:self options:nil] objectAtIndex:0];
        
        // add the container as a subview of the parent -- this will not add any visible UI elements to the parent
        [parentView addSubview:container];
        
        // add the accessory view to the container's hidden text field
        UIView *accessory = [[[NSBundle mainBundle] loadNibNamed:@"CommentInputAccessoryView" owner:self options:nil] objectAtIndex:0];
        [self.hiddenTextField setInputAccessoryView:accessory];
        [self.accessoryTextField setInputAccessoryView:accessory];
        
    }
    return self;
}

-(void)show
{
    // start listening for first responder change
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeFirstResponder)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [self.hiddenTextField becomeFirstResponder];
}

/*
    This is called when the hidden text field finally obtains first responder status.
    When this occurs, the keyboard is visible and we can shift first responder status
    to the accessory text field.
 */
-(void)changeFirstResponder
{
    [self.accessoryTextField becomeFirstResponder];
}

#pragma UITextFieldDelegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    // remove the container from the parent view
    [container removeFromSuperview];
    
    // call the delegate method
    NSString *textToReturn = self.accessoryTextField.text;
    [self.delegate didCompleteWithText:textToReturn];
}

@end
