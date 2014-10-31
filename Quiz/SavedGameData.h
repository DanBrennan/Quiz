//
//  SavedGameData.h
//  Quiz
//
//  Created by Daniel Brennan on 29/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Levels.h"

@interface SavedGameData : NSObject <NSCoding>

@property (assign, nonatomic) NSInteger highScore;
@property (assign, nonatomic) NSInteger averageScore;
@property (assign, nonatomic) long gamesPlayed;
@property (assign, nonatomic) long totalScore;
@property (assign, nonatomic) NSInteger currentLevel;


//@property (assign, nonatomic) Levels *currentLevel;
//@property (assign, nonatomic) NSArray *levels;
//@property (assign, nonatomic) NSInteger level;
//@property (assign, nonatomic) enum LevelType {trainee = 1, reservePlayer = 2, firstTeamPlayer = 3, goalScorer = 4, premierLeagueWinner = 5, championsLeagueWinner = 6};
//@property (assign, nonatomic) enum LevelPassScore {trainee=10, reservePlayer=12, firstTeamPlayer = 3, goalScorer = 4, premierLeagueWinner = 5, championsLeagueWinner = 6};

+(instancetype)sharedGameData;
-(void)reset;
-(void)save;
-(BOOL)passedLevel:(NSInteger*)score;

@end


