//
//  StageClear.m
//  tappyCat
//
//  Created by Andrew R Couture on 2014-11-28.
//  Copyright (c) 2014 coudrew. All rights reserved.
//

#import "StageClear.h"

@implementation StageClear {
    CCButton    *_saveButton;
}
-(void)retry {
    //[SKGameData sharedGameData].lives += 1;
    CCScene *gamePlayScene = [CCBReader loadAsScene:@"GamePlay"];
    [[CCDirector sharedDirector] replaceScene:gamePlayScene];
    
}

-(void)save {
    [[SKGameData sharedGameData] saveGame];
    [self removeChild:_saveButton];
}
@end
