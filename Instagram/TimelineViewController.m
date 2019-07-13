//
//  TimelineViewController.m
//  Instagram
//
//  Created by mloirraqi on 7/9/19.
//  Copyright © 2019 mloirraqi. All rights reserved.
//

#import "TimelineViewController.h"
#import "Parse/Parse.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "PostCell.h"
#import "DetailViewController.h"
#import "ProfileViewController.h"


@interface TimelineViewController () <UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *postArray;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (assign, nonatomic) BOOL isMoreDataLoading;


@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tableView.rowHeight = 452.5;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.postArray = [[NSMutableArray alloc]init];
    [self fetchPosts];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchPosts) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    self.navigationItem.title = [NSString stringWithFormat:@"Instagram"];

}

- (void) fetchPostsWithFilter:(NSDate *) lastDate {
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    if (lastDate){
        [postQuery whereKey:@"createdAt" lessThan:lastDate];
    }
    postQuery.limit = 20;
    
    [[MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES]  setLabelText:@"Loading"];
    // fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            if (lastDate){
                NSLog(@"Successfully loaded home timeline!");
                self.isMoreDataLoading = false; 
                [self.postArray addObjectsFromArray:posts];
            }
            self.postArray = posts;
            [self.tableView reloadData];
        }
        else {
            NSLog(@"Error");
        }
        [self.refreshControl endRefreshing];
        [MBProgressHUD hideAllHUDsForView:self.navigationController.view animated:YES];
        
    }];
}


- (void) fetchPosts {
    [self fetchPostsWithFilter: nil];
}


- (IBAction)clickedLogout:(id)sender {
    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {}];
    NSLog(@"User logged out successfully");
    
    LoginViewController *loginController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"Login"];
    
    [self presentViewController:loginController animated:YES completion:nil];
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    Post *post = self.postArray[indexPath.row];
    cell.post = post;
    [post.image getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!data) {
            return NSLog(@"%@", error);
        }
        cell.photoView.image = [UIImage imageWithData:data];
    }];
    cell.captionText.text = post.caption;
    cell.userText.text = post.author.username;
    PFFileObject *image = [cell.post.author objectForKey:@"image"];
    [image getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!data) {
            return NSLog(@"%@", error);
        }
        [cell.profilePicture setImage:[UIImage imageWithData:data]];
        cell.profilePicture.layer.cornerRadius = cell.profilePicture.frame.size.height/2;
        cell.profilePicture.clipsToBounds = YES;
    }];
    //changes image after liking/disliking
    cell.delegate = self;
    [cell.likeButton setImage:[UIImage imageNamed:@"likeicon"] forState:UIControlStateNormal];
    [cell.likeButton setImage:[UIImage imageNamed:@"likeselected"] forState:UIControlStateSelected];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.postArray.count;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        PostCell *tappedCell = sender;
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.post = tappedCell.post;
    }
    else {
     //   ProfileViewController *profileViewController = [segue destinationViewController];
//        profileViewController.user = sender;
    }
}



- (IBAction)photoSegue:(id)sender {
    [self performSegueWithIdentifier:@"photoSegue" sender:nil];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(!self.isMoreDataLoading) {
        // self.isMoreDataLoading = true;
        int scrollViewContentHeight = self.tableView.contentSize.height;
        int scrollOffsetThreshold = scrollViewContentHeight - self.tableView.bounds.size.height;
        
        // When the user has scrolled past the threshold, start requesting
        if(scrollView.contentOffset.y > scrollOffsetThreshold && self.tableView.isDragging) {
            self.isMoreDataLoading = true;
            Post *lastPost = [self.postArray lastObject];
            NSDate *lastDate = lastPost.createdAt;
            [self fetchPostsWithFilter:lastDate];
        }
    }
}

- (void)postCell:(PostCell *) postCell  didTap:(PFUser *) user{
}
@end
