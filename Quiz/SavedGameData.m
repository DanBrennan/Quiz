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
//static NSString* const SSGameDataLevels = @"levels";
static NSString* const SSGameDataCurrentLevel = @"currentLevel";


- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInteger:self.highScore forKey: SSGameDataHighScoreKey];
    [encoder encodeInteger:self.averageScore forKey: SSGameDataAverageScoreKey];
    [encoder encodeDouble:self.totalScore forKey: SSGameDataTotalScoreKey];
    [encoder encodeDouble:self.gamesPlayed forKey: SSGameDataGamesPlayedKey];
    [encoder encodeInteger:self.currentLevel forKey: SSGameDataCurrentLevel];

}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [self init];
    if (self) {
        _highScore = [decoder decodeIntegerForKey: SSGameDataHighScoreKey];
        _averageScore = [decoder decodeIntegerForKey: SSGameDataAverageScoreKey];
        _totalScore = [decoder decodeDoubleForKey:SSGameDataTotalScoreKey];
        _gamesPlayed = [decoder decodeDoubleForKey:SSGameDataGamesPlayedKey];
        _currentLevel = [decoder decodeIntegerForKey:SSGameDataCurrentLevel];
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

//-(BOOL)passedLevel:(NSInteger*)score{
//    
//    if (score > 9){
//        self.currentLevel = self.currentLevel + 1;
//        return YES;
//    }
//    else{
//        return NO;
//    }
//    
//}

//-(void)incrementLevel:(NSInteger)level{
//    
//    self.currentLevel.number = self.currentLevel.number +1;
//    
//}
//
//-(BOOL)passedLevel:(NSInteger*)score{
//    
//    //check if game completed, if not increment level too
//    
//    if (score > self.currentLevel.passScore){
//        return YES;
//    }
//    else{
//        return NO;
//    }
//    
//}

-(void)reset
{
    self.highScore = 0;
    self.averageScore = 0;
    self.totalScore = 0;
    self.gamesPlayed = 0;
    self.currentLevel = 0;
    
}



@end





