# README

## Overview

This project provides an Objective-C class that can be used in iPhone applications.  The class displays a keyboard from the current view, that keyboard having a standalone text box on in that will display the entered text.  After instantiation, the user can access the accessoryView property of the StandaloneTextInputDialog to change the appearance of the accessory view that shows above the keyboard.

## Usage

This portion of the README is taken from the example application.  To create an instance of StandaloneTextInputDialog, you must pass in the view that will act as the parent view, like so:

	StandaloneTextInputDialog *dialog = [[StandaloneTextInputDialog alloc] initFromView:parentView];
	dialog.delegate = self;

You can then change the look and feel of the dialog using the accessoryView property:

	// access the accessoryView property to change the look of
    // the keyboard accessory view
    dialog.accessoryView.backgroundColor = [UIColor orangeColor];
    [dialog.accessoryView.textField setAutocapitalizationType:UITextAutocapitalizationTypeWords];

Finally, call [dialog show] to make the keyboard dialog popup on screen.  The delegate (self, in this example) must only implement one method to adhere to the StandaloneTextInputDialogDelegate protocol:

	-(void)didCompleteWithText:(NSString *)text

This method is called right before the dialog is removed from screen, and returns whatever text appears in the text box at that time.