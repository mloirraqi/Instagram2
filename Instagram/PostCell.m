//
//  PostCell.m
//  Instagram
//
//  Created by mloirraqi on 7/11/19.
//  Copyright © 2019 mloirraqi. All rights reserved.
//

#import "PostCell.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UITapGestureRecognizer *profileTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapUserProfile:)];
    [self.profilePicture addGestureRecognizer:profileTapGestureRecognizer];
    [self.profilePicture setUserInteractionEnabled:YES];
}

- (void) tappedProfile:(UITapGestureRecognizer *)sender{
    [self.delegate postCell:self didTap:self.post.author];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (IBAction)tappedLikeButton:(id)sender {
    PFUser *user = [PFUser currentUser];
    NSArray *likeArray = [[NSArray alloc]init];
    likeArray = [self.post objectForKey:@"likeArray"];
    NSString *username = [user objectForKey:@"username"];
    if (![likeArray containsObject:user.username]){
        NSLog(@"Successfully favorited!");
        [self.likeButton setSelected:YES];
        [self.post addObject:username forKey:@"likeArray"];
        [self.post saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        }];
        likeArray = [self.post objectForKey:@"likeArray"];
        NSString *likeCount = [NSString stringWithFormat:@"%lu", (unsigned long)likeArray.count];
        likeCount = [likeCount stringByAppendingString:@" Likes"];
        self.likeIncrement.text = likeCount;
    }
    else{
        NSLog(@"Successfully unfavorited!");
        [self.likeButton setSelected:NO];
        NSString *username = user.username;
        [self.post removeObject:username forKey:@"likeArray"];
        [self.post saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            
        }];
        likeArray = [self.post objectForKey:@"likeArray"];
        NSString *likeCount = [NSString stringWithFormat:@"%lu", (unsigned long)likeArray.count];
        likeCount = [likeCount stringByAppendingString:@" Like"];
        self.likeIncrement.text = likeCount;
    }
}


@end
