//
//  KPDPostModelController.h
//  2ndRedditSearch
//
//  Created by Thao Doan on 6/9/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KPDPost;

@interface KPDPostModelController : NSObject

+(void)  fetchPostWithSearchTerm: (NSString *)searchTerm
                      completion: (void (^) (NSArray <KPDPost *> * _Nullable))completion;

+(void) fetchPostImage: (NSString *)iTunesItem
            completion: (void (^) (UIImage *))completion;

@end
