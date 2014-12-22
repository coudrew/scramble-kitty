//
//  Couch.m
//  tappyCat
//
//  Created by Andrew R Couture on 2014-11-20.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Couch.h"

@implementation Couch 

@synthesize scrollSpeed;

-(void)didLoadFromCCB {
    [self setScrollSpeed:5.f];
}

-(void)update:(CCTime)delta {
    CGPoint _couchPos = self.position;
    _couchPos.y -= scrollSpeed;
    [self setPosition:_couchPos];
    
}
-(float)giveX {
    return self.position.x;
}
-(float)giveY {
    return self.position.y;
}

@end
