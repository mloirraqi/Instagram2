//
//  PostCollectionViewCell.h
//  Instagram
//
//  Created by mloirraqi on 7/12/19.
//  Copyright © 2019 mloirraqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *collectionPictureView;
@property (strong, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
