//
//  ReadData.h
//  QuizTemplate
//
//  Created by Daniel Brennan on 22/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReadData : NSObject

@property (nonatomic) NSMutableArray *quizData;

//pass in file name for various quizes
-(NSMutableArray *)getQuizData;

@end
