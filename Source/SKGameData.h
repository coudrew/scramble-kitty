//
//  SKGameData.h
//  Scramble Kittty!
//
//  Created by Andrew R Couture on 2015-07-29.
//  Copyright (c) 2015 coudrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKGameData : NSObject <NSCoding>

@property (assign, nonatomic) int score;
@property (assign, nonatomic) int lives;

+(instancetype)sharedGameData;
+(instancetype)loadInstance;
+(NSString *)filepath;
-(void)reset;
-(void)saveGame;

@end
