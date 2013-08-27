//
//  ComposeVC.h
//  twitter
//
//  Created by Kalmesh Nyamagoudar on 25/08/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Tweet.h"
@interface ComposeVC : UIViewController
@property (strong, nonatomic)  Tweet *tweet;

@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userScreenname;
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)tweetButtonPressed:(id)sender;

@end
