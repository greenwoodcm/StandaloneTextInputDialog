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

@protocol StandaloneTextInputDialogDelegate <NSObject>
@required
-(void)didCompleteWithText:(NSString*)text;

@optional
-(void)didCancel;

@end

@interface StandaloneTextInputDialog : NSObject <UITextFieldDelegate>
{
    UIView *parentView;
    
    HiddenTextFieldView *hiddenView;
    KeyboardAccessoryView *accessoryView;
    
    BOOL _isShowing;
}

@property (weak, nonatomic) id<StandaloneTextInputDialogDelegate> delegate;
@property (readonly, nonatomic) UITextField *textField;
@property (readonly, nonatomic) BOOL isShowing;

-(id)initFromView:(UIView*)view;

-(void)show;

@end
