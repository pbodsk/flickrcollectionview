//
//  Photo.m
//  FlickrCollectionView
//
//  Created by Peter Bødskov on 4/22/13.
//  Copyright (c) 2013 Peter B√∏dskov. All rights reserved.
//

#import "Photo.h"

@implementation Photo

+ (Photo *)newWithJson:(NSDictionary *)json {
    Photo *returnValue = [Photo new];
    returnValue.farm = [json valueForKey:@"farm"];
    returnValue.id = [json valueForKey:@"id"];
    returnValue.isFamily = [json valueForKey:@"isfamily"] == 0 ? NO : YES;
    returnValue.isFriend = [json valueForKey:@"isfriend"] == 0 ? NO : YES;
    returnValue.isPublic = [json valueForKey:@"ispublic"] == 0 ? NO : YES;
    returnValue.owner = [json valueForKey:@"owner"];
    returnValue.secret = [json valueForKey:@"secret"];
    returnValue.server = [json valueForKey:@"server"];
    returnValue.title = [json valueForKey:@"title"];
    return returnValue;
}

- (NSString *)imageUrl {
    return [NSString stringWithFormat:@"http://farm%@.staticflickr.com/%@/%@_%@.jpg", self.farm, self.server, self.id, self.secret];
}

@end
