//
//  FinalViewController.m
//  Quiz
//
//  Created by Daniel Brennan on 28/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import "FinalViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "SavedGameData.h"

@interface FinalViewController ()
{
    AVAudioPlayer *_audioPlayer;
    BOOL _bannerIsVisible;
    ADBannerView *_adBanner;
}

@end

@implementation FinalViewController

@synthesize correctAnswers = _correctAnswers;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    [self updateScores];
    
    //self.correctAnswersLabel.text = [NSString stringWithFormat:@"%d",self.correctAnswers];
    
    switch (self.correctAnswers)
    {
        case 0:
            self.correctAnswersLabel.text = @"0 out of 15";
            self.messageTextView.text = @"Are you really a Manchester United fan!?";
            [self playSound:@"%@/laugh.wav"];
            break;
        case 1:
            self.correctAnswersLabel.text = @"1 out of 15";
            self.messageTextView.text = @"Fergie turns the hair dryer on you!";
            [self playSound:@"%@/laugh.wav"];
            break;
        case 2:
            self.correctAnswersLabel.text = @"2 out of 15";
            self.messageTextView.text = @"Did you just guess?  I'd expect a City fan to score more than 2!";
            [self playSound:@"%@/laugh.wav"];
            break;
        case 3:
            self.correctAnswersLabel.text = @"3 out of 15";
            self.messageTextView.text = @"Don't be asking for a pay rise!";
            [self playSound:@"%@/laugh.wav"];
            break;
        case 4:
            self.correctAnswersLabel.text = @"4 out of 15";
            self.messageTextView.text = @"Back to the training pitch for you!";
            [self playSound:@"%@/crowdgroan.wav"];
            break;
        case 5:
            self.correctAnswersLabel.text = @"5 out of 15";
            self.messageTextView.text = @"Is this too hard for you?  Time for some research";
            [self playSound:@"%@/crowdgroan.wav"];
            break;
        case 6:
            self.correctAnswersLabel.text = @"6 out of 15";
            self.messageTextView.text = @"Come on - you can do better than that!!";
            [self playSound:@"%@/crowdgroan.wav"];
            break;
        case 7:
            self.correctAnswersLabel.text = @"7 out of 15";
            self.messageTextView.text = @"Hmmmm.  I believe you can get 10 if you try a bit harder";
            [self playSound:@"%@/crowdgroan.wav"];
            break;
        case 8:
            self.correctAnswersLabel.text = @"8 out of 15";
            self.messageTextView.text = @"Not a bad attempt, but if you don't improve, United might sell you";
            [self playSound:@"%@/politecheer.wav"];
            break;
        case 9:
            self.correctAnswersLabel.text = @"9 out of 15";
            self.messageTextView.text = @"Encouraging signs.  I predict a bright future if you put some more effort in";
            [self playSound:@"%@/politecheer.wav"];
            break;
        case 10:
            self.correctAnswersLabel.text = @"10 out of 15";
            self.messageTextView.text = @"Well played.  Not quite Man of the match today, but a great performance";
            [self playSound:@"%@/politecheer.wav"];
            break;
        case 11:
            self.correctAnswersLabel.text = @"11 out of 15";
            self.messageTextView.text = @"Excellent score.  But with some extra training you could be the best!";
            [self playSound:@"%@/politecheer.wav"];
            break;
        case 12:
            self.correctAnswersLabel.text = @"12 out of 15";
            self.messageTextView.text = @"You know your stuff.  A true Manchester United fan.";
            [self playSound:@"%@/politecheer.wav"];
            break;
        case 13:
            self.correctAnswersLabel.text = @"13 out of 15";
            self.messageTextView.text = @"Champions League qualification easily secured.  Congratulations";
            [self playSound:@"%@/cheeringcrowd.wav"];
            break;
        case 14:
            self.correctAnswersLabel.text = @"14 out of 15";
            self.messageTextView.text = @"Almost perfection!  United would sign you up!";
            [self playSound:@"%@/cheeringcrowd.wav"];
            break;
        case 15:
            self.correctAnswersLabel.text = @"15 out of 15";
            self.messageTextView.text = @"And Solsjaker has won it!!  Bring on the Treble.  Number 1 United fan!";
            [self playSound:@"%@/cheeringcrowd.wav"];
            break;
        
    }
    
}

- (void)playSound:(NSString *) soundFile{
    
    // Construct URL to sound file
    NSString *path = [NSString stringWithFormat:soundFile, [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [_audioPlayer play];
    
  
    
}
- (IBAction)playAgainPressed:(id)sender {
    [_audioPlayer stop];
}

- (void) updateScores{
    
    
    //passed level?
    //
//    
//    if ([[SavedGameData sharedGameData] passedLevel:self.correctAnswers]){
//        
//    };
    
    
    if (self.correctAnswers > [SavedGameData sharedGameData].highScore){
        [SavedGameData sharedGameData].highScore = self.correctAnswers;
    }
    

    if (self.correctAnswers > 10){
        [SavedGameData sharedGameData].currentLevel += 1;
    }
    
    [SavedGameData sharedGameData].totalScore += self.correctAnswers;
    [SavedGameData sharedGameData].gamesPlayed += 1;
    [SavedGameData sharedGameData].averageScore = [SavedGameData sharedGameData].totalScore / [SavedGameData sharedGameData].gamesPlayed;

    self.totalScoreLabel.text = [NSString stringWithFormat:@"Level: %ld",[SavedGameData sharedGameData].currentLevel+1];
    self.totalGamesLabel.text = [NSString stringWithFormat:@"Total Games: %ld",[SavedGameData sharedGameData].gamesPlayed];
    self.averageScoreLabel.text = [NSString stringWithFormat:@"Average Score: %ld",[SavedGameData sharedGameData].averageScore];
    self.highScoreLabel.text = [NSString stringWithFormat:@"High Score: %ld",[SavedGameData sharedGameData].highScore];
    
    [[SavedGameData sharedGameData] save];

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

#pragma mark - iAds

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _adBanner = [[ADBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, 320, 50)];
    _adBanner.delegate = self;
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!_bannerIsVisible)
    {
        // If banner isn't part of view hierarchy, add it
        if (_adBanner.superview == nil)
        {
            [self.view addSubview:_adBanner];
        }
        
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        
        // Assumes the banner view is just off the bottom of the screen.
        banner.frame = CGRectOffset(banner.frame, 0, -banner.frame.size.height);
        
        [UIView commitAnimations];
        
        _bannerIsVisible = YES;
    }
}



- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"Failed to retrieve ad");
    
    if (_bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        
        // Assumes the banner view is placed at the bottom of the screen.
        banner.frame = CGRectOffset(banner.frame, 0, banner.frame.size.height);
        
        [UIView commitAnimations];
        
        _bannerIsVisible = NO;
    }
}

- (void) viewWillDisappear:(BOOL)animated
{
    [_adBanner removeFromSuperview];
    _adBanner.delegate = nil;
    _adBanner = nil;
}

@end
