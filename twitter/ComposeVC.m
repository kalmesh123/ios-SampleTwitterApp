//
//  ComposeVC.m
//  twitter
//
//  Created by Kalmesh Nyamagoudar on 25/08/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ComposeVC.h"
#import "JSONKit.h"

@interface ComposeVC ()
@property (nonatomic, strong) User *currentUser;

@end

@implementation ComposeVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [[NSUserDefaults standardUserDefaults] getO:[currentUser JSONString] forKey:kCurrentUserKey];
    NSString *jsonString = [[NSUserDefaults standardUserDefaults] stringForKey:@"kCurrentUserKey"];
    if (jsonString) {
        self.currentUser = [[User alloc] initWithDictionary:[jsonString objectFromJSONString]];
    }
    self.userName.text = self.currentUser.userName;
    self.userScreenname.text = [@"@" stringByAppendingString:self.currentUser.userScreenName];
    
    NSURL *url = [NSURL URLWithString:self.currentUser.imageUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    self.userImageView.image = img;
    if (self.tweet != nil) {
        self.tweetTextView.text = [@"@" stringByAppendingString:self.tweet.userName];
    }
    [self.tweetTextView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tweetButtonPressed:(id)sender {
    
    if (self.tweet) {
        [[TwitterClient instance] replyWithText:self.tweetTextView.text forTweetId:self.tweet.tweetId success:^(AFHTTPRequestOperation *operation, id response) {
            NSLog(@"%@", response);
            [self dismissViewControllerAnimated:YES completion:nil];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            // Do nothing
        }];

    } else {
        [[TwitterClient instance] newTweetWithText:self.tweetTextView.text success:^(AFHTTPRequestOperation *operation, id response) {
            NSLog(@"%@", response);
            [self dismissViewControllerAnimated:YES completion:nil];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            // Do nothing
        }];
    }

}

@synthesize tweet;
@end
