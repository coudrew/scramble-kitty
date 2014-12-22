//
//  BackGround.m
//  tappyCat
//
//  Created by Andrew R Couture on 2014-12-10.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "BackGround.h"

@implementation BackGround

@synthesize scrollSpeed;

-(void)initialise {
    [self setScrollSpeed:5.f];
}

-(void)didLoadFromCCB {
    [self initialise];
}

-(void)update:(CCTime)delta {
    CGPoint _bgPos = self.position;
    _bgPos.y -= scrollSpeed;
        if (_bgPos.y < -(self.contentSize.height)) {
        [self setPosition:ccp(0, _bgPos.y + (2 * self.contentSize.height))];
    } else {
        [self setPosition:_bgPos];
    }
}
@end
