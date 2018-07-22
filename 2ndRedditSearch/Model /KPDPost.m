//
//  KPDPost.m
//  2ndRedditSearch
//
//  Created by Thao Doan on 6/9/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

#import "KPDPost.h"

@implementation KPDPost

- (instancetype)initWithTitle:(NSString *)title numberOfVotes:(NSNumber *)numberOfVotes numberOfComments:(NSNumber *)numberOfComments thumnail:(NSString *)thumnail
{
    self = [super init];
    if (self)
    {
        _title = [title copy];
        _numberOfComments = [numberOfComments copy];
        _numberOfVotes = [numberOfVotes copy];
        _thumnail = [thumnail copy];
    }
    return self;
}
- (instancetype)initWithDictionary:(NSDictionary *)dictionary

{
    NSDictionary *postDict = dictionary[@"data"];
    NSString *dictTitle = [postDict objectForKey:@"title"];
    NSNumber *dictVotes = [postDict objectForKey:@"ups"];
    NSNumber *dictComments = [postDict objectForKey:@"num_comments"];
    NSString *dictThumnail = [postDict objectForKey:@"thumbnail"];
    
    return [self initWithTitle:dictTitle numberOfVotes:dictVotes numberOfComments:dictComments thumnail:dictThumnail];
}

@end
