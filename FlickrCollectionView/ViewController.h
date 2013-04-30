//
//  ViewController.h
//  FlickrCollectionView
//
//  Created by Peter Bødskov on 4/22/13.
//  Copyright (c) 2013 Peter Bødskov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *imageCollectionView;

@end
