#import "MainScene.h"


@implementation MainScene {
    CCButton *_continue;
}

-(void)play {
    [SKGameData sharedGameData];
    [[SKGameData sharedGameData] reset];
    CCScene *gamePlayScene = [CCBReader loadAsScene:@"GamePlay"];
    [[CCDirector sharedDirector] replaceScene:gamePlayScene];
}

-(void)load {
    [SKGameData loadInstance];
    CCScene *gamePlayScene = [CCBReader loadAsScene:@"GamePlay"];
    [[CCDirector sharedDirector] replaceScene:gamePlayScene];
}
-(void)didLoadFromCCB {
    NSData *decodedData = [NSData dataWithContentsOfFile:[SKGameData filepath]];
    _continue.enabled = decodedData ? 1 : 0;
    if (decodedData) {
        NSLog(@"found");
    }
}
@end
