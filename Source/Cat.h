//
//  Cat.h
//  tappyCat
//
//  Created by Andrew R Couture on 2014-11-17.
//  Copyright (c) 2014 coudrew. All rights reserved.
//

#import "CCSprite.h"

@interface Cat : CCSprite

@property (nonatomic,assign) float speed;

-(void)moveCatIn:(float)direction;

@end
