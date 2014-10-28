//
//  FinalViewController.h
//  Quiz
//
//  Created by Daniel Brennan on 28/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinalViewController : UIViewController

@property (nonatomic) int correctAnswers;
@property (weak, nonatomic) IBOutlet UILabel *correctAnswersLabel;
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;

@end
