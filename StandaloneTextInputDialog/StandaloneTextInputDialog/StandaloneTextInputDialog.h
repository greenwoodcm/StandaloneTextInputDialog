//
//  CommentInputAccessoryView.h
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/7/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HiddenTextFieldView.h"
#import "KeyboardAccessoryView.h"

@class StandaloneTextInputDialog;

@protocol StandaloneTextInputDialogDelegate <NSObject>
@required
-(void)standaloneTextInputDialog:(StandaloneTextInputDialog*)dialog didCompleteWithText:(NSString*)text;

@optional
-(void)didCancel;

@end

@interface StandaloneTextInputDialog : NSObject <UITextFieldDelegate>
{
    UIView *parentView;
    
    HiddenTextFieldView *_hiddenView;
    
    BOOL _isShowing;
}

@property (weak, nonatomic) id<StandaloneTextInputDialogDelegate> delegate;
@property (readonly, nonatomic) BOOL isShowing;

// this is externalized so that the user
// can set things like background color and autocomplete options
@property (readonly, nonatomic) KeyboardAccessoryView *accessoryView;

-(id)initFromView:(UIView*)view;

-(void)show;

@end
