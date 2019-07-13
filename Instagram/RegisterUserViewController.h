//
//  RegisterUserViewController.h
//  Instagram
//
//  Created by mloirraqi on 7/9/19.
//  Copyright © 2019 mloirraqi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterUserViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordField;
@property (weak, nonatomic) IBOutlet UILabel *errorTextLabel;


@end

NS_ASSUME_NONNULL_END
