//
//  PostCell.h
//  Instagram
//
//  Created by mloirraqi on 7/11/19.
//  Copyright © 2019 mloirraqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PostCellDelegate;


@interface PostCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *userText;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *captionText;
@property (nonatomic, weak) id<PostCellDelegate> delegate;
@property (strong, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *likeIncrement;

- (void) didTapUserProfile:(UITapGestureRecognizer *) sender;

@end

@protocol PostCellDelegate

- (void)postCell:(PostCell *)postCell didTap: (PFUser *) user;

@end


NS_ASSUME_NONNULL_END
