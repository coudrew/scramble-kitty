//
//  GamePlay.m
//  tappyCat
//
//  Created by Andrew R Couture on 2014-11-17.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GamePlay.h"


@implementation GamePlay {
    NSTimeInterval _couchInterval;
    NSTimeInterval _escape;
    Cat            *_cat;
    LaserDot       *_laserDot;
    Couch          *_couch;
    NSMutableArray *_couches;
    NSMutableArray *_killCouch;
    NSArray        *floors;
    CGPoint        _accel;
    BackGround     *_floor1;
    BackGround     *_floor2;
}


-(void)initialise {
    _cat = (Cat *)[CCBReader load:@"Cat"];
    _cat.position = ccp(160, 170);
    _cat.scale = 0.75;
    _cat.contentSize = CGSizeMake(20.f, 48);
    [_cat setZOrder:2];
    [self addChild:_cat];
    _laserDot = (LaserDot *)[CCBReader load:@"LaserDot"];
    _laserDot.position = ccp(160, 540);
    [_laserDot setZOrder:3];
    [self addChild:_laserDot];
    _floor1 = (BackGround *)[CCBReader load:@"BackGround"];
    [_floor1 setPosition:ccp(0, 0)];
    _floor2 = (BackGround *)[CCBReader load:@"BackGround"];
    [_floor2 setPosition:ccp(0, _floor2.contentSize.height)];
    [self addChild:_floor1];
    [_floor1 setZOrder:-1];
    [self addChild:_floor2];
    [_floor2 setZOrder:-1];
    _couches = [NSMutableArray array];
    _killCouch = [NSMutableArray array];
    [self newCouch];
   
}



-(void)didLoadFromCCB {
    [self initialise];
    floors = @[_floor1, _floor2];
}

#pragma mark - control

-(void)left {
    [_cat moveCatIn:-1];
}

-(void)right {
    [_cat moveCatIn:1];
}
-(void)accel {
    [_laserDot moveLaserDot];
    for (Couch *couch in _couches) {
        [couch setScrollSpeed:6.5];
    }
    [_floor1 setScrollSpeed:6.5];
    [_floor2 setScrollSpeed:6.5];
    _escape = 0;
}

#pragma mark - couch

-(void)newCouch {
    Couch *couch = (Couch *)[CCBReader load:@"Couch"];
    couch.position = ccp((arc4random()%2+1)*100, 600);
    [self addChild:couch];
    [couch setZOrder:2];
    [_couches addObject:couch];
    _couchInterval = 0;
}


#pragma mark - update
-(void)update:(CCTime)delta {
    if (_couchInterval > 3.f) {
        [self newCouch];
        }
    if (_escape >=1) {
        [_floor1 setScrollSpeed:5.f];
        [_floor2 setScrollSpeed:5.f];
        for (Couch *couch in _couches) {
            [couch setScrollSpeed:5.f];
        }
        
    }
    for (Couch *couch in _couches) {
        if (couch.position.y < -100) {
            [_killCouch addObject:couch];
        }
    }
    for (Couch *removeMe in _killCouch) {
        [_couches removeObject:removeMe];
        [removeMe removeFromParent];
    }
    [_killCouch removeAllObjects];
    for (Couch *couch in _couches) {
        if (CGRectIntersectsRect(couch.boundingBox, _cat.boundingBox)) {
            CCScene *fail = [CCBReader loadAsScene:@"Fail"];
            [[CCDirector sharedDirector] replaceScene:fail];
        }
    }
    if (CGRectIntersectsRect(_laserDot.boundingBox, _cat.boundingBox)) {
        CCScene *stageClear = [CCBReader loadAsScene:@"StageClear"];
        [[CCDirector sharedDirector] replaceScene:stageClear];
    }
    _escape += delta;
    _couchInterval += delta;
}

@end
