//
//  Photos.m
//  FlickrCollectionView
//
//  Created by Peter Bødskov on 4/22/13.
//  Copyright (c) 2013 Peter B√∏dskov. All rights reserved.
//

#import "Photos.h"
#import "Photo.h"

@implementation Photos

+ (Photos *)newFromJSON:(NSDictionary *)json {
    Photos *returnValue = [Photos new];
    returnValue.page = ((NSString *)[json valueForKey:@"page"]).integerValue;
    returnValue.pages = ((NSString *) [json valueForKey:@"pages"]).integerValue;
    returnValue.perPage = ((NSString *)[json objectForKey:@"perpage"]).integerValue;
    NSArray *photosArray = [json valueForKey:@"photo"];
    NSMutableArray *returnPhotosArray = [[NSMutableArray alloc]initWithCapacity:photosArray.count];
    for(NSUInteger i = 0; i < photosArray.count; i++){
        [returnPhotosArray addObject:[Photo newWithJson:[photosArray objectAtIndex:i]]];
    }
    returnValue.photosArray = returnPhotosArray;
    
    return returnValue;
}

@end
