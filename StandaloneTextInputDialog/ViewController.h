//
//  ViewController.h
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/7/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StandaloneTextInputDialog.h"

@interface ViewController : UIViewController <StandaloneTextInputDialogDelegate>
{
    StandaloneTextInputDialog *dialog;
}

- (IBAction)show:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *resultTextLabel;

@end
