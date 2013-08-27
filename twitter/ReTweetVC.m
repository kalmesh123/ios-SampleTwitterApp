//
//  ReTweetVC.m
//  twitter
//
//  Created by Kalmesh Nyamagoudar on 25/08/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ReTweetVC.h"
#import "TwitterClient.h"
#import "ComposeVC.h"

#define FONT_SIZE 11
#define CELL_CONTENT_WIDTH 280
@interface ReTweetVC ()

@property (nonatomic,strong) ComposeVC *composeVC;
- (IBAction)replyToTweet:(id)sender;
- (IBAction)reTweetButtonPressed:(id)sender;
- (IBAction)favoritesButtonClicked:(id)sender;

@end


@implementation ReTweetVC

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
    self.userName.text = [@"@" stringByAppendingString:tweet.userName];
    self.userScreenName.text = tweet.userScreenName;
    self.tweetText.text = tweet.text;
    
    NSURL *url = [NSURL URLWithString:tweet.imageUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    self.userImageView.image = img;
    img = nil;
    
    CGSize size = [tweet.text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:CGSizeMake(CELL_CONTENT_WIDTH, 20000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    
    [self.tweetText setFrame:CGRectMake(self.tweetText.frame.origin.x, self.tweetText.frame.origin.y, self.tweetText.frame.size.width, size.height)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)replyToTweet:(id)sender {
    self.composeVC = [[ComposeVC alloc] init];
    [self.composeVC setTweet:self.tweet];
    [self presentViewController:self.composeVC animated:YES completion:nil];
}

- (IBAction)reTweetButtonPressed:(id)sender {
    
    [[TwitterClient instance] reTweetWithId:self.tweet.tweetId success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Do nothing
    }];
}

- (IBAction)favoritesButtonClicked:(id)sender {
    
    [[TwitterClient instance] setFavoriteForTweet:self.tweet.tweetId success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Do nothing
    }];
}

@synthesize tweet;
@synthesize composeVC;
@end
