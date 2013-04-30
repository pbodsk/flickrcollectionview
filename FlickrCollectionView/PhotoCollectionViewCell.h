//
//  PhotoCollectionViewCell.h
//  FlickrCollectionView
//
//  Created by Peter Bødskov on 4/30/13.
//  Copyright (c) 2013 Peter B√∏dskov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *backgroundView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *imageText;

@end
