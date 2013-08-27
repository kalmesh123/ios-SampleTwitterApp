//
//  TweetCell.h
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetCell : UITableViewCell

@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *userImage;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *userName;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *tweetTime;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *tweetText;

@end
