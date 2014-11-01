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
#import <AVFoundation/AVFoundation.h>


@interface QuestionViewController ()
{
    int questionNumber;
    int correctAnswers;
    int countdownNumber;
    BOOL _bannerIsVisible;
    ADBannerView *_adBanner;
    AVAudioPlayer *_audioPlayer;
    AVAudioPlayer *_ticking;
    
}

@end

@implementation QuestionViewController

@synthesize questions = _questions;
@synthesize quizData = _quizData;
//@synthesize category = _category;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Construct URL to ticking sound file
    NSString *path = [NSString stringWithFormat:@"%@/background.wav", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    _ticking = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    _ticking.numberOfLoops = -1;
    [_ticking play];
    
    
    
    [self playSound:@"%@/whistle.wav"];
    
    self.questions = [[ReadData alloc] getQuizData];
    questionNumber = 0;
    [self loadQuestion];
}

- (void)timerCount{
    
    if (countdownNumber != 0){
        countdownNumber = countdownNumber - 1;
        self.progressView.progress = self.progressView.progress + 1.0/7;
    }
    else{
        [self playSound:@"%@/incorrect.aiff"];
        [Timer invalidate];
        [self questionTransition];
    }
    
    
}

- (void) questionTransition{
 
    questionNumber ++;

    [self loadQuestion];
    
}

- (void)loadQuestion {
    
//    NSLog(@"LoadQuestion %d", questionNumber);
//    NSLog(@"TotalQuestions %lu", (unsigned long)self.questions.count);
   
    if (questionNumber >= self.questions.count) {

        [Timer invalidate];
        self.quizData = nil;
        self.questions = nil;
        self.answerOneButton.hidden=YES;
        self.answerTwoButton.hidden=YES;
        self.answerThreeButton.hidden=YES;
        self.answerFourButton.hidden=YES;
        self.questionTextView.hidden=YES;
        self.progressView.hidden=YES;
        
        self.getScoreButton.enabled=YES;
        self.getScoreButton.hidden=NO;
        [_ticking stop];
        [self playSound:@"%@/whistle.wav"];
    
    }
    else {
        

        self.progressView.progress = 0.0;
        
        
        [Timer invalidate];
        countdownNumber = 7;
        Timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerCount) userInfo:nil repeats:YES];
        
        self.quizData = [self.questions objectAtIndex:questionNumber];
        
        self.questionTextView.text = self.quizData.question;
        
        
        self.answerOneButton.titleLabel.numberOfLines = 2;
        self.answerOneButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.answerTwoButton.titleLabel.numberOfLines = 2;
        self.answerTwoButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.answerThreeButton.titleLabel.numberOfLines = 2;
        self.answerThreeButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.answerFourButton.titleLabel.numberOfLines = 2;
        self.answerFourButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
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
        [self playSound:@"%@/correct.aiff"];
    }
    else {
        [self playSound:@"%@/incorrect.aiff"];
    }
    
    [self questionTransition];

}
- (IBAction)answerTwoPressed:(id)sender {
    
    if ([self.answerTwoButton.titleLabel.text isEqualToString:self.quizData.correctAnswer]) {
        correctAnswers ++;
        [self playSound:@"%@/correct.aiff"];
    }
    else {
        [self playSound:@"%@/incorrect.aiff"];
    }
    
    [self questionTransition];

}
- (IBAction)answerThreePressed:(id)sender {
    
    if ([self.answerThreeButton.titleLabel.text isEqualToString:self.quizData.correctAnswer]) {
        correctAnswers ++;
        [self playSound:@"%@/correct.aiff"];
    }
    else {
        [self playSound:@"%@/incorrect.aiff"];
    }
    
    [self questionTransition];
}

- (IBAction)answerFourPressed:(id)sender {
    
    if ([self.answerFourButton.titleLabel.text isEqualToString:self.quizData.correctAnswer]) {
        correctAnswers ++;
        [self playSound:@"%@/correct.aiff"];
    }
    else {
        [self playSound:@"%@/incorrect.aiff"];
    }
    
    [self questionTransition];
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

- (void)playSound:(NSString *) soundFile{
    
    // Construct URL to sound file
    NSString *path = [NSString stringWithFormat:soundFile, [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [_audioPlayer play];
    
}



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
