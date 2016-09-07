//
//  Fail.m
//  tappyCat
//
//  Created by Andrew R Couture on 2014-11-28.
//  Copyright (c) 2014 coudrew. All rights reserved.
//

#import "Fail.h"

@implementation Fail {
    CCButton        *_retry;
}

-(void)didLoadFromCCB {
    _retry.title = [SKGameData sharedGameData].lives >= 0 ? [NSString stringWithFormat:@"Retry!"] : [NSString stringWithFormat:@"Game Over"];
}
-(void)retry {
    if ([SKGameData sharedGameData].lives >= 0) {
        CCScene *gamePlayScene = [CCBReader loadAsScene:@"GamePlay"];
        [[CCDirector sharedDirector] replaceScene:gamePlayScene];
    } else {
        CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
        [[CCDirector sharedDirector] replaceScene:mainScene];
    }
    
}
@end
