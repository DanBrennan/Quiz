//
//  FinalViewController.m
//  Quiz
//
//  Created by Daniel Brennan on 28/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import "FinalViewController.h"

@interface FinalViewController ()

@end

@implementation FinalViewController

@synthesize correctAnswers = _correctAnswers;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.correctAnswersLabel.text = [NSString stringWithFormat:@"%d",self.correctAnswers];
    
    
    switch (self.correctAnswers)
    {
        case 0:
            self.correctAnswersLabel.text = @"0 out of 20";
            self.messageTextView.text = @"Back to the training pitch for you!";
            break;
        case 1:
            self.correctAnswersLabel.text = @"1 out of 20";
            self.messageTextView.text = @"Are you really a Manchester United fan!?";
            break;
        case 2:
            self.correctAnswersLabel.text = @"2 out of 20";
            self.messageTextView.text = @"Guessing doesnt pay";
            break;
        case 3:
            self.correctAnswersLabel.text = @"3 out of 20";
            self.messageTextView.text = @"Don't be asking for a pay rise!";
            break;
        case 4:
            self.correctAnswersLabel.text = @"4 out of 20";
            self.messageTextView.text = @"Oh dear! You can do better surely!?";
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
