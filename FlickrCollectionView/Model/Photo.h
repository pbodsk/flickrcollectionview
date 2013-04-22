//
//  Photo.h
//  FlickrCollectionView
//
//  Created by Peter Bødskov on 4/22/13.
//  Copyright (c) 2013 Peter B√∏dskov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject
@property (nonatomic, strong) NSString *farm;
@property (nonatomic, strong) NSString *id;
@property (nonatomic) BOOL isFamily;
@property (nonatomic) BOOL isFriend;
@property (nonatomic) BOOL isPublic;
@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) NSString *secret;
@property (nonatomic, strong) NSString *server;
@property (nonatomic, strong) NSString *title;

+ (Photo *)newWithJson:(NSDictionary *)json;
@end
