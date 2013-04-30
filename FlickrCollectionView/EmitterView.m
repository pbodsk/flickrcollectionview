//
//  EmitterView.m
//  FlickrCollectionView
//
//  Created by Peter Bødskov on 4/30/13.
//  Copyright (c) 2013 Peter B√∏dskov. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "EmitterView.h"

@implementation EmitterView {
    CAEmitterLayer *emitterLayer;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }

    return self;

}


- (void)awakeFromNib {
    emitterLayer = (CAEmitterLayer *) self.layer;
    emitterLayer.emitterPosition = CGPointMake(150, 150);
    emitterLayer.emitterSize = CGSizeMake(10, 10);

    CAEmitterCell *boubble = [CAEmitterCell emitterCell];
    boubble.birthRate = 100;
    boubble.lifetime = 10;
    boubble.lifetimeRange = 1;
    boubble.color = [UIColor blueColor].CGColor;
    boubble.contents = (id)[UIImage imageNamed:@"boubble.png"].CGImage;
    boubble.name = @"boubble";

    emitterLayer.emitterCells = [NSArray arrayWithObject:boubble];



}

+ (Class)layerClass {
    return [CAEmitterLayer class];
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
