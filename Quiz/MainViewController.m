//
//  ViewController.m
//  Quiz
//
//  Created by Daniel Brennan on 28/10/2014.
//  Copyright (c) 2014 Daniel Brennan. All rights reserved.
//

#import "MainViewController.h"
#import "QuestionViewController.h"
#import "SavedGameData.h"

@interface MainViewController ()
{
    NSString *category;
    BOOL _bannerIsVisible;
    ADBannerView *_adBanner;

}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.levelLabel.text = [NSString stringWithFormat:@"Level: %ld",[SavedGameData sharedGameData].currentLevel];
    
    CABasicAnimation *theAnimation;
    
    theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    theAnimation.duration=1.0;
    theAnimation.repeatCount=HUGE_VALF;
    theAnimation.autoreverses=YES;
    theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimation.toValue=[NSNumber numberWithFloat:0.0];
    [self.playButton.layer addAnimation:theAnimation forKey:@"animateOpacity"]; //myButton.layer instead of
    
    
    
    switch ([SavedGameData sharedGameData].currentLevel)
    {
        case 0:
            self.levelLabel.text = [NSString stringWithFormat:@"Trainee"];
            break;
        case 1:
            self.levelLabel.text = [NSString stringWithFormat:@"Reserve Team Player"];
            break;
        case 2:
            self.levelLabel.text = [NSString stringWithFormat:@"First Team Player"];
            break;
        case 3:
            self.levelLabel.text = [NSString stringWithFormat:@"FA Cup Winner"];
            break;
        case 4:
            self.levelLabel.text = [NSString stringWithFormat:@"Premier League Winner"];
            break;
        case 5:
            self.levelLabel.text = [NSString stringWithFormat:@"Champions League Winner"];
            break;
        default:
            self.levelLabel.text = [NSString stringWithFormat:@""];
    }
    
   // self.levelLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ribbon.png"]];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)resetScoresPressed:(id)sender {
    
    [[SavedGameData sharedGameData] reset];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
    QuestionViewController *questionViewController = (QuestionViewController *)navController.topViewController;
    
    questionViewController.category = @"generalQuiz";
    //_bannerIsVisible = NO;
    
    
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
