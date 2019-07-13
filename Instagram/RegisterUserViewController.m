//
//  RegisterUserViewController.m
//  Instagram
//
//  Created by mloirraqi on 7/9/19.
//  Copyright © 2019 mloirraqi. All rights reserved.
//

#import "RegisterUserViewController.h"
#import "Parse/Parse.h"

@interface RegisterUserViewController ()

@end

@implementation RegisterUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)registerButton:(id)sender {
    
    bool a = false;
    bool b = false;
    
    if (self.passwordField.text == self.confirmPasswordField.text) {
        a = true;
    } else {
        //Passwords dont match
        self.errorTextLabel.text = @"ERROR: Password unmatched";
    }
    
    if([self.passwordField.text  isEqual: @""] || [self.confirmPasswordField.text  isEqual: @""]) {
        //alert saying there are empty fields
        self.errorTextLabel.text = @"ERROR: Password field empty";
        
    } else {
        
        b = true;
    }
    
    if (a == true && b == true) {
        
        //Signup code
        // initialize a user object
        PFUser *newUser = [PFUser user];
        
        // set user properties
        newUser.username = self.usernameField.text;
        newUser.email = self.emailField.text;
        newUser.password = self.passwordField.text;
        
        // call sign up function on the object
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
            
            NSString *errorString = @"ERROR: ";
            errorString = [errorString stringByAppendingString: error.localizedDescription ];
            
            if (error != nil) {
                self.errorTextLabel.text = errorString;
//                NSLog(@"Error: %@", error.localizedDescription);
            }
            else if ([self.emailField.text  isEqual: @""]) {
                self.errorTextLabel.text = @"ERROR: Invalid email";
            }
            else {
                NSLog(@"User registered successfully");
                
                // manually segue to logged in view
                [self dismissViewControllerAnimated:YES completion:nil];
                
            }
        }];
        
    }
    
    
//    // initialize a user object
//    PFUser *newUser = [PFUser user];
//
//    // set user properties
//    newUser.username = self.usernameField.text;
//    newUser.email = self.emailField.text;
//    newUser.password = self.passwordField.text;
//
//    // call sign up function on the object
//    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
//        if (error != nil) {
//            NSLog(@"Error: %@", error.localizedDescription);
//        } else {
//            NSLog(@"User registered successfully");
//
//            // manually segue to logged in view
//            [self dismissViewControllerAnimated:YES completion:nil];
//
//        }
//    }];
    
}

- (IBAction)cancelRegisterButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
