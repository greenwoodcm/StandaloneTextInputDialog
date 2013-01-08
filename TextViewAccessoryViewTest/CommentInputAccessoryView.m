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
        
        hiddenView = [[HiddenTextFieldView alloc] init];
        [parentView addSubview:hiddenView];
        
        // add the accessory view to the container's hidden text field
        accessoryView = [[KeyboardAccessoryView alloc] init];
        [parentView addSubview:accessoryView];
        [hiddenView.hiddenTextField setInputAccessoryView:accessoryView.container];
        
        // initialize the listener
        listener = [[CommentInputAccessoryViewListener alloc] initWithHiddenView:hiddenView andAccessoryView:accessoryView];
        
    }
    return self;
}

-(void)show
{
    [hiddenView.hiddenTextField becomeFirstResponder];
}

@end
