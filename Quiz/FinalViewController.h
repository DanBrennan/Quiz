//
//  FinalViewController.h
//  Quiz
//
//  Created by Daniel Brennan on 28/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface FinalViewController : UIViewController<ADBannerViewDelegate>

@property (nonatomic) int correctAnswers;
@property (weak, nonatomic) IBOutlet UILabel *correctAnswersLabel;
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;
@property (weak, nonatomic) IBOutlet UILabel *highScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalGamesLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalScoreLabel;

@end
