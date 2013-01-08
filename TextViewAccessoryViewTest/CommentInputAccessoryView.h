//
//  CommentInputAccessoryView.h
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/7/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CommentInputAccessoryViewDelegate <NSObject>

-(void)didCompleteWithText:(NSString*)text;
-(void)didCancel;

@end

@interface CommentInputAccessoryView : UIView <UITextFieldDelegate>
{
    UIView *parentView;
    UIView *container;
}

@property (weak, nonatomic) IBOutlet UITextField *hiddenTextField;
@property (weak, nonatomic) IBOutlet UITextField *accessoryTextField;
@property (weak, nonatomic) id<CommentInputAccessoryViewDelegate> delegate;

-(id)initFromView:(UIView*)view;

-(void)show;

@end
