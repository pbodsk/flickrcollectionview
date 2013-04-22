//
//  ViewController.m
//  FlickrCollectionView
//
//  Created by Peter Bødskov on 4/22/13.
//  Copyright (c) 2013 Peter Bødskov. All rights reserved.
//

#import "ViewController.h"
#import "AFJSONRequestOperation.h"
#import "Photos.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *flickrRecentUrl = [NSURL URLWithString:@"http://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=243e49e3df56d6a7662063417af912c4&format=json&nojsoncallback=1"];
    NSURLRequest *request = [NSURLRequest requestWithURL:flickrRecentUrl];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSDictionary *jsonDict = JSON;
        NSDictionary *photosDict = [jsonDict valueForKey:@"photos"];
        Photos *photos = [Photos newFromJSON:photosDict];
        NSLog(@"%i", photos.perPage);
        NSLog(@"%i", photos.pages);
        NSLog(@"%i", photos.page);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
    }];
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
