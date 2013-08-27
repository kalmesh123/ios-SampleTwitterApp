//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}
- (NSString *)imageUrl {
    NSDictionary *userData = [self.data valueOrNilForKeyPath:@"user"];
    return [userData valueOrNilForKeyPath:@"profile_image_url"];
}
- (NSString *)userName {
    NSDictionary *userData = [self.data valueOrNilForKeyPath:@"user"];
    return [userData valueOrNilForKeyPath:@"name"];
}

- (NSString *)userScreenName {
    NSDictionary *userData = [self.data valueOrNilForKeyPath:@"user"];
    return [userData valueOrNilForKeyPath:@"screen_name"];
}

- (NSString *)tweetId {
    return [self.data valueOrNilForKeyPath:@"id_str"];

}
+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
