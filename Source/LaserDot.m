//
//  LaserDot.m
//  tappyCat
//
//  Created by Andrew R Couture on 2014-11-19.
//  Copyright (c) 2014 coudrew. All rights reserved.
//

#import "LaserDot.h"

@implementation LaserDot {
    NSTimeInterval  _escape;
}

@synthesize speed;

-(void)didLoadFromCCB {
    _escape = 0;
    [self setSpeed:0];
}

-(void)moveLaserDot {
    [self setSpeed:-1.f];
    _escape = 0;
}

-(void)update:(CCTime)delta {
    if (_escape >= 1) {
        [self setSpeed:0];
        if (_escape >= 2.5) {
            [self setSpeed:0.5];
        }
        }
    CGPoint newPos = self.position;
    newPos.y += self.speed;
    if ((newPos.y > 180)&&(newPos.y < 540)) {
        [self setPosition:newPos];
    }
    
    _escape += delta;
}

@end
