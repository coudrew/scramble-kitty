//
//  LaserDot.h
//  tappyCat
//
//  Created by Andrew R Couture on 2014-11-19.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"
#import "GamePlay.h"

@interface LaserDot : CCSprite

@property (nonatomic, assign) float speed;

-(void)moveLaserDot;


@end
