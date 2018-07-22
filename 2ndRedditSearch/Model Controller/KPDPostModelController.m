//
//  KPDPostModelController.m
//  2ndRedditSearch
//
//  Created by Thao Doan on 6/9/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

#import "KPDPostModelController.h"
#import "KPDPost.h"

@implementation KPDPostModelController

static NSString *const baseURL = @"https://www.reddit.com/r";

+ (void)fetchPostWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<KPDPost *> *))completion
{
    
    NSURL *url = [[NSURL alloc] initWithString: baseURL];
    url = [url URLByAppendingPathComponent:searchTerm];
    url = [url URLByAppendingPathExtension:@"json"];
    
    NSLog(@"url.absoluteString");
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL: url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil){
            NSLog(@"There was an error performing the data task : %@", error);
            completion(nil);
            return;
        }
        
        if (data == nil)
        {
            
            NSLog(@"Cound not find data : %@",error);
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSDictionary *dataToplevel = topLevelDictionary[@"data"];
        
        NSArray *dataDictArray = dataToplevel[@"children"];
        
        NSMutableArray <KPDPost*> *posts = [[NSMutableArray alloc] init];
        
        for (NSDictionary *postDict in dataDictArray)
            
        {
            KPDPost *post = [[KPDPost alloc] initWithDictionary: postDict];
            
            [posts addObject:post];
        }
        
        completion(posts);
    }];
    
    [dataTask resume];
    
}


+ (void)fetchPostImage:(NSString *)thumail completion:(void (^)(UIImage *))completion
{
    //url
    NSURL *url = [[NSURL alloc] initWithString: thumail];
    
    //Request
    
    NSURLRequest *requestForDataTask = [[NSURLRequest alloc] initWithURL:url];
    
    
    //DataTask
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest: requestForDataTask completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"There was an error performing the image data task : %@", error);
            completion(nil);
            return;
        }
        if (data == nil) {
            completion(nil);
            return;
        }
        
        UIImage *postImage = [[UIImage alloc] initWithData:data];
        
        completion(postImage);
        
    }];
    
    [dataTask resume];
    
}

@end
