//
//  KPDPost.h
//  2ndRedditSearch
//
//  Created by Thao Doan on 6/9/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPDPost : NSObject

@property (nonatomic, copy,readonly) NSString*title;
@property (nonatomic,copy,readonly) NSNumber*numberOfVotes;
@property (nonatomic,copy,readonly) NSNumber*numberOfComments;
@property (nonatomic, copy,readonly) NSString*thumnail;

-(instancetype)initWithTitle:(NSString*)title
               numberOfVotes:(NSNumber*)numberOfVotes
            numberOfComments:(NSNumber*)numberOfComments
                    thumnail:(NSString*)thumnail;
-(instancetype) initWithDictionary: (NSDictionary*)dictionary;

@end
