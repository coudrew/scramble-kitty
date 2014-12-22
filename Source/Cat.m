//
//  Cat.m
//  tappyCat
//
//  Created by Andrew R Couture on 2014-11-17.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Cat.h"

@implementation Cat{
    NSTimeInterval  _scramble;
    NSTimeInterval  _decel;
}

@synthesize speed;

-(void)didLoadFromCCB {
    _scramble = 0;
    [self setSpeed:0.f];
}

-(void)moveCatIn:(float)direction {
    if ((direction > 0)&&(self.speed < -1)) {
        if (![self.animationManager.runningSequenceName isEqual:@"scramble"]) {
           [self.animationManager runAnimationsForSequenceNamed:@"scramble"];
            _scramble = 0;
        }
        self.rotation = 45;
    } else if ((direction < 0)&&(self.speed > 1)) {
        self.rotation = 315;
        if (![self.animationManager.runningSequenceName isEqual:@"scramble"]) {
            [self.animationManager runAnimationsForSequenceNamed:@"scramble"];
            _scramble = 0;
        }
    } else {
        self.rotation = 0;
    }
    if (((self.speed < 3)&&(self.speed >= 0))||((self.speed > -3)&&(self.speed <= 0))) {
        self.speed += direction;
    }
    
}

-(void)update:(CCTime)delta {
    CGPoint _currentPos = self.position;
    _currentPos.x += self.speed;
    if ((_currentPos.x < (0.f + self.contentSize.width)) || (_currentPos.x > (320 - self.contentSize.width))) {
        self.speed *= -1.f;
    }
    if ((self.rotation != 0)&&(_scramble >= 0.5)) {
        self.rotation = 0;
    }
    if ((_decel > 1)&&(self.speed != 0)) {
        if (self.speed > 0) {
            self.speed -= 1;
            _decel = 0;
        } else if (self.speed < 0) {
            self.speed += 0.5;
            _decel = 0;
        }
    }
    [self setPosition:_currentPos];
    _scramble += delta;
    _decel += delta;
}


@end
