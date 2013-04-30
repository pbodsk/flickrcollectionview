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
    boubble.birthRate = 1;
    boubble.lifetime = 1;
    boubble.lifetimeRange = 1;
    boubble.color = [UIColor redColor].CGColor;
    boubble.contents = (id)[UIImage imageNamed:@"Particles_fire"].CGImage;
//    boubble.contents = (id)[UIImage imageNamed:@"boubble"].CGImage;
    boubble.name = @"boubble";
    
    boubble.velocity = 10;
    boubble.velocityRange = 1;
//    boubble.emissionRange = M_PI_2;
/*
    boubble.scaleSpeed = 0.3;
    boubble.spin = 0.5;
  */
    emitterLayer.renderMode = kCAEmitterLayerAdditive;


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
