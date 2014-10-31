//
//  QuestionViewController.h
//  Quiz
//
//  Created by Daniel Brennan on 28/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "QuizData.h"


@interface QuestionViewController : UIViewController<ADBannerViewDelegate>
{
    NSTimer *Timer;
}
@property (weak, nonatomic) IBOutlet UITextView *questionTextView;

@property (weak, nonatomic) IBOutlet UIButton *answerOneButton;
@property (weak, nonatomic) IBOutlet UIButton *answerTwoButton;
@property (weak, nonatomic) IBOutlet UIButton *answerThreeButton;
@property (weak, nonatomic) IBOutlet UIButton *answerFourButton;
@property (weak, nonatomic) IBOutlet UIButton *getScoreButton;

@property (strong, nonatomic) NSMutableArray *questions;
@property (strong, nonatomic) QuizData *quizData;

@property (strong, nonatomic) NSString *category;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;


@end
