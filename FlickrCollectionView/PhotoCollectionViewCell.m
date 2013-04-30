//
//  PhotoCollectionViewCell.m
//  FlickrCollectionView
//
//  Created by Peter Bødskov on 4/30/13.
//  Copyright (c) 2013 Peter B√∏dskov. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, 300, 400);
        self.backgroundColor = [UIColor clearColor];
        self.backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
        self.backgroundView.image = [UIImage imageNamed:@"flickImageBackground.png"];
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 38, 260, 260)];
        self.imageText = [[UILabel alloc] initWithFrame:CGRectMake(20, 338, 260, 21)];
        self.imageText.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:17];
        self.imageText.textAlignment = NSTextAlignmentCenter;
        self.imageText.adjustsFontSizeToFitWidth = YES;
        self.imageText.backgroundColor = [UIColor clearColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
