//
//  Fail.m
//  tappyCat
//
//  Created by Andrew R Couture on 2014-11-28.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Fail.h"

@implementation Fail
-(void)retry {
    CCScene *gamePlayScene = [CCBReader loadAsScene:@"GamePlay"];
    [[CCDirector sharedDirector] replaceScene:gamePlayScene];
    
}
@end
