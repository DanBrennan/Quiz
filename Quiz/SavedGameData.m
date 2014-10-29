//
//  SavedGameData.m
//  Quiz
//
//  Created by Daniel Brennan on 29/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import "SavedGameData.h"

@implementation SavedGameData

+ (instancetype)sharedGameData {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

-(void)reset
{
    self.highScore = 0;
    self.averageScore = 0;
    self.gamesPlayed = 0;
    self.totalScore = 0;
}

@end





