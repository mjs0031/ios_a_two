//
//  ios_a_twoViewController.m
//  ios_a_two
//
//  Created by Matthew Swann on 6/20/14.
//  Copyright (c) 2014 xmera. All rights reserved.
//

#import "ios_a_twoViewController.h"

@interface ios_a_twoViewController ()

@end

@implementation ios_a_twoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self set_that_orientation_my_man];

}

/**
 Memory warning stuff.
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    [self set_that_orientation_my_man];
    
} // end didReceiveMemoryWarning()


/**
 Forced rotation
 */
- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {

    [self doLayoutForOrientation:toInterfaceOrientation];
    
} // end willAnimateRotationToInterfaceOrientation()


/**
 Refactored function for setting the orientation.
 */
- (void) set_that_orientation_my_man {

    UIApplication *application = [UIApplication sharedApplication];
    UIInterfaceOrientation current_orientation = application.statusBarOrientation;
    
    [self doLayoutForOrientation:current_orientation];
    
} // end set_that_orientation_my_man()


/**
 Resets layout based on mobile devices physical orientation.
 */
- (void) doLayoutForOrientation:(UIInterfaceOrientation)orientation {
    
    // PORTRAIT
    if ( UIInterfaceOrientationIsPortrait(orientation) ) {
    
        // Title
        self.wicked_sick.frame       = CGRectMake(40,   20, 250, 25);
        
        // Prompts
        self.amount_label.frame      = CGRectMake(20,  100, 120, 25);
        self.number_label.frame      = CGRectMake(20,  140, 120, 25);
        self.interest_label.frame    = CGRectMake(20,  180, 120, 25);
        self.balloon_label.frame     = CGRectMake(20,  220, 120, 25);
        
        // Entry Fields
        self.amount_field.frame      = CGRectMake(150, 100, 150, 25);
        self.number_field.frame      = CGRectMake(150, 140, 150, 25);
        self.interest_field.frame    = CGRectMake(150, 180, 150, 25);
        self.balloon_field.frame     = CGRectMake(150, 220, 150, 25);
        
        // Button
        self.loan_shark_button.frame = CGRectMake(60,  300, 200, 25);
        
        // Output Venue
        self.payment_label.frame     = CGRectMake(20,  350, 120, 25);
        self.payment_display.frame   = CGRectMake(180, 350, 120, 25);
        
    } // end if portrait
    
    
    // LANDSCAPE
    else {
    
        // Title
        self.wicked_sick.frame    = CGRectMake(125, 20, 250, 25);
        
        // Prompts
        self.amount_label.frame   = CGRectMake(20,   80, 120, 25);
        self.number_label.frame   = CGRectMake(20,  150, 120, 25);
        self.interest_label.frame = CGRectMake(250,  80, 120, 25);
        self.balloon_label.frame  = CGRectMake(250, 150, 120, 25);
        
        // Entry Fields
        self.amount_field.frame   = CGRectMake(130,  80, 100, 25);
        self.number_field.frame   = CGRectMake(130, 150, 100, 25);
        self.interest_field.frame = CGRectMake(360,  80, 100, 25);
        self.balloon_field.frame  = CGRectMake(360, 150, 100, 25);
        
        // Button
        self.loan_shark_button.frame = CGRectMake(145, 220, 200, 25);
        
        // Output Venue
        self.payment_label.frame     = CGRectMake(130, 280, 120, 25);
        self.payment_display.frame   = CGRectMake(260, 280, 120, 25);
        
    } // end landscape
    
} // end doLayoutForOrientation()


/**
 Keyboard closing functionality
 */
- (IBAction)background_tap:(id)sender {
    
    [self.amount_field   resignFirstResponder];
    [self.number_field   resignFirstResponder];
    [self.interest_field resignFirstResponder];
    [self.balloon_field  resignFirstResponder];

} // end background_tap()


/**
 Keyboard closing functionality
 */
- (IBAction)field_done_editing:(id)sender {
    [sender resignFirstResponder];
}


/**
 Calculates the loan shark payments
 */
- (IBAction)calculate:(UIButton *)sender {
    
    // Variables
    double loan_amount     = [self.amount_field.text doubleValue];
    double num_of_payments = [self.number_field.text doubleValue];
    double interest_rate   = [self.interest_field.text doubleValue];
    double balloon_payment = [self.balloon_field.text doubleValue];

    double amount = 0;
    
    for (int i = 0; i < 10 ; i++ ){
        amount = amount  + 1;
    }
    
    // Truncate excess nonsense in intrest field
    self.interest_field.text = [NSString stringWithFormat:@"%f",interest_rate];
    
    // Update to display area with new calculation
    self.payment_display.text = [NSString
                            stringWithFormat:@"%f", interest_rate];
    
} // end calculate

@end
