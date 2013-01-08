//
//  CommentInputAccessoryView.h
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/7/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentInputAccessoryViewListener.h"
#import "HiddenTextFieldView.h"
#import "KeyboardAccessoryView.h"

@protocol CommentInputAccessoryViewDelegate <NSObject>

-(void)didCompleteWithText:(NSString*)text;
-(void)didCancel;

@end

@interface CommentInputAccessoryView : UIView
{
    UIView *parentView;
    
    HiddenTextFieldView *hiddenView;
    KeyboardAccessoryView *accessoryView;
    
    CommentInputAccessoryViewListener *listener;
}

@property (weak, nonatomic) id<CommentInputAccessoryViewDelegate> delegate;

-(id)initFromView:(UIView*)view;

-(void)show;

@end
