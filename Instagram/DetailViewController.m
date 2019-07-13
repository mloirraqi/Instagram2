//
//  DetailViewController.m
//  Instagram
//
//  Created by mloirraqi on 7/11/19.
//  Copyright © 2019 mloirraqi. All rights reserved.
//

#import "DetailViewController.h"
#import "TimelineViewController.h"
#import "Post.h"
#import "NSDate+DateTools.h"
#import "Parse/Parse.h"


@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.post.image getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!data) {
            return NSLog(@"%@", error);
        }
        self.photo.image = [UIImage imageWithData:data];
    }];
    self.captionLabel.text = self.post.caption;
    self.nameLabel.text = self.post.author.username;
    NSDate *createdAt = [self.post createdAt];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"E MMM d HH:mm:ss y"];
    NSString *stringFromDate = [formatter stringFromDate:createdAt];
    
    self.timeLabel.text = stringFromDate;
    
    

    // self.timeLabel.text =  [NSString stringWithFormat:@"%@", ];

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




