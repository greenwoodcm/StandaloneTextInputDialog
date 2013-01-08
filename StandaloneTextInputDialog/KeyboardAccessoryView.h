//
//  KeyboardAccessoryView.h
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/8/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardAccessoryView : UIView
{
}

@property (weak, nonatomic) IBOutlet UITextField *accessoryTextField;
@property (strong, nonatomic) UIView *container;
@end
