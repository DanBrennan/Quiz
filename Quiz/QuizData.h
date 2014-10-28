//
//  QuizData.h
//  QuizTemplate
//
//  Created by Daniel Brennan on 22/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizData : NSObject

@property NSString *question;
@property NSString *correctAnswer;
@property NSString *answer1;
@property NSString *answer2;
@property NSString *answer3;
@property NSString *answer4;

- (id)initWithQuestionName:(NSString*)question correctAnswer:(NSString*)correctAnswer answer1:(NSString*)answer1 answer2:(NSString*)answer2 answer3:(NSString*)answer3 answer4:(NSString*)answer4;

@end
