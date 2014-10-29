//
//  SavedGameData.h
//  Quiz
//
//  Created by Daniel Brennan on 29/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavedGameData : NSObject

@property (assign, nonatomic) NSInteger highScore;
@property (assign, nonatomic) NSInteger averageScore;
@property (assign, nonatomic) long gamesPlayed;
@property (assign, nonatomic) long totalScore;

+(instancetype)sharedGameData;
-(void)reset;

@end


