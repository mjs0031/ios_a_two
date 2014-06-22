//
//  ios_a_twoViewController.m
//  ios_a_two
//
//  Created by Matthew Swann on 6/20/14.
//  Copyright (c) 2014 xmera. All rights reserved. x
//

#import "ios_a_twoViewController.h"

@interface ios_a_twoViewController ()

@end

@implementation ios_a_twoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self set_that_orientation_my_man];

} // end viewDidLoad()


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
    
    // check input
    [self validate];
    
    // Variables
    double loan_amount     = [self.amount_field.text doubleValue];
    double num_of_payments = [self.number_field.text doubleValue];
    double interest_rate   = [self.interest_field.text doubleValue];
    double balloon_payment = [self.balloon_field.text doubleValue];

    double amount         = 0;
    double summation_part = 0;
    double balloon_part   = 0;
    
    interest_rate = interest_rate / 100.0;
    
    // math part
    for ( int i = 1 ; i <= num_of_payments ; i++ ){
        summation_part = summation_part + ( 1 / pow( 1 + interest_rate, i ) );
    }
    
    balloon_part = balloon_payment / pow( 1 + interest_rate, num_of_payments);
    
    amount = (loan_amount - balloon_part )/summation_part;
    
    
    // Truncate excess nonsense in intrest field
    self.interest_field.text = [NSString stringWithFormat:@"%.2f",interest_rate*100];
    
    // Update to display area with new calculation
    self.payment_display.text = [NSString
                            stringWithFormat:@"%.2f", amount];
    
} // end calculate


/**
 Validates the user input
 */
- (void) validate {

    // Loan Amount
    if ( [self.amount_field.text doubleValue] <= 0) {
    
        [self generate_error:@"loan must be positive and non-zero"];
    }

    // Payment Number
    else if ( [self.number_field.text doubleValue] <= 0) {
        
        [self generate_error:@"gotta pay the loan back, need a positive value for payments"];
    }
    
    // Interest Rate
    else if ( [self.interest_field.text doubleValue] <= 0) {
        
        [self generate_error:@"interest rate must be positive and non-zero"];
    }
    else if ( [self.interest_field.text doubleValue] > 100) {
        
        [self generate_error:@"100% is tops, drop the interest rate"];
    }
    
    // Balloon Payment
    else if ( [self.balloon_field.text doubleValue] < 0) {
        
        [self generate_error:@"negative balloon payment? that makes no sense"];
    }
    
    else {
        // do nothing
    }
    
} // end validate


/**
 Error Message
 */
- (void) generate_error: error_message {

    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Validation Error"
                          message:error_message
                          delegate:nil
                          cancelButtonTitle:@"fine, i'll fix it"
                          otherButtonTitles:nil];
    [alert show];
    
} // end generate_error


@end
