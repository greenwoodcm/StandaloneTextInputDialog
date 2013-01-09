//
//  ViewController.m
//  TextViewAccessoryViewTest
//
//  Created by Chris Greenwood on 1/7/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)show:(id)sender {
    
    /*
        If the dialog has already been instantiated and is currently showing,
        re-instantiating it will cause a crash.
     */
    if(!dialog || !dialog.isShowing)
    {
        dialog = [[StandaloneTextInputDialog alloc] initFromView:self.view];
        dialog.delegate = self;
        
        // access the accessoryView property to change the look of
        // the keyboard accessory view
        dialog.accessoryView.backgroundColor = [UIColor orangeColor];
        [dialog.accessoryView.textField setAutocapitalizationType:UITextAutocapitalizationTypeWords];
        
        [dialog show];
    }
}

-(void)didCompleteWithText:(NSString *)text
{
    self.resultTextLabel.text = text;
}

@end
