#import "MainScene.h"


@implementation MainScene

-(void)play {
    CCScene *gamePlayScene = [CCBReader loadAsScene:@"GamePlay"];
    [[CCDirector sharedDirector] replaceScene:gamePlayScene];
}

@end
