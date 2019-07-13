# Project 4 - *Instagram*

**Instagram** is a photo sharing app using Parse as its backend.

Time spent: **28** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User can sign up to create a new account using Parse authentication
- [X] User can log in and log out of his or her account
- [X] The current signed in user is persisted across app restarts
- [X] User can take a photo, add a caption, and post it to "Instagram"
- [X] User can view the last 20 posts submitted to "Instagram"
- [X] User can pull to refresh the last 20 posts submitted to "Instagram"
- [X] User can tap a post to view post details, including timestamp and caption.

The following **optional** features are implemented:

- [X] Run your app on your phone and use the camera to take the photo
- [X] Style the login page to look like the real Instagram login page.
- [X] Style the feed to look like the real Instagram feed.
- [X] User can use a tab bar to switch between all "Instagram" posts and posts published only by the user. AKA, tabs for Home Feed and Profile
- [ ] User can load more posts once he or she reaches the bottom of the feed using infinite scrolling.
- [X] Show the username and creation time for each post
- [X] After the user submits a new post, show a progress HUD while the post is being uploaded to Parse
- User Profiles:
  - [X] Allow the logged in user to add a profile photo
  - [X] Display the profile photo with each post
  - [ ] Tapping on a post's username or profile photo goes to that user's profile page
- [ ] User can comment on a post and see all comments for each post in the post details screen.
- [X] User can like a post and see number of likes for each post in the post details screen.
- [ ] Implement a custom camera view.

The following **additional** features are implemented:

- [ ] Allow users to view the number of posts in their profile view.
- [ ] 


Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. I would like to further learn more about PFQuery and how to use concepts of getting values out of PFObject and extending that to other applications.

2. I'd like to learn more about the code that goes into building a backend server and how the backend manages to communicate with the frontend. 

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://g.recordit.co/ogxJCXZ831.gif' title='App Intro' width='' alt='Video Walkthrough' />
<img src='http://g.recordit.co/Oso2x9tdRe.gif' title='Updating Profile Picture' width='' alt='Video Walkthrough' />
<img src='http://g.recordit.co/gTDPBmtdav.gif' title='Posting Pictures' width='' alt='Video Walkthrough' />
<img src='http://g.recordit.co/sdniRbm6RF.gif' title='Scroll Feature' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- [Parse] (https://github.com/parse-community)
- [MBProgressHUD] (https://github.com/jdg/MBProgressHUD)
- [Bolt] (https://github.com/BoltsFramework)
- [DateTools] (https://github.com/MatthewYork/DateTools) 


## Notes

I initially ran into trouble getting the cells to display the proper user properties (profile picture, username) as well as date posted. Afterwards, I ran into a merge conflict and couldn't sync commits w/ the help of TAs so I had to resolve to creating a new git repository (Instagram2) and could no longer push to my original git repo (Instagram). Files are still availalbe in both repos and this has helped me learn more about the process of working w/ different repos, commiting, pushing and pulling. I also had initial issues getting profile pictures updated after editing them and had trouble getting posts to show up in the timeline early on. 

## License

    Copyright [2019] [Mohamed Loirraqi]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
