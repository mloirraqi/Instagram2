//
//  LoginViewController.m
//  Instagram
//
//  Created by mloirraqi on 7/9/19.
//  Copyright © 2019 mloirraqi. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"
#import "AppDelegate.h"


@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)clickedSignIn:(id)sender {
    
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            
            // display view controller that needs to shown after successful login
//            [self performSegueWithIdentifier:@"timelineSegue" sender:nil];
            
            UITabBarController *tabBarController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"tabBarController"];
            
            [self presentViewController:tabBarController animated:YES completion:nil];
        }
    }];
}

- (IBAction)clickedRegister:(id)sender {
    [self performSegueWithIdentifier:@"registerSegue" sender:nil];
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
