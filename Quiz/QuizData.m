//
//  QuizData.m
//  QuizTemplate
//
//  Created by Daniel Brennan on 22/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import "QuizData.h"

@implementation QuizData

- (id)initWithQuestionName:(NSString*)question correctAnswer:(NSString*)correctAnswer answer1:(NSString*)answer1 answer2:(NSString*)answer2 answer3:(NSString*)answer3 answer4:(NSString*)answer4{
    
    if ((self = [super init])) {
        self.question = question;
        self.correctAnswer = correctAnswer;
        self.answer1 = answer1;
        self.answer2 = answer2;
        self.answer3 = answer3;
        self.answer4 = answer4;
    }
    
    
    
    return self;
}

@end
