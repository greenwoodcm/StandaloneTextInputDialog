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
    
    dialog = [[StandaloneTextInputDialog alloc] initFromView:self.view];
    dialog.delegate = self;
    [dialog.textField setAutocapitalizationType:UITextAutocapitalizationTypeAllCharacters];
    
    [dialog show];
     
    
}

-(void)didCompleteWithText:(NSString *)text
{
    self.resultTextLabel.text = text;
}

@end
