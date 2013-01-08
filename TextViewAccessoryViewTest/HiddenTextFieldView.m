//
//  HiddenTextFieldView.m
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/8/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import "HiddenTextFieldView.h"

@implementation HiddenTextFieldView

-(id)init
{
    self = [super init];
    if(self)
    {
        // add the subview this view owns
        subview = [[[NSBundle mainBundle] loadNibNamed:@"HiddenTextFieldView" owner:self options:nil] objectAtIndex:0];
        
        [self addSubview:subview];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
