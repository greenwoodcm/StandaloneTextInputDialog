//
//  ViewController.h
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/7/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentInputAccessoryView.h"
#import "CustomKeyboardController.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

- (IBAction)show:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end
