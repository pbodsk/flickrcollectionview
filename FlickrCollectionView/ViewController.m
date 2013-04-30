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
#import "Photo.h"
#import "AFNetworking.h"
#import "PhotoCollectionViewCell.h"
#import "EmitterViewController.h"

@interface ViewController () {
    Photos *_photos;
    NSString *_cellIdentifier;
}



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Flickr collection view";
    _cellIdentifier = @"flickrImageCell";
    NSURL *flickrRecentUrl = [NSURL URLWithString:@"http://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=243e49e3df56d6a7662063417af912c4&format=json&nojsoncallback=1"];
    NSURLRequest *request = [NSURLRequest requestWithURL:flickrRecentUrl];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSDictionary *jsonDict = JSON;
        NSDictionary *photosDict = [jsonDict valueForKey:@"photos"];
        _photos = [Photos newFromJSON:photosDict];
        NSLog(@"%i", _photos.perPage);
        NSLog(@"%i", _photos.pages);
        NSLog(@"%i", _photos.page);
        [self.imageCollectionView reloadData];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
    }];
    [operation start];

    [self.imageCollectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:_cellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(_photos == nil){
        return 0;
    } else{
        return _photos.photosArray.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    Photo *currentPhoto = [_photos.photosArray objectAtIndex:(NSUInteger) indexPath.row];
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cellIdentifier forIndexPath:indexPath];
    if (cell == nil){
        cell = [[PhotoCollectionViewCell alloc] init];
    }
    NSURL *imageUrl = [[NSURL alloc] initWithString:currentPhoto.imageUrl];
    [cell.imageView setImageWithURL:imageUrl];
    cell.imageText.text = currentPhoto.title;
    [cell.contentView addSubview:cell.imageView];
    [cell.contentView addSubview:cell.imageText];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;

}


- (IBAction)emitterPressed:(id)sender {
    NSLog(@"pressed");
    EmitterViewController *emitterViewController = [EmitterViewController new];
    [self.navigationController pushViewController:emitterViewController animated:YES];

}
@end
