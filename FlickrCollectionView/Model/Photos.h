//
//  Photos.h
//  FlickrCollectionView
//
//  Created by Peter Bødskov on 4/22/13.
//  Copyright (c) 2013 Peter B√∏dskov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photos : NSObject
@property (nonatomic) NSUInteger page;
@property (nonatomic) NSUInteger pages;
@property (nonatomic) NSUInteger perPage;
@property (nonatomic, strong) NSArray *photosArray;

+ (Photos *)newFromJSON:(NSDictionary *)json;

@end
