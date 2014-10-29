//
//  ReadData.m
//  QuizTemplate
//
//  Created by Daniel Brennan on 22/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import "ReadData.h"
#import "QuizData.h"

@implementation ReadData

@synthesize quizData = _quizData;

- (NSMutableArray *)getQuizData:(NSString*)fileName{
    
    NSLog(@" file: %@", fileName);
    
    NSError *error;
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
    
    NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    if (error)
        NSLog(@"Error reading file: %@", error.localizedDescription);
    
    
    self.quizData = [[NSMutableArray alloc] init];
    
    NSArray* rows = [fileContents componentsSeparatedByString:@"\n"];
    
    for (NSString *row in rows){
        NSArray* columns = [row componentsSeparatedByString:@","];
        
        [_quizData addObject:[[QuizData alloc] initWithQuestionName:columns[0] correctAnswer:columns[1] answer1:columns[2] answer2:columns[3] answer3:columns[4] answer4:columns[5]]];
    }

    NSLog(@"Return Quiz Data");
    
    [self shuffle];
    
    NSMutableArray *returnQuestions = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 15; i++)
    {
        [returnQuestions  addObject:self.quizData[i]] ;
        
    }
    
    
    return returnQuestions;
    
}

- (void)shuffle
{

        NSUInteger count = [self.quizData count];
        for (NSUInteger i = 0; i < count; ++i) {
            NSInteger nElements = count - i;
            NSInteger n = (arc4random() % nElements) + i;
            [self.quizData exchangeObjectAtIndex:i withObjectAtIndex:n];
        }

}


@end
