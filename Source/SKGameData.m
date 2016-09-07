//
//  SKGameData.m
//  Scramble Kittty!
//
//  Created by Andrew R Couture on 2015-07-29.
//  Copyright (c) 2015 coudrew. All rights reserved.
//

#import "SKGameData.h"

@implementation SKGameData


-(void)encodeWithCoder:(NSCoder *)aCoder {
    NSLog(@"score %i lives %i", self.score, self.lives);
    [aCoder encodeInt:self.score forKey:@"score"];
    [aCoder encodeInt:self.lives forKey:@"lives"];
    NSLog(@"encoded");
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [SKGameData sharedGameData];
    if (self) {
        self.score = [aDecoder decodeIntForKey:@"score"];
        self.lives = [aDecoder decodeIntForKey:@"lives"];
    }
    NSLog(@"decoded");
    return self;
}

+(instancetype)sharedGameData {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

+(NSString *)filepath {
    static NSString* filepath = nil;
    if (!filepath) {
        filepath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"gamedata"];
    }
    return filepath;
}

+(instancetype)loadInstance {
    //NSData *decodedData = [NSData dataWithContentsOfFile:[SKGameData filepath]];
    SKGameData *gameData = [NSKeyedUnarchiver unarchiveObjectWithFile:[SKGameData filepath]];
    return gameData;
    
    //return [[SKGameData alloc] init];
}

-(void)saveGame {
    //NSData *encodedData = [NSKeyedArchiver archivedDataWithRootObject:self];
    //[encodedData writeToFile:[SKGameData filepath] atomically:YES];
    [NSKeyedArchiver archiveRootObject:self toFile:[SKGameData filepath]];
    NSLog(@"saved");
    
}

-(void)reset {
    self.score = 0;
    self.lives = 3;
}
@end
