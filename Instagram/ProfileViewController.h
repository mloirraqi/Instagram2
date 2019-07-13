//
//  ProfileViewController.h
//  Instagram
//
//  Created by mloirraqi on 7/12/19.
//  Copyright © 2019 mloirraqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "TimelineViewController.h"
#import "DetailViewController.h"
#import "Parse/Parse.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController

@property (strong, nonatomic) PFUser *user;

@end

NS_ASSUME_NONNULL_END
