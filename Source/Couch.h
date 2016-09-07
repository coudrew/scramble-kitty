//
//  Couch.h
//  tappyCat
//
//  Created by Andrew R Couture on 2014-11-20.
//  Copyright (c) 2014 coudrew. All rights reserved.
//

#import "CCSprite.h"

@interface Couch : CCSprite 

@property (nonatomic, assign) float scrollSpeed;

-(float)giveX;
-(float)giveY;
@end
