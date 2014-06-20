//
//  ios_a_twoViewController.h
//  ios_a_two
//
//  Created by Matthew Swann on 6/20/14.
//  Copyright (c) 2014 xmera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ios_a_twoViewController : UIViewController

// Title
@property (weak, nonatomic) IBOutlet UILabel *wicked_sick;


// Prompts
@property (weak, nonatomic) IBOutlet UILabel *amount_label;
@property (weak, nonatomic) IBOutlet UILabel *number_label;
@property (weak, nonatomic) IBOutlet UILabel *interest_label;
@property (weak, nonatomic) IBOutlet UILabel *balloon_label;


// Entry Fields
@property (weak, nonatomic) IBOutlet UITextField *amount_field;
@property (weak, nonatomic) IBOutlet UITextField *number_field;
@property (weak, nonatomic) IBOutlet UITextField *interest_field;
@property (weak, nonatomic) IBOutlet UITextField *balloon_field;


// Button
@property (weak, nonatomic) IBOutlet UIButton *loan_shark_button;


// Output Venue
@property (weak, nonatomic) IBOutlet UILabel *payment_label;
@property (weak, nonatomic) IBOutlet UILabel *payment_display;


@end
