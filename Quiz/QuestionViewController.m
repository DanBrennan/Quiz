//
//  QuestionViewController.m
//  Quiz
//
//  Created by Daniel Brennan on 28/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import "QuestionViewController.h"
#import "ReadData.h"
#import "FinalViewController.h"

@interface QuestionViewController ()
{
    int questionNumber;
    int correctAnswers;
}

@end

//Read file
//Take 10 random questions from array and put in Quiz Data
//Final View showing score and asking if play again

@implementation QuestionViewController

@synthesize questions = _questions;
@synthesize quizData = _quizData;
@synthesize category = _category;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.questions = [[ReadData alloc] getQuizData:_category];
    questionNumber = 0;
    [self loadQuestion];
}

- (void)loadQuestion {
    
    NSLog(@"LoadQuestion %d", questionNumber);
    NSLog(@"TotalQuestions %lu", (unsigned long)self.questions.count);
    
    if (questionNumber >= self.questions.count) {

        self.answerOneButton.hidden=YES;
        self.answerTwoButton.hidden=YES;
        self.answerThreeButton.hidden=YES;
        self.answerFourButton.hidden=YES;
        self.questionTextView.hidden=YES;
        self.getScoreButton.enabled=YES;
        self.getScoreButton.hidden=NO;
        //play full time whistle
    
    }
    else {
        
        self.quizData = [self.questions objectAtIndex:questionNumber];
        
        self.questionTextView.text = self.quizData.question;
        
        [self.answerOneButton setTitle:self.quizData.answer1 forState:(UIControlStateNormal)];
        [self.answerTwoButton setTitle:self.quizData.answer2 forState:(UIControlStateNormal)];
        [self.answerThreeButton setTitle:self.quizData.answer3 forState:(UIControlStateNormal)];
        [self.answerFourButton setTitle:self.quizData.answer4 forState:(UIControlStateNormal)];
        
    }
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Presses

- (IBAction)answerOnePressed:(id)sender {
    
    if ([self.answerOneButton.titleLabel.text isEqualToString:self.quizData.correctAnswer]) {
        correctAnswers ++;
    }
    questionNumber ++;
    [self loadQuestion];

}
- (IBAction)answerTwoPressed:(id)sender {
    
    if ([self.answerTwoButton.titleLabel.text isEqualToString:self.quizData.correctAnswer]) {
        correctAnswers ++;
    }
    questionNumber ++;
    [self loadQuestion];

}
- (IBAction)answerThreePressed:(id)sender {
    
    if ([self.answerThreeButton.titleLabel.text isEqualToString:self.quizData.correctAnswer]) {
        correctAnswers ++;
    }
    questionNumber ++;
    [self loadQuestion];
}

- (IBAction)answerFourPressed:(id)sender {
    
    if ([self.answerFourButton.titleLabel.text isEqualToString:self.quizData.correctAnswer]) {
        correctAnswers ++;
    }
    questionNumber ++;
    [self loadQuestion];
}

- (IBAction)getScorePressed:(id)sender {
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
    FinalViewController *finalViewController = (FinalViewController *)navController.topViewController;
    finalViewController.correctAnswers = correctAnswers;
    
    
}



@end
