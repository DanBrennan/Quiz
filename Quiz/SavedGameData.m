//
//  SavedGameData.m
//  Quiz
//
//  Created by Daniel Brennan on 29/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import "SavedGameData.h"

@implementation SavedGameData

static NSString* const SSGameDataHighScoreKey = @"highScore";
static NSString* const SSGameDataAverageScoreKey = @"averageScore";
static NSString* const SSGameDataTotalScoreKey = @"totalScore";
static NSString* const SSGameDataGamesPlayedKey = @"gamesPlayed";


- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInteger:self.highScore forKey: SSGameDataHighScoreKey];
    [encoder encodeInteger:self.averageScore forKey: SSGameDataAverageScoreKey];
    [encoder encodeDouble:self.totalScore forKey: SSGameDataTotalScoreKey];
    [encoder encodeDouble:self.gamesPlayed forKey: SSGameDataGamesPlayedKey];
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [self init];
    if (self) {
        _highScore = [decoder decodeIntegerForKey: SSGameDataHighScoreKey];
        _averageScore = [decoder decodeIntegerForKey: SSGameDataAverageScoreKey];
        _totalScore = [decoder decodeDoubleForKey:SSGameDataTotalScoreKey];
        _gamesPlayed = [decoder decodeDoubleForKey:SSGameDataGamesPlayedKey];
    }
    return self;
}

+(NSString*)filePath
{
    static NSString* filePath = nil;
    if (!filePath) {
        filePath =
        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
         stringByAppendingPathComponent:@"gamedata"];
    }
    return filePath;
}

+(instancetype)loadInstance
{
    NSData* decodedData = [NSData dataWithContentsOfFile: [SavedGameData filePath]];
    if (decodedData) {
        SavedGameData* gameData = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        return gameData;
    }
    
    return [[SavedGameData alloc] init];
}

-(void)save
{
    NSData* encodedData = [NSKeyedArchiver archivedDataWithRootObject: self];
    [encodedData writeToFile:[SavedGameData filePath] atomically:YES];
}

+ (instancetype)sharedGameData {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self loadInstance];
    });
    
    return sharedInstance;
}

-(void)reset
{
    self.highScore = 0;
    self.averageScore = 0;
    self.totalScore = 0;
    self.gamesPlayed = 0;
    
}



@end





